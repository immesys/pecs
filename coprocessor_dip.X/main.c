/* 
 * File:   main.c
 * Author: immesys
 *
 * Created on November 22, 2013, 8:53 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "global.h"

extern void g_fill_rgb();
extern void delay_ms(uint16_t v);
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
    //printf("Starting event loop\n");
    while(1)
    {
        DBG2 = 0;
        DBG2 = 1;
        DBG2 = 0;
   //     wave_test();
    }
}

