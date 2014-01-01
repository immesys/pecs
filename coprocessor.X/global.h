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
#include "assets.h"


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

typedef struct
{
    int32_t x;
    int32_t y;
} point_t;

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
inline void uart1_wb(uint8_t v);
void write_epic_command(uint8_t cmd, uint8_t val);

//spi.c
void delay_ms(uint16_t x);
void lcd_init(void);
inline void spi2_w_b_xdiscard(uint8_t b);
inline void spi2_w_b(uint8_t b);
inline void flash_select(void);
inline void flash_deselect(void);
inline void lcd_start_gfx();
inline void lcd_end_gfx();
uint8_t tp_sample_xy(uint16_t *x, uint16_t *y);
void tp_get_raw_xy(uint16_t *x, uint16_t *y);

//graphics.c
void blit_rect(uint16_t sx, uint16_t sy, uint16_t width, uint16_t height, uint32_t start_address);
inline void check_flash_window_blit();
inline void check_flash_full_blit();
inline void draw_calibrate_bg();
inline void erase_calibrate_point(uint16_t x, uint16_t y);
inline void draw_calibrate_point(uint16_t x, uint16_t y);
void blit_window(uint16_t img_sx, uint16_t img_sy, uint16_t width, uint16_t height,
                 uint16_t asset_sx, uint16_t asset_sy, uint16_t asset_width, uint16_t asset_height, uint32_t asset_address);
void draw_bar_screen_full();
inline void do_screen_touch(uint16_t x, uint16_t y);
void poll_tp();
void init_vals();
void poll_screen();
void tp_calibrate(void);
void gen_qr_code(const char* str);
void draw_qr_code();
inline void draw_pecs_bg();
void poll_val_uploads();
void unpack();
inline void uart2_wb(uint8_t v);
void rxipoll();
void draw_qr_hexcode();

// rht.c
uint16_t read_temp();
uint16_t read_rel_humidity();
void reset_rht();
void poll_temps();

//Logic
void set_occupancy(uint8_t is_occupied);
void set_heat(uint8_t val, uint8_t total, uint8_t source);
void set_fans(uint8_t val, uint8_t total, uint8_t origin);
void fanslider(uint8_t val, uint8_t total);
void heatslider(uint8_t val, uint8_t total);
void send_epic_packet(uint8_t cmd, uint8_t val);


typedef enum
{
    fs_idle,
    fs_full_blit,
    fs_window_blit,
    fs_overlay_blit
} flashstate_t;



//TODO double? Really?
typedef struct Matrix
{
   int32_t  An,
            Bn,
            Cn,
            Dn,
            En,
            Fn,
            Divider ;
} matrix_t ;

typedef union
{
    uint32_t u32;
    struct
    {
        uint16_t u16_low;
        uint16_t u16_high;
    };
} split_u32_t;

typedef enum {ss_unoccupied, ss_active_to_idle, ss_qr_to_idle, ss_idle, ss_qr_entry, ss_qr, ss_bar_entry, ss_bars} screen_state_t;

//Pins
#define LCD_TP_MOSI_RPO    _RP17R
#define LCD_TP_SCK_RPO     _RP16R

#define FL_MOSI_RPO     _RP20R
#define FL_SCK_RPO      _RP19R
#define TP_CS_RPO       _RP15R
#define TP_BL_CTL_RPO   _RP23R
#define HC_RPO          _RP22R

#define PIC_TO_EPIC_RPO  _RP15R
#define EPIC_TO_PIC_RPI  14

#define BLE_TX_RPI       25
#define BLE_RX_RPO      _RP13R

//#define DEBUG_RPO       _RP5R


#define LCD_MISO_RPI    18
#define FL_MISO_RPI     21

#define TP_IRQ          _RB4
#define TP_IRQ_TRIS     _TRISB4

#define FT_RX_RPO       _RP6R
#define FT_TX_RPI       5 //RP5 pin

#define LCD_RST_TRIS    _TRISA9
#define LCD_RST         _LATA9

#define LCD_SS_TRIS     _TRISB2
#define TP_SS_TRIS      _TRISB3
#define LCD_SS          _LATB2
#define TP_SS           _LATB3
#define LCD_EN_TRIS     _TRISB5
#define LCD_EN          _LATB5


//#define DBG2_TRIS       _TRISB5
//#define DBG2            _LATB5

#define FL_SS           _LATA2
#define FL_SS_TRIS      _TRISA2

#define LCD_BL          OC1R
#define HEAT            OC2R


#define BLUEBAR_POSITION_X 40
#define BLUEBAR_POSITION_Y 48
#define REDBAR_POSITION_X  40
#define REDBAR_POSITION_Y  142

#define BLUEBAR2_POSITION_X 31
#define BLUEBAR2_POSITION_Y 45
#define REDBAR2_POSITION_X  31
#define REDBAR2_POSITION_Y  139

#define V_OFFSET 22
#define OV_SENTINEL 0xF7
#define KNOB_START_X 38
#define BG_OVERFLOW 4
#define LCD_SPI_SPRESCALE 0b101 //0b101 3:1 == 5.3 Mhz
#define LCD_SPI_PPRESCALE 0b11  //0b11 = 1:1

#define TP_SPI_SPRESCALE  0b111 //0b111 1:1
#define TP_SPI_PPRESCALE  0b01  //0b01 16:1 == 1Mhz

/* AD channel selection command and register */
#define	TP_CHX 	0x90 	/* channel Y+ selection command */
#define	TP_CHY 	0xd0	/* channel X+ selection command*/

#define TP_POLL_THRESHOLD   100000 //50ms
#define TEMP_POLL_THRESHOLD 2000000L //1s
#define RED_TP_START_Y 142
#define RED_TP_END_Y   192


#define BLUE_TP_START_Y 48
#define BLUE_TP_END_Y   98
#define BOTH_TP_START_X 0
#define BOTH_TP_END_X   320

#define MAX_V           247

#define SOURCE_CLOUD 1
#define SOURCE_SCREEN 2



#endif	/* GLOBAL_H */

