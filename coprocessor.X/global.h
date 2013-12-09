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

#define ASSET_BARS_ADDR   0x000000
#define ASSET_BARS_LENGTH 0x025800
#define ASSET_BARS_WIDTH  320
#define ASSET_BARS_HEIGHT 240
#define ASSET_BLUEBAR_ADDR   0x025800
#define ASSET_BLUEBAR_LENGTH 0x006590
#define ASSET_BLUEBAR_WIDTH  260
#define ASSET_BLUEBAR_HEIGHT 50
#define ASSET_REDBAR_ADDR   0x02be00
#define ASSET_REDBAR_LENGTH 0x006590
#define ASSET_REDBAR_WIDTH  260
#define ASSET_REDBAR_HEIGHT 50
#define ASSET_SLIDER_KNOB_ADDR   0x032400
#define ASSET_SLIDER_KNOB_LENGTH 0x001272
#define ASSET_SLIDER_KNOB_WIDTH  54
#define ASSET_SLIDER_KNOB_HEIGHT 54
#define ASSET_UP2_ADDR   0x033700
#define ASSET_UP2_LENGTH 0x009c40
#define ASSET_UP2_WIDTH  200
#define ASSET_UP2_HEIGHT 100
#define ASSET_SDB_ADDR   0x03d400
#define ASSET_SDB_LENGTH 0x025800
#define ASSET_SDB_WIDTH  320
#define ASSET_SDB_HEIGHT 240
#define ASSET_PECS_ADDR   0x062c00
#define ASSET_PECS_LENGTH 0x025800
#define ASSET_PECS_WIDTH  320
#define ASSET_PECS_HEIGHT 240
#define ASSET_POINT_ADDR   0x088400
#define ASSET_POINT_LENGTH 0x0005b2
#define ASSET_POINT_WIDTH  27
#define ASSET_POINT_HEIGHT 27
#define ASSET_CALIBRATE_ADDR   0x088a00
#define ASSET_CALIBRATE_LENGTH 0x025800
#define ASSET_CALIBRATE_WIDTH  320
#define ASSET_CALIBRATE_HEIGHT 240
#define ASSET_BLUEBAR2_ADDR   0x0ae200
#define ASSET_BLUEBAR2_LENGTH 0x007620
#define ASSET_BLUEBAR2_WIDTH  270
#define ASSET_BLUEBAR2_HEIGHT 56
#define ASSET_REDBAR2_ADDR   0x0b5900
#define ASSET_REDBAR2_LENGTH 0x007620
#define ASSET_REDBAR2_WIDTH  270
#define ASSET_REDBAR2_HEIGHT 56




#define BLUEBAR_POSITION_X 40
#define BLUEBAR_POSITION_Y 48
#define REDBAR_POSITION_X  40
#define REDBAR_POSITION_Y  142

#define BLUEBAR2_POSITION_X 31
#define BLUEBAR2_POSITION_Y 45
#define REDBAR2_POSITION_X  31
#define REDBAR2_POSITION_Y  139

#define V_OFFSET 29
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

#define MAX_V           218

#define SOURCE_CLOUD 1
#define SOURCE_SCREEN 2



#endif	/* GLOBAL_H */

