

#include <stdio.h>
#include "global.h"

inline void uart1_wb(uint8_t v)
{
    while(U1STAbits.UTXBF);
    U1TXREG = v;
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