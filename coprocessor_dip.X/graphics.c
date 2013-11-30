
#include "global.h"

/* LCD color */
#define White          0xFFFF
#define Black          0x0000
#define Grey           0xF7DE
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0


void g_fill_rgb()
{
    lcd_set_cursor(0, 0);
    lcd_write_index(0x022);
    uint16_t x, y;

    lcd_select();
    lcd_write_data_start();
    for (x = 0; x < LCD_X; x++)
    {
        for (y = 0; y < LCD_Y; y++)
        {
            lcd_write_data_body((x << 8) | y);
        }
    }
    lcd_end_gfx();
}



flashstate_t flashstate;
uint32_t flash_pix_left;
uint16_t row;
uint16_t col;
uint16_t row_start;
uint16_t row_stop;
uint16_t col_start;
uint16_t col_stop;
uint32_t flash_rowstride;
uint16_t flash_pix_per_row;
uint16_t flash_pix_left_in_row;
uint32_t flash_base_address;
uint16_t flash_pix_rows;
uint16_t flash_pix_row;

#define GFX_TX_FULL (SPI1STATbits.SPITBF)
#define FL_TX_FULL (SPI2STATbits.SPITBF)
#define FL_REG (SPI2BUF)
#define GFX_REG (SPI1BUF)
#define FL_RX_EMPTY (SPI2STATbits.SRXMPT)
#define GFX_RX_EMPTY (SPI1STATbits.SRXMPT)

void blit_rect(uint16_t sx, uint16_t sy, uint16_t width, uint16_t height, uint32_t start_address)
{
    //The X dim is X2 because each column is two byts
    flashstate = fs_full_blit;
    row = sy;
    col = sx*2;
    row_start = sy;
    col_start = sx*2;
    row_stop = sy + height;
    col_stop = (sx + width)*2;
    flash_pix_left = (width);
    flash_pix_left *= (height);
    flash_pix_left *= 2;

    //Start flash read
    flash_deselect();
    flash_select();
    spi2_w_b_xdiscard(0x0B);
    spi2_w_b((start_address >> 16) & 0xFF );
    spi2_w_b((start_address >> 8 ) & 0xFF );
    spi2_w_b((start_address) & 0xFF );
    spi2_rw_b(0xd0); //First dummy byte

    //Start GFX write
    lcd_set_cursor(row, col/2);
    lcd_start_gfx();
}
void blit_window(uint16_t img_sx, uint16_t img_sy, uint16_t width, uint16_t height,
                 uint16_t asset_sx, uint16_t asset_sy, uint16_t asset_width, uint16_t asset_height, uint32_t asset_address)
{
    flashstate = fs_window_blit;
    col_start = img_sx*2;
    row_start = img_sy;
    col_stop = (img_sx + width)*2;
    row_stop = img_sy + height;
    row = row_start;
    col = col_start;
    
    flash_pix_per_row = width*2;
    flash_pix_left_in_row = flash_pix_per_row; //We inject the first two reads now
    flash_pix_rows = height;
    flash_pix_row = 0;
    flash_rowstride = asset_width*2;
    flash_base_address = asset_address +
                         (uint32_t)asset_sy*(uint32_t)asset_width*2 +
                         (uint32_t)asset_sx*2;

    flash_begin_read(flash_base_address);

    //Start GFX write
    lcd_set_cursor(row, col/2);
    lcd_start_gfx();
}

void blit_overlay(uint16_t sx, uint16_t sy, uint32_t asset_address, uint32_t asset_length)
{
    flashstate = fs_overlay_blit;
    flash_pix_left = asset_length;
    col_start = sx;
    row_start = sy;
    flash_begin_read(asset_address);
    //lcd_set_cursor(row + row_start, col + col_start);
    lcd_start_gfx();
}

void check_flash_overlay_blit()
{
    uint8_t b;
    if (flash_pix_left > 0)
    {
        flash_pix_left--;
        FL_REG = 0xdb;
    }
    else
    {
        lcd_end_gfx();
        flashstate = fs_idle;
        flash_deselect();
        return;
    }
    while (FL_RX_EMPTY);
    b = FL_REG;
    if (b == OV_SENTINEL)
    {
        FL_REG = 0xdb;
        FL_REG = 0xdb;
        while (FL_RX_EMPTY);
        col = FL_REG;
        while (FL_RX_EMPTY);
        row = FL_REG;
        FL_REG = 0xdb;
        flash_pix_left -= 3;
        lcd_end_gfx();
        //Image stream has the thingy at the beginning
        lcd_set_cursor(row + row_start, col + col_start);
        lcd_start_gfx();
        while (FL_RX_EMPTY);
        b = FL_REG;
    }
    
    GFX_REG = b;
    while (!GFX_RX_EMPTY) b = GFX_REG;
}
/**
 * We are taking a different attitude here. We are going to assume
 * that we are moving slowly enough that the TX buffers will
 * always have space. This will be verified via logic analyser
 * later
 */
inline void check_flash_window_blit()
{
    uint8_t b;

    if (flash_pix_left_in_row == 0 && flash_pix_rows > 0)
    {
        flash_pix_left_in_row = flash_pix_per_row;
        flash_pix_rows--;
        flash_pix_row++;
        flash_begin_read(flash_base_address + (uint32_t)flash_rowstride*flash_pix_row);
    }
    if (flash_pix_left_in_row > 0)
    {   while (GFX_TX_FULL);
        while (FL_TX_FULL);
        FL_REG = 0xdb;

        flash_pix_left_in_row--;
    }

    //Check if we need to send a cursor sequence
    if (col == col_stop)
    {
        col = col_start;
        row++;
        if (row == row_stop)
        {
            flashstate = fs_idle;
            flash_deselect();
            lcd_end_gfx();
            return;
        }
        lcd_end_gfx();
        lcd_set_cursor(row, col/2);
        lcd_start_gfx();
    }

    while (GFX_TX_FULL);
    while (FL_RX_EMPTY);
    while (!GFX_RX_EMPTY) b = GFX_REG;
    col++;
    b = FL_REG;
    GFX_REG = b;

}
inline void check_flash_full_blit()
{
    uint8_t b;

    //Check if there is space in the GFX tx buffer
    if (GFX_TX_FULL) 
    {
        return;
    }
    
    //Make sure we keep request pipeline full
    if(flash_pix_left > 0 && !FL_TX_FULL)
    {
        FL_REG = 0xdb; //Dummy Byte
        flash_pix_left--;
    }
    else if (flash_pix_left == 0)
    {
        DBG2 = 0;
        DBG2 = 1;
        DBG2 = 0;
    }
    else if (FL_TX_FULL)
    {
        DBG2 = 0;
        DBG2 = 1;
        DBG2 = 0;
        DBG2 = 1;
        DBG2 = 0;
    }

    

    //Check if we need to send a cursor sequence
    if (col == col_stop)
    {
        col = col_start;
        row++;
        if (row == row_stop)
        {
            flashstate = fs_idle;
            lcd_end_gfx();
            return;
        }
        lcd_end_gfx();
        lcd_set_cursor(row, col/2);
        lcd_start_gfx();
    }

    //Check if there is still space in the GFX tx buffer
    if (GFX_TX_FULL) return;

    //Ok there is space, grab a byte from flash to send to gfx
    if (FL_RX_EMPTY) return;

    b = FL_REG;
    col++;
    GFX_REG = b;
    while (!GFX_RX_EMPTY) b = GFX_REG;
}

void blocking_wblit(uint16_t img_sx, uint16_t img_sy, uint16_t width, uint16_t height,
                   uint16_t asset_sx, uint16_t asset_sy, uint16_t asset_width, uint16_t asset_height, uint32_t asset_address)
{
    blit_window( img_sx,  img_sy,  width,  height,
                  asset_sx,  asset_sy,  asset_width,  asset_height,  asset_address);
    while(flashstate != fs_idle) check_flash_window_blit();
}
void blocking_ovblit(uint16_t sx, uint16_t sy, uint32_t asset_address, uint32_t asset_length)
{
    blit_overlay(sx,sy,asset_address,asset_length);
    while(flashstate != fs_idle) check_flash_overlay_blit();
}
void draw_blue_bar_full(uint8_t v)
{
    //First draw the required amount of background
    blocking_wblit(BLUEBAR_POSITION_X + v + V_OFFSET,
                   BLUEBAR_POSITION_Y,
                   ASSET_BLUEBAR_WIDTH - v - V_OFFSET,
                   ASSET_BLUEBAR_HEIGHT,
                   BLUEBAR_POSITION_X + v + V_OFFSET,
                   BLUEBAR_POSITION_Y,
                   ASSET_BARS_WIDTH,
                   ASSET_BARS_HEIGHT,
                   ASSET_BARS_ADDR);
    blocking_wblit(BLUEBAR_POSITION_X,
                   BLUEBAR_POSITION_Y,
                   v + V_OFFSET,
                   ASSET_BLUEBAR_HEIGHT,
                   0, 0,
                   ASSET_BLUEBAR_WIDTH,
                   ASSET_BLUEBAR_HEIGHT,
                   ASSET_BLUEBAR_ADDR);
    blocking_ovblit(BLUEBAR_POSITION_X + v + V_OFFSET - (ASSET_SLIDER_KNOB_WIDTH>>1), BLUEBAR_POSITION_Y - 2, ASSET_SLIDER_KNOB_ADDR, ASSET_SLIDER_KNOB_LENGTH);
}
void draw_red_bar_full(uint8_t v)
{
        //First draw the required amount of background
    blocking_wblit(REDBAR_POSITION_X + v + V_OFFSET, //SX
                   REDBAR_POSITION_Y,                //SY
                   ASSET_REDBAR_WIDTH - v - V_OFFSET, //WIDTH
                   ASSET_REDBAR_HEIGHT,               //HEIGHT
                   REDBAR_POSITION_X + v + V_OFFSET,
                   REDBAR_POSITION_Y,
                   ASSET_BARS_WIDTH,
                   ASSET_BARS_HEIGHT,
                   ASSET_BARS_ADDR);
   /* blocking_wblit(REDBAR_POSITION_X,
                   REDBAR_POSITION_Y,
                   v + V_OFFSET,
                   ASSET_REDBAR_HEIGHT,
                   0, 0,
                   ASSET_REDBAR_WIDTH,
                   ASSET_REDBAR_HEIGHT,
                   ASSET_REDBAR_ADDR);
    blocking_ovblit(REDBAR_POSITION_X + v + V_OFFSET - (ASSET_SLIDER_KNOB_WIDTH>>1), REDBAR_POSITION_Y - 2, ASSET_SLIDER_KNOB_ADDR, ASSET_SLIDER_KNOB_LENGTH);*/
}
void draw_bar_screen_full(uint8_t redval, uint8_t blueval)
{
   // draw_blue_bar_full(100);
    draw_red_bar_full(100);
}