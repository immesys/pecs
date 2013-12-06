


#include "global.h"
#include <stdio.h>

uint8_t heat_shadow;
uint8_t heat_origin;
uint8_t occupied;

uint8_t fans_shadow;
uint8_t fans_origin;

void set_heat(uint8_t val, uint8_t total, uint8_t origin)
{
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    if (temp > 255) temp = 255;
    val = (uint8_t) temp;
    heat_shadow = val;
    heat_origin = origin;

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
void set_fans(uint8_t val, uint8_t total, uint8_t origin)
{
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    if (temp > 255) temp = 255;
    val = (uint8_t) temp;
    fans_shadow = val;
    fans_origin = origin;
    //Some hook to update slider on the screen;
}
void heatslider(uint8_t val, uint8_t total)
{
    set_heat(val, total, SOURCE_SCREEN);
}
void send_epic_packet(uint8_t cmd, uint8_t val)
{
    uart1_wb(0xFF);
    uart1_wb(cmd);
    uart1_wb(val);
}
void fanslider(uint8_t val, uint8_t total)
{
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    temp *= 7;
    temp >>= 8;
    if (temp > 7) temp = 7;
    val = (uint8_t) temp;
    send_epic_packet(0x10, val);
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
