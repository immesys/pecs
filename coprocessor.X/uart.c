

#include <stdio.h>
#include "global.h"

inline void uart1_wb(uint8_t v)
{
    while(U1STAbits.UTXBF);
    U1TXREG = v;
}
inline void uart2_wb(uint8_t v)
{
    while(U2STAbits.UTXBF);
    U2TXREG = v;
}


//Write out a trace code to the uart that can be read on the logic analyser
inline void tc(uint16_t v)
{
    //big endian so it's easier to read
    uart1_wb (v >> 8);
    uart1_wb (v & 0xFF);
}
int __attribute__((__weak__, __section__(".libc")))
write(int handle, void *buffer, unsigned int len) {
    int i;

    switch (handle)
    {
        case 0:
        case 1:
        case 2:
            for (i = len; i; --i) {
                uart2_wb(*(uint8_t*)buffer++);
            }
            break;
    }
    return (len);
}

void do_cmd(uint8_t cmd, uint8_t value)
{
    printf("Got cmd %u / %u\n",cmd,value);
    switch(cmd)
    {
        case 0x11: //set heat value
        {
            set_heat(value, 100, SOURCE_CLOUD);
        }
        case 0x14: //set fans value
        {
            set_fans(value, 7, SOURCE_CLOUD);
        }
        case 0x12: //config power mode
        {
            if (value == 0xa0) //low power mode
            {}
            else if (value == 0xa5) //high power mode
            {}
            break;
        }
        case 0x13: //Occupancy
        {
            if (value == 0x5a) //No occupant
            {
                set_occupancy(0);
            }
            else if (value == 0x50) //Occupant
            {
                set_occupancy(1);
            }
            break;
        }
        default:
        {
            printf("Unknown command: 0x%x\n", cmd);
        }
    }
}
void write_epic_command(uint8_t cmd, uint8_t val)
{
    uart2_wb(0xFF);
    uart2_wb(cmd);
    uart2_wb(val);
}
typedef enum {cs_idle, cs_cmd0, cs_cmd1} command_state_t;
static command_state_t state = cs_idle;
uint8_t cmd0, cmd1;
void __attribute__((interrupt, no_auto_psv, shadow)) _U1RXInterrupt(void)
{
    while(U1STAbits.URXDA)
    {
        _U1RXIF = 0;
        uint8_t c = U1RXREG;
        switch(state)
        {
            case cs_idle:
                if (c == 0xFF)
                    state = cs_cmd0;
                break;
            case cs_cmd0:
                cmd0 = c;
                state = cs_cmd1;
                break;
            case cs_cmd1:
                cmd1 = c;
                do_cmd(cmd0, cmd1);
                state = cs_idle;
                break;
            default:
                state = cs_idle;
        }
    }
}