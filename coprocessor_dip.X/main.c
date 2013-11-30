/* 
 * File:   main.c
 * Author: immesys
 *
 * Created on November 22, 2013, 8:53 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "global.h"

#define ASSET_FULLBARS_ADDR   0x000000
#define ASSET_FULLBARS_LENGTH 0x025800
#define ASSET_FULLBARS_WIDTH  320
#define ASSET_FULLBARS_HEIGHT 240
#define ASSET_UPARROW_ADDR   0x025800
#define ASSET_UPARROW_LENGTH 0x004e20
#define ASSET_UPARROW_WIDTH  100
#define ASSET_UPARROW_HEIGHT 100
#define ASSET_UP2_ADDR   0x02a800
#define ASSET_UP2_LENGTH 0x009c40
#define ASSET_UP2_WIDTH  200
#define ASSET_UP2_HEIGHT 100


extern void g_fill_rgb();
extern void delay_ms(uint16_t v);
extern flashstate_t flashstate;
int main()
{
    init_hw();

    //Event loop
    DBG2_TRIS = 0;
    DBG2 = 0;
    DBG2 = 1;
    DBG2 = 0;
    lcd_init();
    g_fill_rgb();
   // blit_rect(0,0,ASSET_UPARROW_WIDTH,ASSET_UPARROW_HEIGHT,ASSET_UPARROW_ADDR);
    //blit_rect(5,5,ASSET_UP2_WIDTH+5,ASSET_UP2_HEIGHT+5,ASSET_UP2_ADDR);
    //blit_rect(0,0,ASSET_FULLBARS_WIDTH,ASSET_FULLBARS_HEIGHT,ASSET_FULLBARS_ADDR);
    //blit_window(5, 5, 50, 50,
    //             133, 119, ASSET_FULLBARS_WIDTH, ASSET_FULLBARS_HEIGHT, ASSET_FULLBARS_ADDR);
    speedtest();
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
