/* 
 * File:   main.c
 * Author: immesys
 *
 * Created on November 22, 2013, 8:53 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "global.h"



void speedtest();
extern void g_fill_rgb();
extern void delay_ms(uint16_t v);
extern flashstate_t flashstate;
void fragtest();
int main()
{
    //Assign pins and whatnot
    init_hw();

    //Set up the screen values, but not sure this makes sense
    //because the epic ought to send it the latest values
    init_vals();

    //LCD initialisation incantations
    lcd_init();

    //Performed here, but also redone every time the sensor chip returns a zero
    //on the i2c
    reset_rht();

    //Unpack the QR code into a bit array
    unpack();

    //do the screen 'touch points to calibrate' prompt
    tp_calibrate();

    while(1)
    {
        poll_tp();
        poll_screen();
        rxipoll();
        poll_temps();
        poll_val_uploads();
        rxipoll();
    }

}

#if 0
void speedtest()
{
    int16_t x = 5;
    int16_t y = 10;
    int8_t xi = 1;
    int8_t yi = 1;
    while(1)
    {
        if(x <= 0) xi = 1;
        if(x >= 320 - ASSET_UPARROW_WIDTH) xi = -1;
        if(y <= 0) yi = 1;
        if(y >= 240 - ASSET_UPARROW_HEIGHT) yi = -1;
        DBG2 = 1;
        blit_window(x,y, 100, 100, 0, 0, ASSET_UPARROW_WIDTH, ASSET_UPARROW_HEIGHT, ASSET_UPARROW_ADDR);
        while (flashstate != fs_idle)
        {
            //check_flash_full_blit();
            check_flash_window_blit();
        }
        DBG2 = 0;
        x += xi;
        y += yi;
    }
}

void fragtest()
{
    DBG2 = 1;
    uint16_t x;
    uint16_t y;
    for (x = 0; x < 10; x++)
    {
        for (y = 0; y < 10; y++)
        {
            blit_window(x*15,y*15, 10, 10, x*10, y*10, ASSET_UPARROW_WIDTH, ASSET_UPARROW_HEIGHT, ASSET_UPARROW_ADDR);
            while (flashstate != fs_idle)
            {
                //check_flash_full_blit();
                check_flash_window_blit();
            }
        }
    }
    DBG2 = 0;
}
#endif
