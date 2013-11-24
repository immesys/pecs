
#include "global.h"

/* LCD color */
#define White          0xFFFF
#define Black          0x0000
#define Grey           0xF7DE
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

void g_fill_rgb()
{
    lcd_set_cursor(0, 0);
    lcd_write_index(0x022);
    uint16_t x, y;

    lcd_select();
    lcd_write_data_start();
    for (x = 0; x < LCD_X; x++)
    {
        for (y = 0; y < LCD_Y; y++)
        {
            lcd_write_data_body((x << 8) | y);
        }
    }
    lcd_deselect();
}