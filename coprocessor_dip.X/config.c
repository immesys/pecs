#include <xc.h>

// PIC24FJ64GB002 Configuration Bit Settings

// CONFIG4
#pragma config DSWDTPS = DSWDTPSF       // DSWDT Postscale Select (1:2,147,483,648 (25.7 days))
#pragma config DSWDTOSC = LPRC          // Deep Sleep Watchdog Timer Oscillator Select (DSWDT uses Low Power RC Oscillator (LPRC))
#pragma config RTCOSC = SOSC            // RTCC Reference Oscillator  Select (RTCC uses Secondary Oscillator (SOSC))
#pragma config DSBOREN = ON             // Deep Sleep BOR Enable bit (BOR enabled in Deep Sleep)
#pragma config DSWDTEN = ON             // Deep Sleep Watchdog Timer (DSWDT enabled)

// CONFIG3
#pragma config WPFP = WPFP63            // Write Protection Flash Page Segment Boundary (Highest Page (same as page 42))
#pragma config SOSCSEL = SOSC           // Secondary Oscillator Pin Mode Select (SOSC pins in Default (high drive-strength) Oscillator Mode)
#pragma config WUTSEL = LEG             // Voltage Regulator Wake-up Time Select (Default regulator start-up time used)
#pragma config WPDIS = WPDIS            // Segment Write Protection Disable (Segmented code protection disabled)
#pragma config WPCFG = WPCFGDIS         // Write Protect Configuration Page Select (Last page and Flash Configuration words are unprotected)
#pragma config WPEND = WPENDMEM         // Segment Write Protection End Page Select (Write Protect from WPFP to the last page of memory)

// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary Oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Select bit (Use default SCL1/SDA1 pins for I2C1 )
#pragma config IOL1WAY = OFF            // IOLOCK One-Way Set Enable (The IOLOCK bit can be set and cleared using the unlock sequence)
#pragma config OSCIOFNC = OFF           // OSCO Pin Configuration (OSCO pin functions as clock output (CLKO))
#pragma config FCKSM = CSDCMD           // Clock Switching and Fail-Safe Clock Monitor (Sw Disabled, Mon Disabled)
#pragma config FNOSC = FRCPLL           // Initial Oscillator Select (Fast RC Oscillator with Postscaler and PLL module (FRCPLL))
#pragma config PLL96MHZ = ON            // 96MHz PLL Startup Select (96 MHz PLL Startup is enabled automatically on start-up)
#pragma config PLLDIV = DIV2            // USB 96 MHz PLL Prescaler Select (Oscillator input divided by 2 (8 MHz input))
#pragma config IESO = OFF               // Internal External Switchover (IESO mode (Two-Speed Start-up) disabled)

// CONFIG1
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler (1:32,768)
#pragma config FWPSA = PR128            // WDT Prescaler (Prescaler ratio of 1:128)
#pragma config WINDIS = OFF             // Windowed WDT (Standard Watchdog Timer enabled,(Windowed-mode is disabled))
#pragma config FWDTEN = OFF             // Watchdog Timer (Watchdog Timer is disabled)
#pragma config ICS = PGx2               // Emulator Pin Placement Select bits (Emulator functions are shared with PGEC2/PGED2)
#pragma config GWRP = OFF               // General Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF                // General Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG port is disabled)

#include "global.h"

void init_hw()
{
    //Initialise all ANx pins to digital
    AD1PCFG = 0xFFFF;

    //Config other pin directions
    LCD_RST_TRIS = 0;
    LCD_RST = 1;
    DBG2_TRIS = 0;
    

    //Set oscillator and unlock RP
    __builtin_write_OSCCONH(0b001); //FRC wth PLL
    __builtin_write_OSCCONL(0b00000100); //Disable lock, don't osc switch
    _RCDIV = 0; //FRC divide by 1: 8Mhz
    _CPDIV = 00; //PLL divide by 1: Fsys = 32Mhz Fcy = 16 MIPS

    //Assign RP outputs
    LCD_MOSI_RPO  = 7;  //SDO1 output
    LCD_SCK_RPO   = 8;  //SCK1 output
   // LCD_CS_RPO    = 9;  //SS1 output
    TP_MOSI_RPO   = 10; //SDO2 output
    TP_SCK_RPO    = 11; //SCK2 output
   // TP_CS_RPO     = 12; //SS2 output
    TP_BL_CTL_RPO = 18; //OC1 output
    DEBUG_RPO     = 3; //U1TX
    
    //Assign RP inputs
    _SDI1R = LCD_MISO_RPI;
    _SDI2R = TP_MISO_RPI;
    _INT2R = TP_IRQ_RPI;

 /*   //Configure SPI1 module
    _SPI1IF = 0;
    _SPI1IP = 5;
    SPI1STATbits.SISEL = 0b100; //Interrupt when there is space in TX
    SPI1CON1bits.DISSCK = 0; //Use clock
    SPI1CON1bits.DISSDO = 0; //Enable SDO
    SPI1CON1bits.MODE16 = 0; //8 bit
    SPI1CON1bits.SMP = 0; //Sample in the middle of the bit
    SPI1CON1bits.CKE = 0; //0= Mode 3, clock is idle high, and
    SPI1CON1bits.CKP = 1; //1= data changes on falling edge, sample on rising
    SPI1CON1bits.MSTEN = 1; //Master
    SPI1CON1bits.SPRE = 0b110; //2:1 = 8Mhz probably
    SPI1CON1bits.PPRE = 0b11; //1:1
    SPI1CON2bits.FRMEN = 0; //No framing
    SPI1CON2bits.SPIBEN = 1; //Enable enhanced buffer FIFO
    SPI1STATbits.SPIEN = 1;
    _SPI1IE = 0;*/

    //Configure UART module (debug)
    U1MODEbits.UEN = 00;
    U1BRG = 33; //115200
    U1MODEbits.BRGH = 1;
    U1MODEbits.PDSEL = 00;
    U1MODEbits.STSEL = 0; //one stop.
    //U1STAbits.UTXEN = 1;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;
    _U1TXIE = 0;
    _U1RXIE = 0;

    //Configure a timer for general use (T2/T3)
    //This rolls over ~30 min so don't use it for too long
    //a period
    T2CONbits.T32 = 1;
    T2CONbits.TCKPS = 0b01; //2Mhz
    T2CONbits.TON = 1;

}
