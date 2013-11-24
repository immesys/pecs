

#include <stdio.h>
#include "global.h"

inline void uart1_wb(uint8_t v)
{
    while(U1STAbits.UTXBF);
    U1TXREG = v;
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
                uart1_wb(*(uint8_t*)buffer++);
            }
            break;
    }
    return (len);
}