/* 
 * File:   main.c
 * Author: immesys
 *
 * Created on November 22, 2013, 8:53 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "global.h"

int main()
{
    init_hw();
    //Event loop
    DBG2_TRIS = 0;
    DBG2 = 0;
    DBG2 = 1;
    DBG2 = 0;
    printf("Starting event loop\n");
    while(1)
    {

    }
}

