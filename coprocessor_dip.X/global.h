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
inline uint8_t spi2_rw_b(uint8_t b);
inline void flash_begin_read(uint32_t address);

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
inline void spi2_w_b_xdiscard(uint8_t b);
inline void spi2_w_b(uint8_t b);
inline void flash_select(void);
inline void flash_deselect(void);
inline void lcd_start_gfx();
inline void lcd_end_gfx();

//graphics.c
void blit_rect(uint16_t sx, uint16_t sy, uint16_t ex, uint16_t ey, uint32_t start_address);
inline void check_flash_window_blit();
inline void check_flash_full_blit();
void blit_window(uint16_t img_sx, uint16_t img_sy, uint16_t width, uint16_t height,
                 uint16_t asset_sx, uint16_t asset_sy, uint16_t asset_width, uint16_t asset_height, uint32_t asset_address);
typedef enum
{
    fs_idle,
    fs_full_blit,
    fs_window_blit
} flashstate_t;
//Pins
#define LCD_MOSI_RPO    _RP3R
#define LCD_SCK_RPO     _RP0R
#define LCD_CS_RPO      _RP2R

#define FL_MOSI_RPO     _RP13R
#define FL_SCK_RPO      _RP14R
#define TP_CS_RPO       _RP15R
#define TP_BL_CTL_RPO   _RP7R

#define DEBUG_RPO       _RP5R


#define LCD_MISO_RPI    1
#define FL_MISO_RPI     9//18
#define TP_IRQ_RPI      17

#define LCD_RST_TRIS    _TRISA1
#define LCD_RST         _LATA1

#define LCD_SS_TRIS     _TRISB2
#define TP_SS_TRIS      _TRISB15
#define LCD_SS          _LATB2
#define TP_SS           _LATB15
#define DBG2_TRIS       _TRISB5
#define DBG2            _LATB5

#define FL_SS           _LATB4
#define FL_SS_TRIS      _TRISB4

#define LCD_BL          OC1R

#endif	/* GLOBAL_H */

