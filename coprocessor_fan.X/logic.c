


#include "global.h"
#include <stdio.h>

uint8_t heat_shadow;
uint8_t heat_origin;
uint8_t occupied;

uint8_t fans_shadow;
uint8_t fans_origin;

uint16_t last_heat = 0;

extern uint8_t new_red_val;
extern uint8_t new_blue_val;

void set_heat(uint8_t val, uint8_t total, uint8_t origin)
{
    printf("Setting heat\n");
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    if (temp > 255) temp = 255;
    val = (uint8_t) temp;
    heat_shadow = val;
    heat_origin = origin;

    if (val > last_heat)
    {
        uint16_t vv;
        for (vv = last_heat; vv < val; vv++)
        {
            HEAT = vv;
            delay_ms(50);
        }
        last_heat = val;
        HEAT = val;
    }
    else
    {
        last_heat = val;
        HEAT = val;
    }
    printf("Done\n");
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

    temp = val;
    temp *= MAX_V;
    temp >>= 8;
    new_blue_val = temp;
    //Some hook to update slider on the screen;
}
void heatslider(uint8_t val, uint8_t total)
{
    set_heat(val, total, SOURCE_SCREEN);
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    temp *= 105;
    temp >>= 8;
    if (temp > 100) temp = 100;
    val = (uint8_t) temp;
    send_epic_packet(0x11, val);
}
void send_epic_packet(uint8_t cmd, uint8_t val)
{
    uart1_wb(0xFF);
    delay_hus(150);
    uart1_wb(cmd);
    delay_hus(150);
    uart1_wb(val);
    delay_hus(200);
}
void fanslider(uint8_t val, uint8_t total)
{
    uint32_t temp = val;
    temp <<= 8;
    temp /= total;
    temp *= 8;
    temp >>= 8;
    if (temp > 7) temp = 7;
    val = (uint8_t) temp;
    send_epic_packet(0x10, val);
}
void set_occupancy(uint8_t is_occupied)
{
    occupied = is_occupied;
}
