
#include "global.h"
#include <stdio.h>

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

void g_fill_white()
{
    lcd_set_cursor(0, 0);
    lcd_write_index(0x022);
    uint16_t x, y;

    lcd_start_gfx();
    for (x = 0; x < LCD_X; x++)
    {
        for (y = 0; y < LCD_Y; y++)
        {
            lcd_write_data_body(0xFFFF);
        }
    }
    lcd_end_gfx();
}

void fill_grey_screen()
{
    lcd_set_cursor(0, 0);
    lcd_write_index(0x022);
    uint16_t x, y;

    lcd_start_gfx();
    for (x = 0; x < LCD_X; x++)
    {
        for (y = 0; y < LCD_Y; y++)
        {
            lcd_write_data_body(0b0011100111100111);
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

point_t measured_tp_points [3];
point_t displayed_tp_points [3] = { {45,45}, {270, 45}, {190,190} };
matrix_t cmatrix;

uint8_t blue_val;
uint8_t red_val;
uint8_t new_blue_val;
uint8_t new_red_val;

#define THRESHOLD 2

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
        poll_tp();
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

    _IPL = 6;
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
      //  poll_tp();
        lcd_set_cursor(row, col/2);
        lcd_start_gfx();
    }

    while (GFX_TX_FULL);
    while (FL_RX_EMPTY);
    while (!GFX_RX_EMPTY) b = GFX_REG;
    col++;
    b = FL_REG;
    GFX_REG = b;
    _IPL = 0;
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
        poll_tp();
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
    blocking_wblit(BLUEBAR2_POSITION_X + v + V_OFFSET,
                   BLUEBAR2_POSITION_Y,
                   ASSET_BLUEBAR2_WIDTH - v - V_OFFSET + BG_OVERFLOW,
                   ASSET_BLUEBAR2_HEIGHT,
                   BLUEBAR2_POSITION_X + v + V_OFFSET,
                   BLUEBAR2_POSITION_Y,
                   ASSET_BARS_WIDTH,
                   ASSET_BARS_HEIGHT,
                   ASSET_BARS_ADDR);
    blocking_wblit(BLUEBAR2_POSITION_X,
                   BLUEBAR2_POSITION_Y,
                   v + V_OFFSET,
                   ASSET_BLUEBAR2_HEIGHT,
                   0, 0,
                   ASSET_BLUEBAR2_WIDTH,
                   ASSET_BLUEBAR2_HEIGHT,
                   ASSET_BLUEBAR2_ADDR);
 //   blocking_ovblit(BLUEBAR2_POSITION_X + v + V_OFFSET - (ASSET_SLIDER_KNOB_WIDTH>>1), BLUEBAR2_POSITION_Y + 1, ASSET_SLIDER_KNOB_ADDR, ASSET_SLIDER_KNOB_LENGTH);
}
void draw_red_bar_full(uint8_t v)
{
        //First draw the required amount of background
    blocking_wblit(REDBAR2_POSITION_X + v + V_OFFSET, //SX
                   REDBAR2_POSITION_Y,                //SY
                   ASSET_REDBAR2_WIDTH - v - V_OFFSET + BG_OVERFLOW, //WIDTH
                   ASSET_REDBAR2_HEIGHT,               //HEIGHT
                   REDBAR2_POSITION_X + v + V_OFFSET,
                   REDBAR2_POSITION_Y,
                   ASSET_BARS_WIDTH,
                   ASSET_BARS_HEIGHT,
                   ASSET_BARS_ADDR);
    blocking_wblit(REDBAR2_POSITION_X,
                   REDBAR2_POSITION_Y,
                   v + V_OFFSET,
                   ASSET_REDBAR2_HEIGHT,
                   0, 0,
                   ASSET_REDBAR2_WIDTH,
                   ASSET_REDBAR2_HEIGHT,
                   ASSET_REDBAR2_ADDR);
  //  blocking_ovblit(REDBAR2_POSITION_X + v + V_OFFSET - (ASSET_SLIDER_KNOB_WIDTH>>1), REDBAR2_POSITION_Y + 1, ASSET_SLIDER_KNOB_ADDR, ASSET_SLIDER_KNOB_LENGTH);
}
void draw_bg()
{
    blocking_wblit(0,0,320,240,0,0,320,240,ASSET_BARS_ADDR);
}
inline void draw_calibrate_bg()
{
    blocking_wblit(0,0,ASSET_CALIBRATE_WIDTH,ASSET_CALIBRATE_HEIGHT,0,0,ASSET_CALIBRATE_WIDTH,ASSET_CALIBRATE_HEIGHT,ASSET_CALIBRATE_ADDR);
}
#ifdef ASSET_PECS_ADDR
inline void draw_pecs_bg()
{
    blocking_wblit(0,0,
                   ASSET_PECS_WIDTH,ASSET_PECS_HEIGHT,
                   0,0,
                   ASSET_PECS_WIDTH,ASSET_PECS_HEIGHT,
                   ASSET_PECS_ADDR);
}
#endif
inline void erase_calibrate_point(uint16_t x, uint16_t y)
{
    blocking_wblit(x-(ASSET_POINT_WIDTH+1)/2, y - (ASSET_POINT_HEIGHT+1)/2,
                   ASSET_POINT_WIDTH, ASSET_POINT_HEIGHT,
                   x-(ASSET_POINT_WIDTH+1)/2, y - (ASSET_POINT_HEIGHT+1)/2,
                   ASSET_CALIBRATE_WIDTH, ASSET_CALIBRATE_HEIGHT,
                   ASSET_CALIBRATE_ADDR);
}
inline void draw_calibrate_point(uint16_t x, uint16_t y)
{
    blocking_wblit(x-(ASSET_POINT_WIDTH+1)/2, y - (ASSET_POINT_HEIGHT+1)/2,
                   ASSET_POINT_WIDTH, ASSET_POINT_HEIGHT,
                   0, 0,
                   ASSET_POINT_WIDTH, ASSET_POINT_HEIGHT,
                   ASSET_POINT_ADDR);
}
void draw_bar_screen_full(void)
{
    draw_bg();
    draw_blue_bar_full(red_val);
    draw_red_bar_full(blue_val);
}


void tp_set_calibration_matrix(void)
{
    cmatrix.Divider = ((measured_tp_points[0].x - measured_tp_points[2].x) * (measured_tp_points[1].y - measured_tp_points[2].y)) -
                      ((measured_tp_points[1].x - measured_tp_points[2].x) * (measured_tp_points[0].y - measured_tp_points[2].y));
    if (cmatrix.Divider == 0)
    {
        while(1) tc(0xDE05);
    }
    /* A£?((XD0£­XD2) (Y1£­Y2)£­(XD1£­XD2) (Y0£­Y2))£¯K	*/
    cmatrix.An = ((displayed_tp_points[0].x - displayed_tp_points[2].x) * (measured_tp_points[1].y - measured_tp_points[2].y)) -
                 ((displayed_tp_points[1].x - displayed_tp_points[2].x) * (measured_tp_points[0].y - measured_tp_points[2].y)) ;
	/* B£?((X0£­X2) (XD1£­XD2)£­(XD0£­XD2) (X1£­X2))£¯K	*/
    cmatrix.Bn = ((measured_tp_points[0].x - measured_tp_points[2].x) * (displayed_tp_points[1].x - displayed_tp_points[2].x)) -
                 ((displayed_tp_points[0].x - displayed_tp_points[2].x) * (measured_tp_points[1].x - measured_tp_points[2].x)) ;
    /* C£?(Y0(X2XD1£­X1XD2)+Y1(X0XD2£­X2XD0)+Y2(X1XD0£­X0XD1))£¯K */
    cmatrix.Cn = (measured_tp_points[2].x * displayed_tp_points[1].x - measured_tp_points[1].x * displayed_tp_points[2].x) * measured_tp_points[0].y +
                 (measured_tp_points[0].x * displayed_tp_points[2].x - measured_tp_points[2].x * displayed_tp_points[0].x) * measured_tp_points[1].y +
                 (measured_tp_points[1].x * displayed_tp_points[0].x - measured_tp_points[0].x * displayed_tp_points[1].x) * measured_tp_points[2].y ;
    /* D£?((YD0£­YD2) (Y1£­Y2)£­(YD1£­YD2) (Y0£­Y2))£¯K	*/
    cmatrix.Dn = ((displayed_tp_points[0].y - displayed_tp_points[2].y) * (measured_tp_points[1].y - measured_tp_points[2].y)) -
                 ((displayed_tp_points[1].y - displayed_tp_points[2].y) * (measured_tp_points[0].y - measured_tp_points[2].y)) ;
    /* E£?((X0£­X2) (YD1£­YD2)£­(YD0£­YD2) (X1£­X2))£¯K	*/
    cmatrix.En = ((measured_tp_points[0].x - measured_tp_points[2].x) * (displayed_tp_points[1].y - displayed_tp_points[2].y)) -
                 ((displayed_tp_points[0].y - displayed_tp_points[2].y) * (measured_tp_points[1].x - measured_tp_points[2].x)) ;
    /* F£?(Y0(X2YD1£­X1YD2)+Y1(X0YD2£­X2YD0)+Y2(X1YD0£­X0YD1))£¯K */
    cmatrix.Fn = (measured_tp_points[2].x * displayed_tp_points[1].y - measured_tp_points[1].x * displayed_tp_points[2].y) * measured_tp_points[0].y +
                 (measured_tp_points[0].x * displayed_tp_points[2].y - measured_tp_points[2].x * displayed_tp_points[0].y) * measured_tp_points[1].y +
                 (measured_tp_points[1].x * displayed_tp_points[0].y - measured_tp_points[0].x * displayed_tp_points[1].y) * measured_tp_points[2].y ;
}



uint8_t tp_multisample_xy_raw(point_t *out)
{
    uint8_t count = 0;
  //  uint16_t tpx, tpy;
    int32_t buffer [2][9];
    int32_t temp[3];
    int32_t m0, m1, m2;
    uint16_t sx,sy;

    do
    {
        tp_get_raw_xy(&sx, &sy);
        buffer[0][count] = sx;
        buffer[1][count] = sy;
        count++;
    } while( !TP_IRQ && count < 9);

    if (count == 9)
    {
        //X
        temp[0] = ( buffer[0][0] + buffer[0][1] + buffer[0][2] ) / 3;
        temp[1] = ( buffer[0][3] + buffer[0][4] + buffer[0][5] ) / 3;
        temp[2] = ( buffer[0][6] + buffer[0][7] + buffer[0][8] ) / 3;

        /* Calculate the three groups of data */
        m0 = temp[0] - temp[1];
        m1 = temp[1] - temp[2];
        m2 = temp[2] - temp[0];

        /* Absolute value of the above difference */
        m0 = m0 > 0 ? m0 : (-m0);
        m1 = m1 > 0 ? m1 : (-m1);
        m2 = m2 > 0 ? m2 : (-m2);

        if( m0 > THRESHOLD  &&  m1 > THRESHOLD  &&  m2 > THRESHOLD )
        {
            return 0;
        }
        /* Calculating their average value */
        if( m0 < m1 )
        {
            if( m2 < m0 )
            {
                out->x = ( temp[0] + temp[2] ) / 2;
            }
            else
            {
                out->x = ( temp[0] + temp[1] ) / 2;
            }
        }
        else if(m2<m1)
        {
            out->x = ( temp[0] + temp[2] ) / 2;
        }
        else
        {
            out->x = ( temp[1] + temp[2] ) / 2;
        }
        /* calculate the average value of Y */
        temp[0] = ( buffer[1][0] + buffer[1][1] + buffer[1][2] ) / 3;
        temp[1] = ( buffer[1][3] + buffer[1][4] + buffer[1][5] ) / 3;
        temp[2] = ( buffer[1][6] + buffer[1][7] + buffer[1][8] ) / 3;

        m0 = temp[0] - temp[1];
        m1 = temp[1] - temp[2];
        m2 = temp[2] - temp[0];

        m0 = m0 > 0 ? m0 : (-m0);
        m1 = m1 > 0 ? m1 : (-m1);
        m2 = m2 > 0 ? m2 : (-m2);
        if( m0 > THRESHOLD && m1 > THRESHOLD && m2 > THRESHOLD )
        {
            return 0;
        }

        if( m0 < m1 )
        {
            if( m2 < m0 )
            {
                out->y = ( temp[0] + temp[2] ) / 2;
            }
            else
            {
                out->y = ( temp[0] + temp[1] ) / 2;
            }
        }
        else if( m2 < m1 )
        {
            out->y = ( temp[0] + temp[2] ) / 2;
        }
        else
        {
            out->y = ( temp[1] + temp[2] ) / 2;
        }
        return 1;
    }
    else
    {
        return 0;
    }
}
uint8_t tp_get_calibrated_point(uint16_t *x, uint16_t *y)
{
    point_t raw;
    int32_t xx, yy;

    if(cmatrix.Divider == 0 || !tp_multisample_xy_raw(&raw))
    {
        return 0;
    }
    xx =  ( (cmatrix.An * raw.x) +
                      (cmatrix.Bn * raw.y) +
                       cmatrix.Cn
                     ) / cmatrix.Divider ;
    yy =  ( (cmatrix.Dn * raw.x) +
                       (cmatrix.En * raw.y) +
                        cmatrix.Fn
                     ) / cmatrix.Divider ;
    *x = (uint16_t)xx;
    *y = (uint16_t)yy;
    return 1;
}
void tp_calibrate(void)
{
    uint8_t i;
    uint8_t rv;
    draw_calibrate_bg();
    for (i = 0; i < 3; i++)
    {
        rv = 0;
        draw_calibrate_point(displayed_tp_points[i].x, displayed_tp_points[i].y);
        
        do
        {
            if (TP_IRQ) continue;
            rv = tp_multisample_xy_raw(&measured_tp_points[i]);
        } while (rv == 0);
        if( i!= 2)
        {
            erase_calibrate_point(displayed_tp_points[i].x, displayed_tp_points[i].y);
            delay_ms(500);
        }
    }
  //  draw_pecs_bg();
    tp_set_calibration_matrix();
  /*  while(1)
    {
        uint16_t x,y;
        rv = tp_get_calibrated_point(&x, &y);
        if (rv)
            draw_calibrate_point(x, y);
    }*/
}

extern
inline void do_screen_touch(uint16_t x, uint16_t y)
{
    int16_t nv;

    if (x >= BOTH_TP_START_X && x < BOTH_TP_END_X)
    {
        if (y >= RED_TP_START_Y && y <= RED_TP_END_Y)
        {
            nv = x - REDBAR2_POSITION_X - V_OFFSET;
            if (nv < 0) nv = 0;
            if (nv > MAX_V) nv = MAX_V;
            new_red_val = nv;
        }
        if (y >= BLUE_TP_START_Y && y <= BLUE_TP_END_Y)
        {
            nv = x - BLUEBAR2_POSITION_X - V_OFFSET;
            if (nv < 0) nv = 0;
            if (nv > MAX_V) nv = MAX_V;
            new_blue_val = nv;
        }
    }
}
void init_vals()
{
    blue_val = 0;
    red_val = 0;
    new_red_val = 0;
    new_blue_val = 0;
}

uint8_t screen_tap;
screen_state_t screen_state = ss_qr_entry;
uint32_t last_activity_time;

void poll_tp()
{
   // uart2_wb('.');
    static split_u32_t last_time;
    split_u32_t time;
    time.u16_low = TMR2;
    time.u16_high = TMR3HLD;
    if(time.u32 - last_time.u32 > TP_POLL_THRESHOLD && TP_IRQ == 0)
    {
        uint16_t xx, yy;
        if(tp_get_calibrated_point(&xx, &yy))
        {
            last_time = time;
            if (screen_state == ss_bars)
            {
                do_screen_touch(xx,yy);
            }
            screen_tap = 1;
        }
    }
}




#define HUS_PER_IDLEDOWN 10000L

#define HUS_TIMEOUT 50000000L
void poll_screen()
{
    static uint16_t bl_countdown;
    static split_u32_t last_time;
    
    split_u32_t time;
    time.u16_low = TMR2;
    time.u16_high = TMR3HLD;

    switch(screen_state)
    {
        case ss_bars:
        {
            if (screen_tap)
            {
                last_activity_time = time.u32;
                screen_tap = 0;
            }
            if (new_red_val != red_val)
            {
                red_val = new_red_val;
                draw_red_bar_full(new_red_val);

            }
            if (new_blue_val != blue_val)
            {
                blue_val = new_blue_val;
                draw_blue_bar_full(new_blue_val);
            }
            if ((time.u32 - last_activity_time) > HUS_TIMEOUT)
            {
                bl_countdown = 255;
                screen_state = ss_active_to_idle;
            }
            break;
        }
        case ss_qr_entry:
        {
            draw_qr_code();
            LCD_BL = 255;
            screen_state = ss_qr;
            break;
        }
        case ss_bar_entry:
        {
            draw_bar_screen_full();
            screen_state = ss_bars;
        //    red_val = 0;
        //    blue_val = 0;
            break;
        }
        case ss_active_to_idle:
        {
            if(screen_tap)
            {
                screen_tap = 0;
                LCD_BL = 255;
                screen_state = ss_bars;
                last_activity_time = time.u32;
                break;
            }
            if(time.u32 - last_time.u32 > HUS_PER_IDLEDOWN)
            {
                last_time.u32 = time.u32;
                bl_countdown--;
                LCD_BL = bl_countdown;
                if (bl_countdown == 0)
                {
                    fill_grey_screen();
                    screen_state = ss_idle;
                    break;
                }
            }
            break;
        }
        case ss_qr_to_idle:
        {
            if(screen_tap)
            {
                screen_tap = 0;
                LCD_BL = 255;
                screen_state = ss_qr;
                last_activity_time = time.u32;
                break;
            }
            if(time.u32 - last_time.u32 > HUS_PER_IDLEDOWN)
            {
                last_time.u32 = time.u32;
                bl_countdown--;
                LCD_BL = bl_countdown;
                if (bl_countdown == 0)
                {
                    fill_grey_screen();
                    screen_state = ss_idle;
                    break;
                }
            }
            break;
        }
        case ss_qr:
        {
            if (screen_tap)
            {
                screen_tap = 0;
                screen_state = ss_bar_entry;
                last_activity_time = time.u32;
            }
            else
            {
                if ((time.u32 - last_activity_time) > HUS_TIMEOUT)
                {
                    bl_countdown = 255;
                    screen_state = ss_qr_to_idle;
                }
            }
            break;

        }
        case ss_idle:
        default:
        {
            if (screen_tap)
            {
                screen_tap = 0;
                screen_state = ss_qr_entry;
                last_activity_time = time.u32;
            }
            break;
        }
    }
}

uint8_t last_heat_upload = 255;
uint8_t last_fan_upload = 255;
void poll_val_uploads()
{

    if(U1STAbits.OERR)
    {
        uart2_wb('%');
        U1MODEbits.UARTEN = 0;
        U1MODEbits.UARTEN = 1;
        U1STAbits.UTXEN = 1;

    }
    if(U2STAbits.OERR)
    {
        U2STAbits.OERR = 0;
    }
    if (TP_IRQ)
    {
        if (new_red_val != last_heat_upload)
        {
            heatslider(new_red_val, MAX_V);
            last_heat_upload = new_red_val;
        }
        if (new_blue_val != last_fan_upload)
        {
            fanslider(new_blue_val, MAX_V);
            last_fan_upload = new_blue_val;
        }
    }
}
const uint8_t packed [] = {0xfe,0x2a,0x65,0xbf,0xc1,0x57,0x05,0x10,0x6e,0x8b,0x3d,0xab,0xb7,0x4d,0xd9,0x45,0xdb,0xa4,0x15,0x82,0xec,0x16,0x84,0x0d,0x07,0xfa,0xaa,0xaa,0xfe,0x01,0xe5,0xbd,0x00,0x0f,0x66,0x2b,0xb1,0x46,0xd1,0xac,0xcb,0x90,0xc9,0xcb,0xff,0x5e,0x8d,0xf5,0x95,0x28,0xb6,0xd9,0x0b,0x0d,0x6d,0x11,0x7a,0x0b,0x58,0x87,0x87,0xa4,0xba,0x03,0x5a,0xcf,0x9f,0xf2,0x16,0xa8,0xd0,0x81,0xc3,0xc8,0x12,0x99,0x53,0x55,0x1b,0x99,0x42,0x80,0x2d,0x25,0x2e,0xfc,0xd7,0xea,0x60,0x35,0x18,0x1f,0x31,0xe4,0x0c,0x68,0x79,0x70,0x33,0xd2,0x39,0xa1,0xfd,0x80,0x4b,0x6b,0x45,0xbf,0xbf,0x00,0x2b,0xd0,0x5f,0xcd,0x51,0x8b,0xad,0xfe,0x2f,0x9d,0xd2,0x9a,0x03,0xf6,0xe9,0x11,0xfd,0xa9,0x04,0xb2,0x57,0x34,0xfe,0x76,0xcb,0x90};
uint16_t code [33 * 33];
void unpack()
{
   uint8_t i;
   uint8_t k;
   uint16_t idx = 0;
   for (i = 0; i < 137 && idx < 33*33; i++)
   {
       uint8_t b = packed[i];
       for (k = 0; k < 8 && idx < 33*33; k++)
       {
           code[idx] = (b & 0x80) ? 0x000 : 0xFFFF;
           b <<= 1;
           idx ++;
       }
   }
}
#if 0
void gen_qr_code(const char* str)
{
    uint8_t tempdata[33*33];
    uint8_t w =EncodeData(3, 0, str, 32, &tempdata[0]);
    uint16_t size=((w*w)/8)+(((w*w)%8)?1:0);
    uint16_t n;
    uint16_t idx = 0;
    uint16_t bit_count = 0;
    for(n=0;n<size;n++)
    {
        int b=0;
        for(b=7;b>=0;b--)
        {
          if (((n+1)*8)-b>w*w){break;}
          if((tempdata[n] & (1 << b)) != 0)
          {
              code[idx] = 0x00;
              idx++;
          }
          else
          {
              code[idx] = 0xFF;
              idx++;
          }
          bit_count++;
        }
    }
}
#endif
void gen_fake_code()
{
    uint16_t i;
    for (i = 0; i < (33*33); i++)
    {
        if (i%2 == 0) code[i] = 0xFFFF;
        else code [i] = 0x0000;
    }
}
void draw_qr_code()
{
    g_fill_white();
    uint8_t mult = 7;
    uint8_t xoff = 44;
    uint8_t yoff = 4;
    lcd_set_cursor(xoff, yoff);
    lcd_write_index(0x022);


    uint16_t row,  col, y, rowi, coli;
    y = yoff;
    for (row = 0; row < 33; row++)
    {
        for (rowi = 0; rowi < mult; rowi++)
        {
            lcd_end_gfx();
            lcd_set_cursor(y, xoff);
            lcd_start_gfx();
            for (col = 0; col < 33; col++)
            {
                for (coli = 0; coli < mult; coli++)
                {
                    lcd_write_data_body(code[row*33 + col]);
                }
            }
            y++;
        }

    }
    lcd_end_gfx();
}