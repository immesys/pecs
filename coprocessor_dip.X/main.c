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

    //Event loop
    DBG2_TRIS = 0;
    DBG2 = 0;
    DBG2 = 1;
    DBG2 = 0;
    init_vals();
    lcd_init();
   // blit_rect(0,0,ASSET_UPARROW_WIDTH,ASSET_UPARROW_HEIGHT,ASSET_UPARROW_ADDR);
    //blit_rect(5,5,ASSET_UP2_WIDTH+5,ASSET_UP2_HEIGHT+5,ASSET_UP2_ADDR);
    //blit_rect(0,0,ASSET_FULLBARS_WIDTH,ASSET_FULLBARS_HEIGHT,ASSET_FULLBARS_ADDR);
    //blit_window(5, 5, 50, 50,
    //             133, 119, ASSET_FULLBARS_WIDTH, ASSET_FULLBARS_HEIGHT, ASSET_FULLBARS_ADDR);
   // speedtest();
    //gen_qr_code("http://pecs.cal-sdb.org/AABBCCDD");
    //gen_fake_code();
    //unpack();
   // draw_qr_code();
   // while(1);
    tp_calibrate();
    draw_bar_screen_full();
    while(1)
    {
        poll_screen();
        poll_tp();
    }
    //draw_calibrate_bg();
    //draw_calibrate_point(40,40);
    //draw_bar_screen_full(128, 128);
    while(1);
    //blit_window(0,0, 100, 100, 0, 0, ASSET_UPARROW_WIDTH, ASSET_UPARROW_HEIGHT, ASSET_UPARROW_ADDR);
    //printf("Starting event loop\n");
    DBG2 = 0;
    DBG2 = 1;
    DBG2 = 0;
    DBG2 = 1;
    while (flashstate != fs_idle)
    {
        //check_flash_full_blit();
        check_flash_window_blit();
    }
    DBG2 = 0;
    while(1)
    {

        
   //     wave_test();
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
