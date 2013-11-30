#include <stdint.h>
#include "global.h"
#include <stdio.h>

#define MAX_X  240
#define MAX_Y  320

#define SPI_START   (0x70)  /* Start byte for SPI transfer        */
#define SPI_RD      (0x01)  /* WR bit 1 within start              */
#define SPI_WR      (0x00)  /* WR bit 0 within start              */
#define SPI_DATA    (0x02)  /* RS bit 1 within start byte         */
#define SPI_INDEX   (0x00)  /* RS bit 0 within start byte         */

/**
 * Flush the TX fifo and discard RX bytes
 */
void spi1_flush_tx()
{
    uint8_t discard;

    //Discard RX FIFO
    while(!SPI1STATbits.SRXMPT) discard = SPI1BUF;

    //Flush TX operations
    while(SPI1STATbits.SPIBEC);

    //Flush shift register
    while(!SPI1STATbits.SRMPT);

    //Discard RX FIFO
    while(!SPI1STATbits.SRXMPT) discard = SPI1BUF;
}

/**
 * Flush the TX fifo and discard RX bytes
 */
void spi2_flush_tx()
{
    uint8_t discard;

    //Flush TX operations
    while(SPI2STATbits.SPIBEC);

    //Flush shift register
    while(!SPI2STATbits.SRMPT);

    //Discard RX FIFO
    while(!SPI2STATbits.SRXMPT) discard = SPI2BUF;
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
    uint8_t rv;
    spi1_flush_tx();
    SPI1BUF = b;
    //Wait for response byte
    while(SPI1STATbits.SRXMPT);
    rv = SPI1BUF;
    return rv;
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
 * Write a byte, discard all current RX fifo
 * @param b
 */
inline void spi2_w_b_xdiscard(uint8_t b)
{
    uint8_t discard;
    //Wait for TX space
    while(SPI2STATbits.SPITBF);
    //Discard some RX space
    while(!SPI2STATbits.SRXMPT) discard = SPI2BUF;

    SPI2BUF = b;
}


/**
 * Write a byte to SPI and read the response.
 * This requires waiting for FIFO to flush before starting
 * (returned values are discarded)
 *
 * @param b The byte to write
 * @return  the read byte
 */
inline uint8_t spi2_rw_b(uint8_t b)
{
    uint8_t rv;
    spi2_flush_tx();
    SPI2BUF = b;
    //Wait for response byte
    while(SPI2STATbits.SRXMPT);
    rv = SPI2BUF;
    return rv;
}

/**
 * Write a byte, one RX, check for space
 * @param b
 */
inline void spi2_w_b(uint8_t b)
{
    uint8_t discard;
    //Wait for TX space
    while(SPI2STATbits.SPITBF);

    //Discard some RX space
    discard = SPI2BUF;
    SPI2BUF = b;
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

/**
 * Write a byte, one RX, check for space
 * @param b
 */
inline void spi1_w_b(uint8_t b)
{
    uint8_t discard;
    //Wait for TX space
    while(SPI1STATbits.SPITBF);

    //Discard some RX space
    discard = SPI1BUF;
    SPI1BUF = b;
}

inline void lcd_select(void)
{
    LCD_SS = 0;
}

inline void lcd_deselect(void)
{
    LCD_SS = 1;
}

inline void flash_select(void)
{
    FL_SS = 0;
}

inline void flash_deselect(void)
{
    FL_SS = 1;
}

inline void flash_begin_read(uint32_t address)
{
    flash_deselect();
    flash_select();
    spi2_w_b_xdiscard(0x0B);
    spi2_w_b((address >> 16) & 0xFF );
    spi2_w_b((address >> 8 ) & 0xFF );
    spi2_w_b((address) & 0xFF );
    //We need the RW here so that we make sure that the first character
    //that appears in the RX fifo is in fact from this read
    spi2_rw_b(0xd0); //First dummy byte
}
inline void tp_select(void)
{
    TP_SS = 0;
}

inline void tp_deselect(void)
{
    TP_SS = 1;
}

inline void lcd_write_index(uint8_t idx)
{
    lcd_select();
    spi1_w_b_xdiscard(SPI_START | SPI_WR | SPI_INDEX);
    spi1_w_b(0);
    spi1_rw_b(idx); //The read ensures it is fully flushed through
    lcd_deselect();
}

inline void lcd_write_data_start(void)
{
    spi1_w_b_xdiscard(SPI_START | SPI_WR | SPI_DATA);
}

inline void lcd_write_data_word(uint16_t w)
{
    lcd_select();
    spi1_w_b_xdiscard(SPI_START | SPI_WR | SPI_DATA);
    spi1_w_b(w >> 8);
    spi1_rw_b(w & 0xFF);
    lcd_deselect();
}

inline void lcd_write_data_body(uint16_t w)
{
    spi1_w_b(w >> 8);
    spi1_w_b(w & 0xFF);
}
inline void lcd_write_reg(uint16_t addr, uint16_t value)
{
    lcd_write_index(addr);
    lcd_write_data_word(value);
}
inline uint16_t lcd_read_data(void)
{
    uint16_t rv;
    lcd_select();
    spi1_w_b_xdiscard(SPI_START | SPI_RD | SPI_DATA);
    spi1_w_b(0);
    rv = spi1_rw_b(0);
    rv <<= 8;
    rv |= spi1_rw_b(0);
    lcd_deselect();
    return rv;
}

inline uint16_t lcd_read_reg(uint16_t addr)
{
    uint16_t rv;
    lcd_write_index(addr);
    rv = lcd_read_data();
    return rv;
}

inline void lcd_set_cursor(uint16_t x, uint16_t y)
{
    lcd_write_reg(0x0020, x);
    lcd_write_reg(0x0021, y);
}

inline void lcd_start_gfx()
{
    lcd_select();
    spi1_w_b_xdiscard(SPI_START | SPI_WR | SPI_INDEX);
    spi1_w_b(0);
    spi1_rw_b(0x22); //The read ensures it is fully flushed through
    lcd_deselect();
    lcd_select();
    spi1_w_b_xdiscard(SPI_START | SPI_WR | SPI_DATA);
}

inline void lcd_end_gfx()
{
    spi1_flush_tx();
    lcd_deselect();
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

void wave_test(void)
{
    lcd_read_reg(0x0000);

}
/**
 * This magic incantation for screen initialisation was translated from the
 * example source code given by the vendor: powermcu.com / hotmcu.com
 * URL: http://www.haoyuelectronics.com/Attachment/HY28A/HY28A-LCDB%20example%20source%20code.rar
 */
void lcd_init(void)
{
    uint16_t dev_code;

    lcd_deselect();
    tp_deselect();
    LCD_RST = 0;
    delay_ms(50);
    LCD_RST = 1;
    delay_ms(50);
    dev_code = lcd_read_reg(0x0000);
    tc(0x10FF);
    tc(dev_code);

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
        while(1) tc(0xDD01);
    }

}