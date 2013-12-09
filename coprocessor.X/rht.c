

#include "global.h"

#define DAT _TRISB9
#define DATLAT _LATB9
#define DATR _RB9
#define CLK _LATB8
#define CLKTRIS _TRISB8

#define BT delay_hus(50)

static void start_cmd()
{
    DAT = 1;
    CLK = 1;
    BT;
    DAT = 0;
    BT;
    CLK = 0;
    BT;
    CLK = 1;
    BT;
    DAT = 1;
    BT;
    CLK = 0;
    BT;
}
static uint8_t issue_cmd(uint8_t v)
{
    uint8_t i;
    uint8_t rv;
    for (i = 0; i < 8; i ++)
    {
        if ((v & 0x80) == 0x80)
        {
            DAT = 1;
        }
        else
        {
            DAT = 0;
        }
        BT;
        CLK = 1;
        BT;
        CLK = 0;
        v <<= 1;
    }
    DAT = 1;
    BT;
    CLK = 1;
    BT;
    rv = DATR == 0;
    CLK = 0;
    BT;
    return rv;
}
static void wait_for_dat()
{
    uint16_t timeout;
    DAT = 1;
    delay_ms(50);
    for (timeout = 0; timeout < 100 && DATR == 1; timeout++)
    {
        delay_ms(10);
    }
}
static uint16_t read_data()
{
    uint8_t i;
    uint16_t hd = 0;
    DAT = 1;
    for (i = 0; i < 8; i++)
    {
        CLK = 1;
        BT;
        hd <<= 1;
        hd |= DATR;
        CLK = 0;
        BT;
    }
    BT;
    DAT = 0;
    BT;
    CLK = 1;
    BT;
    CLK = 0;
    DAT = 1;
    BT;
    for (i = 0; i < 8; i++)
    {
        CLK = 1;
        BT;
        hd <<= 1;
        hd |= DATR;
        CLK = 0;
        BT;
    }
    CLK = 1;
    BT;
    CLK = 0;
    BT;
    return hd;
}

void reset_rht()
{
    DATLAT = 0;
    CLKTRIS = 0;
    DAT = 1;
    uint8_t i;
    for (i = 0; i < 10; i++)
    {
        CLK = 1;
        BT;
        CLK = 0;
        BT;
    }
    start_cmd();
    issue_cmd(0b11110);
}
uint16_t read_temp()
{
    start_cmd();
    issue_cmd(0b00000011);
    wait_for_dat();
    return read_data();
}
uint16_t read_rel_humidity()
{
    start_cmd();
    issue_cmd(0b00000101);
    wait_for_dat();
    return read_data();
}
void poll_temps()
{
    static split_u32_t last_time;
    static uint8_t wastemp;
    split_u32_t time;
    time.u16_low = TMR2;
    time.u16_high = TMR3HLD;
    if(time.u32 - last_time.u32 > TEMP_POLL_THRESHOLD)
    {
        uint16_t v;
        last_time = time;
        if (wastemp)
        {
            wastemp = 0;
            v = read_rel_humidity();
            send_epic_packet(0x12, v >> 8);
            delay_hus(100);
            send_epic_packet(0x13, v & 0xFF);
        }
        else
        {
            wastemp = 1;
            v = read_temp();
            send_epic_packet(0x14, v >> 8);
            delay_hus(100);
            send_epic_packet(0x15, v & 0xFF);
        }
    }
}