


#include "global.h"
#include <stdio.h>

uint8_t heat_shadow;
uint8_t heat_origin;
uint8_t occupied;


void set_heat(uint8_t val)
{
    uint32_t temp = val;
    temp <<= 8;
    temp /= 100;
    if (temp > 255) temp = 255;
    val = (uint8_t) temp;
    heat_shadow = val;
    if(occupied) 
    {
        printf("Setting heat to %d\n",val);
        HEAT = val;
    }
    else
    {
        printf("Not occupied, skipping heat\n");
    }

}
void set_occupancy(uint8_t is_occupied)
{
    occupied = is_occupied;
    if (occupied)
    {
        HEAT = heat_shadow;
    }
    else
    {
        HEAT = 0;
    }
}
