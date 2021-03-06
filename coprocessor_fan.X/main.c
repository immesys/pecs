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

    init_hw();
   // init_vals();
 //   lcd_init();

//    reset_rht();

  //  printf ("system booting");
//    unpack();
//    tp_calibrate();

//    while(1);
 //   draw_bar_screen_full();

    uint32_t i = 0;
        while(1)
        {
            i++;
            if (i == 30000)
            {
           // uart2_wb('+');
            i = 0;
            }
                if(U1STAbits.OERR)
            {
            //    uart2_wb('%');
                U1MODEbits.UARTEN = 0;
                U1MODEbits.UARTEN = 1;
                U1STAbits.UTXEN = 1;

            }
            if(U2STAbits.OERR)
            {
                U2STAbits.OERR = 0;
            }
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
