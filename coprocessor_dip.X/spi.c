#include <stdint.h>
#include "global.h"
#include <stdio.h>

/**
 * Flush the TX fifo and discard RX bytes
 */
void spi1_flush_tx()
{
    uint8_t discard;

    //Flush TX operations
    while(SPI1STATbits.SPIBEC);

    //Discard RX FIFO
    while(!SPI1STATbits.SRXMPT) discard = SPI1BUF;
}

/**
 * Write a byte to SPI and read the response.
 * This requires waiting for FIFO to flush before starting
 * (returned values are discarded)
 *
 * @param b The byte to write
 * @return  the read byte
 */
inline uint8_t spi1_rw_b(uint8_t b)
{
    spi1_flush_tx();
    SPI1BUF = b;
    //Wait for response byte
    while(SPI1STATbits.SRXMPT);
    return SPI1BUF;
}

/**
 * Write a byte, discard all current RX fifo
 * @param b
 */
inline void spi1_w_b_xdiscard(uint8_t b)
{
    uint8_t discard;
    //Wait for TX space
    while(SPI1STATbits.SPITBF);
    //Discard some RX space
    while(!SPI1STATbits.SRXMPT) discard = SPI1BUF;

    SPI1BUF = b;
}

/**
 * Write a byte, discard one RX
 * @param b
 */
inline void spi1_w_b_fast(uint8_t b)
{
    uint8_t discard;
    //Assume TX space,
    discard = SPI1BUF;
    SPI1BUF = b;
}

inline void lcd_write_index(uint8_t idx)
{

}

inline void lcd_write_data(uint16_t data)
{

}

inline uint16_t lcd_read_data(void)
{

}

inline void lcd_write_reg(uint16_t addr, uint16_t value)
{

}

inline uint16_t lcd_read_reg(uint16_t addr)
{
}

inline void lcd_set_cursor(uint16_t x, uint16_t y)
{
}

/**
 * Delay in units of half a microsecond
 * @param x number of half microseconds to delay
 */
void delay_hus(uint16_t x)
{
    uint16_t then;
    then = TMR2;
    while((uint16_t)(TMR2 - then) < x);
}

/**
 * Delay for X milliseconds.
 * @param x the number of milliseconds to delay for
 */
void delay_ms(uint16_t x)
{
    uint32_t hmicros = x;
    hmicros*=2000;
    uint32_t then, now;
    ((uint16_t*)&then)[0] = TMR2;
    ((uint16_t*)&then)[1] = TMR3HLD;
    do
    {
        ((uint16_t*)&now)[0] = TMR2;
        ((uint16_t*)&now)[1] = TMR3HLD;
    } while((now - then) < hmicros);
}

/**
 * This magic incantation for screen initialisation was translated from the
 * example source code given by the vendor: powermcu.com / hotmcu.com
 * URL: http://www.haoyuelectronics.com/Attachment/HY28A/HY28A-LCDB%20example%20source%20code.rar
 */
void lcd_init(void)
{
    uint16_t dev_code;
    dev_code = lcd_read_reg(0x0000);
    printf("Screen detected as %04x\n",dev_code);

    /* Different driver IC initialization */
    if( dev_code == 0x9320 || dev_code == 0x9300 )
    {
        lcd_write_reg(0x00, 0x0000);
        lcd_write_reg(0x01, 0x0100); /* Driver Output Contral */
        lcd_write_reg(0x02, 0x0700); /* LCD Driver Waveform Contral */
        lcd_write_reg(0x03, 0x1038); /* Set the scan mode */
        lcd_write_reg(0x04, 0x0000); /* Scalling Contral */
        lcd_write_reg(0x08, 0x0202); /* Display Contral 2 */
        lcd_write_reg(0x09, 0x0000); /* Display Contral 3 */
        lcd_write_reg(0x0a, 0x0000); /* Frame Cycle Contal */
        lcd_write_reg(0x0c, (1<<0)); /* Extern Display Interface Contral 1 */
        lcd_write_reg(0x0d, 0x0000); /* Frame Maker Position */
        lcd_write_reg(0x0f, 0x0000); /* Extern Display Interface Contral 2 */
        delay_ms(50);
        lcd_write_reg(0x07, 0x0101); /* Display Contral */
        delay_ms(50);
        lcd_write_reg(0x10, (1<<12)|(0<<8)|(1<<7)|(1<<6)|(0<<4)); /* Power Control 1 */
        lcd_write_reg(0x11, 0x0007);                              /* Power Control 2 */
        lcd_write_reg(0x12, (1<<8)|(1<<4)|(0<<0));                /* Power Control 3 */
        lcd_write_reg(0x13, 0x0b00);                              /* Power Control 4 */
        lcd_write_reg(0x29, 0x0000);                              /* Power Control 7 */
        lcd_write_reg(0x2b, (1<<14)|(1<<4));

        lcd_write_reg(0x50, 0);       /* Set X Start */
        lcd_write_reg(0x51, 239);     /* Set X End */
        lcd_write_reg(0x52, 0);       /* Set Y Start */
        lcd_write_reg(0x53, 319);     /* Set Y End */
        delay_ms(50);

        lcd_write_reg(0x60, 0x2700); /* Driver Output Control */
        lcd_write_reg(0x61, 0x0001); /* Driver Output Control */
        lcd_write_reg(0x6a, 0x0000); /* Vertical Srcoll Control */

        lcd_write_reg(0x80, 0x0000); /* Display Position? Partial Display 1 */
        lcd_write_reg(0x81, 0x0000); /* RAM Address Start? Partial Display 1 */
        lcd_write_reg(0x82, 0x0000); /* RAM Address End-Partial Display 1 */
        lcd_write_reg(0x83, 0x0000); /* Displsy Position? Partial Display 2 */
        lcd_write_reg(0x84, 0x0000); /* RAM Address Start? Partial Display 2 */
        lcd_write_reg(0x85, 0x0000); /* RAM Address End? Partial Display 2 */

        lcd_write_reg(0x90, (0<<7)|(16<<0)); /* Frame Cycle Contral */
        lcd_write_reg(0x92, 0x0000);         /* Panel Interface Contral 2 */
        lcd_write_reg(0x93, 0x0001);         /* Panel Interface Contral 3 */
        lcd_write_reg(0x95, 0x0110);         /* Frame Cycle Contral */
        lcd_write_reg(0x97, (0<<8));
        lcd_write_reg(0x98, 0x0000);         /* Frame Cycle Contral */
        lcd_write_reg(0x07, 0x0133);
    }
    else
    {
        printf("Screen initialisation aborted: not recognised\n");
    }
}