/* 
 * File:   global.h
 * Author: immesys
 *
 * Created on November 23, 2013, 3:20 PM
 */

#ifndef GLOBAL_H
#define	GLOBAL_H

#include <xc.h>
#include <stdint.h>



#define LCD_X  240
#define LCD_Y  320



inline void lcd_select(void);
inline void lcd_deselect(void);
inline void lcd_write_index(uint8_t idx);
inline void lcd_write_data_start(void);
inline void lcd_write_data_word(uint16_t w);
inline void lcd_write_data_body(uint16_t w);
inline void lcd_write_reg(uint16_t addr, uint16_t value);
inline uint16_t lcd_read_data(void);
inline uint16_t lcd_read_reg(uint16_t addr);
inline void lcd_set_cursor(uint16_t x, uint16_t y);

/**
 * Delay in units of half a microsecond
 * @param x number of half microseconds to delay
 */
void delay_hus(uint16_t x);


/**
 * Delay for X milliseconds.
 * @param x the number of milliseconds to delay for
 */
void delay_ms(uint16_t x);


//config.c
void init_hw(void);

//uart.c
inline void uart1_wb(uint8_t v);
int write(int handle, void *buffer, unsigned int len);
inline void tc(uint16_t v);

//spi.c
void delay_ms(uint16_t x);
void lcd_init(void);

//Pins
#define LCD_MOSI_RPO    _RP3R
#define LCD_SCK_RPO     _RP0R
#define LCD_CS_RPO      _RP2R

#define TP_MOSI_RPO     _RP13R
#define TP_SCK_RPO      _RP14R
#define TP_CS_RPO       _RP15R
#define TP_BL_CTL_RPO   _RP7R

#define DEBUG_RPO       _RP5R


#define LCD_MISO_RPI    1
#define TP_MISO_RPI     18
#define TP_IRQ_RPI      17

#define LCD_RST_TRIS    _TRISA1
#define LCD_RST         _LATA1

#define LCD_SS_TRIS     _TRISB2
#define TP_SS_TRIS      _TRISB15
#define LCD_SS          _LATB2
#define TP_SS           _LATB15
#define DBG2_TRIS       _TRISB5
#define DBG2            _LATB5

#define LCD_BL          OC1R

#endif	/* GLOBAL_H */

