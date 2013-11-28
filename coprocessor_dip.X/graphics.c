
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
    lcd_deselect();
}

typedef enum
{
    fs_idle,
    fs_full_blit,
    fs_window_blit
} flashstate_t;

flashstate_t flashstate;
uint32_t flash_pix_left;
uint16_t row;
uint16_t col;
uint16_t row_start;
uint16_t row_stop;
uint16_t col_start;
uint16_t col_stop;

#define GFX_TX_FULL (SPI1STATbits.SPITBF)
#define FL_TX_FULL (SPI2STATbits.SPITBF)
#define FL_REG (SPI2BUF)
#define GFX_REG (SPI1BUF)
#define FL_RX_EMPTY (SPI2STATbits.SRXMPT)
#define GFX_RX_EMPTY (SPI1STATbits.SRXMPT)

void blit_rect(uint16_t sx, uint16_t sy, uint16_t ex, uint16_t ey, uint32_t start_address)
{
    //The X dim is X2 because each column is two byts
    row = sy;
    col = sx*2;
    row_start = sy;
    col_start = sx*2;
    row_stop = ey;
    col_stop = ex*2;
    flash_pix_left = (ex-sx)*(ey-sy)*2;

    //Start flash read
    flash_deselect();
    flash_select();
    spi2_w_b_xdiscard(0x0B);
    spi2_w_b((start_address >> 16) & 0xFF );
    spi2_w_b((start_address >> 8 ) & 0xFF );
    spi2_w_b((start_address) & 0xFF );
    spi2_w_b_xdiscard(0xd0); //First dummy byte

    //Start GFX write
    lcd_set_cursor(row, col);
    lcd_start_gfx();

}
inline void check_flash()
{
    uint8_t b;

    //Make sure we keep request pipeline full
    if(flash_pix_left > 0 && !FL_TX_FULL)
    {
        FL_REG = 0xdb; //Dummy Byte
        flash_pix_left--;
    }

    //Check if there is space in the GFX tx buffer
    if (GFX_TX_FULL) return;

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
        lcd_set_cursor(row, col);
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