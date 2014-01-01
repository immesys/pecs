/*
    #2.0 fanA
    #2.1 fanB
    #2.3 fanC
    #2.6 contact low active
    #1.6 heat
*/    


#include <IPDispatch.h>
#include <lib6lowpan/lib6lowpan.h>
#include <lib6lowpan/ip.h>
#include <lib6lowpan/ip.h>

#include "PECSReport.h"
#include "blip_printf.h"
#include <Msp430Adc12.h>
#include <msp430usart.h>

#define REPORT_PERIOD 10L

module PECSControlP
{
  uses 
  {
    interface Boot;
    interface SplitControl as RadioControl;
  
    interface UDP as Echo;
    interface UDP as Reports;
    interface HplMsp430GeneralIO as BLEGPIO;
    interface HplMsp430GeneralIO as fanA;
    interface HplMsp430GeneralIO as fanB;
    interface HplMsp430GeneralIO as fanC;
    interface HplMsp430GeneralIO as CoprocINT;
    interface HplMsp430GeneralIO as Actl0;
    interface HplMsp430GeneralIO as Actl1;
    interface HplMsp430GeneralIO as Actl2;
    interface HplMsp430GeneralIO as Actl3;
    interface HplMsp430GeneralIO as Actl4;
    interface HplMsp430GeneralIO as Actl5;
    interface HplMsp430GeneralIO as Dctl0;
    interface HplMsp430GeneralIO as Dctl1;
    interface HplMsp430GeneralIO as Dctl2;
    interface HplMsp430GeneralIO as TP_IRQ;
    interface HplMsp430GeneralIO as contact;
    interface HplMsp430Interrupt as contacti;
    interface HplMsp430Interrupt as TP_IRQi;

    interface HplMsp430Usart as CPUart;
    interface HplMsp430UsartInterrupts as CPUarti;
    interface Leds;
    
    interface Timer<TMilli> as ReportTimer;
    interface Timer<TMilli> as CommandTimer;
    interface Random;

    interface Read<uint16_t> as BatteryADC;

  }
  provides
  {
  
    interface AdcConfigure<const msp430adc12_channel_config_t*> as ADCConfig;
  }
  
}

#define SOURCE_CLOUD 1
#define SOURCE_SCREEN 2
#define TOTAL_BAT_SAMPLES 1

implementation
{

  bool timerStarted;
  nx_struct pecs_report controls;
  struct sockaddr_in6 route_dest;
  
  uint8_t st_fan;  //The current on-the-pin setting, affected by occupancy
  uint8_t shadow_fan; //Our definition of the settings as if someone was sitting
  uint8_t shadow_heat;
  uint8_t fan_source; //Where did this setting come from?
  uint8_t heat_source;
  uint32_t bat_accum;
  uint8_t bat_samples;
  uint32_t bat_reading;
  
  uint8_t relh_h, relh_l, temp_h, temp_l;
  
  
  // ADC for battery voltage
  //#define CONFIG_AVCC TEMPERATURE_DIODE_CHANNEL, REFERENCE_AVcc_AVss, REFVOLT_LEVEL_NONE, SHT_SOURCE_SMCLK, SHT_CLOCK_DIV_1, SAMPLE_HOLD_4_CYCLES, SAMPCON_SOURCE_SMCLK, SAMPCON_CLOCK_DIV_1
  const msp430adc12_channel_config_t config = {INPUT_CHANNEL_A0, REFERENCE_VREFplus_AVss, REFVOLT_LEVEL_2_5, SHT_SOURCE_ACLK, SHT_CLOCK_DIV_1, SAMPLE_HOLD_4_CYCLES, SAMPCON_SOURCE_SMCLK, SAMPCON_CLOCK_DIV_1};
  
  
  /* {INPUT_CHANNEL_A0, 
                                               REFERENCE_VREFplus_AVss,
                                               REFVOLT_LEVEL_2_5,
                                               SHT_SOURCE_ADC12OSC,
                                               SHT_CLOCK_DIV_6,
                                               SAMPLE_HOLD_32_CYCLES,
                                               SAMPCON_SOURCE_SMCLK,
                                               SAMPCON_CLOCK_DIV_2};*/
                                               
  task void sendrep()
  {
    controls.device_type = 0x01;
    controls.fan_setting = shadow_fan;
    controls.heat_setting = shadow_heat;
    controls.occupancy = !(call contact.get());
    controls.uid = 0x100 | TOS_NODE_ID;
    controls.fan_origin = fan_source;
    controls.heat_origin = heat_source;
    controls.battery = bat_reading;
    call Leds.led1Toggle();
    call Reports.sendto(&route_dest, &controls, sizeof(controls));
  }

  void sendCPCMD(uint8_t cmd, uint8_t val)
  {
    uint16_t k;
    while(!(call CPUart.isTxEmpty()));
    call CPUart.tx(0xFF);
    for (k=10000;k>0;k--);
    while(!(call CPUart.isTxEmpty()));
    call CPUart.tx(cmd);
    for (k=10000;k>0;k--);
    while(!(call CPUart.isTxEmpty()));
    call CPUart.tx(val);
    for (k=10000;k>0;k--);
  }
  
  // Should use this
  async event void CPUarti.txDone()
  {
  }
  task void send_heat()
  {
    //Send 0xFF, 0x11, (heat) via uart to coproc
    sendCPCMD(0x11, shadow_heat);
  }
  task void send_fan()
  {
    sendCPCMD(0x14, shadow_fan);
  }
  task void send_occupied()
  {
    //Send 0xFF, 0x13, (0x50 == 0 or 0x5a == 1)
    sendCPCMD(0x13, 0x50);
  }
  task void send_both()
  {
    post send_fan();
    call CommandTimer.startOneShot(500);
  }
  
  event void CommandTimer.fired()
  {
    post send_heat();
  }
  task void send_unoccupied()
  {
    //Send 0xFF, 0x13, (0x50 == 0 or 0x5a == 1)
    sendCPCMD(0x13, 0x5a);
  }
  
  void set_fan()
  {
    if (st_fan & 1 || st_fan > 7) call fanC.set(); else call fanC.clr();
    if (st_fan & 2 || st_fan > 7) call fanB.set(); else call fanB.clr();
    if (st_fan & 4 || st_fan > 7) call fanA.set(); else call fanA.clr();
  }
  
  event void RadioControl.startDone(error_t e) {
  }

  event void RadioControl.stopDone(error_t e) {

  }

  async event void contacti.fired() 
  {
    post sendrep();
    if (!call contact.get())
    {
        post send_occupied();
    }
    call contacti.clear();
  }
  
  async event void TP_IRQi.fired()
  {
    call TP_IRQi.clear();
  }
  
  event void Reports.recvfrom(struct sockaddr_in6 *from, void *data, 
                              uint16_t len, struct ip6_metadata *meta)
  {
    uint8_t* pd = (uint8_t*) data;
    if (len < 2) return;
    switch(pd[0])
    {
        case 0x10:
            atomic
            {
                st_fan = pd[1];
                shadow_fan = pd[1];
                fan_source = SOURCE_CLOUD;
            }
            set_fan();
            post send_fan();
            post sendrep();
            break;
        case 0x11:
            atomic
            {
                shadow_heat = pd[1];
                heat_source = SOURCE_CLOUD;
            }
            post send_heat();
            post sendrep();
            break;
        case 0x15:
            atomic
            {
                shadow_heat = pd[2];
                fan_source = SOURCE_CLOUD;
                st_fan = pd[1];
                shadow_fan = pd[1];
                heat_source = SOURCE_CLOUD;
            }
            set_fan();
            post send_both();
            post sendrep();
            break;
    }
  }


  
  event void Echo.recvfrom(struct sockaddr_in6 *from, void *data, 
                           uint16_t len, struct ip6_metadata *meta) 
  {
    call Echo.sendto(from, data, len);
  }

  void latch_env_sensors()
  {
    controls.relh_h = relh_h;
    controls.relh_l = relh_l;
    controls.temp_h = temp_h;
    controls.temp_l = temp_l;
  }
  void do_cmd(uint8_t cmd, uint8_t val)
  {
    switch(cmd)
    {
        case 0x10:
            atomic
            {
                st_fan = val;
                shadow_fan = val;
                fan_source = SOURCE_SCREEN;
            }
            set_fan();
          //  post sendrep();
            break;
        case 0x11:
            atomic
            {
                shadow_heat = val;
                heat_source = SOURCE_SCREEN;
            }
         //   post sendrep();
            break;
        case 0x12:
            atomic
            {
                relh_h = val;
            }
            break;
        case 0x13:
            atomic
            {
                relh_l = val;
                controls.relh_h = relh_h;
                controls.relh_l = relh_l;
            }
            break;
        case 0x14:
            atomic
            {
                temp_h = val;
            }
            break;
        case 0x15:
            atomic
            {
                temp_l = val;
                controls.temp_h = temp_h;
                controls.temp_l = temp_l;
            }
            break;
        default:
            break;
    }
  }
  uint8_t cp_state;
  uint8_t cmd0;
  uint8_t cmd1;
  #define CP_IDLE 0
  #define CP_CMD0 1
  #define CP_CMD1 2                                     
  async event void CPUarti.rxDone(uint8_t c)
  {
    call CPUart.clrRxIntr();
    switch(cp_state)
    {
        case CP_IDLE:
            if (c == 0xFF)
                cp_state = CP_CMD0;
            break;
        case CP_CMD0:
            cmd0 = c;
            cp_state = CP_CMD1;
            break;
        case CP_CMD1:
            cmd1 = c;
            cp_state = CP_IDLE;
            do_cmd(cmd0, cmd1);
            break;
        default:
            cp_state = CP_IDLE;
    }
  }
  event void ReportTimer.fired() 
  {
    if (!timerStarted) 
    {
      call ReportTimer.startPeriodic(1024 * REPORT_PERIOD);
      timerStarted = TRUE;
    }
    
      
    call BatteryADC.read();
              
    if (call contact.get())
    { //Not occupied
        st_fan = 0;
        set_fan();
        post send_unoccupied();
    }
    else
    {
        st_fan = shadow_fan;
        set_fan();
        post send_occupied();
    }
    post sendrep();
  }
  

  msp430_uart_union_config_t uconfig;
  
  event void Boot.booted() 
  {
  
    uconfig = msp430_uart_default_config;
    uconfig.uartConfig.ubr = UBR_1MHZ_115200;
    uconfig.uartConfig.umctl = UMCTL_1MHZ_115200;
    
    bat_accum = 0;
    bat_samples = 0;
    bat_reading = 0;
    call RadioControl.start();
    timerStarted = FALSE;

    route_dest.sin6_port = htons(7005);
    inet_pton6(REPORT_DEST, &route_dest.sin6_addr);
    call ReportTimer.startOneShot(call Random.rand16() % (1024 * REPORT_PERIOD));

    call Echo.bind(7);
    call Reports.bind(7001);
    
    //Set up IO
    call fanA.makeOutput();
    call fanA.clr();
    call fanB.makeOutput();
    call fanB.clr();
    call fanC.makeOutput();
    call fanC.clr();
    call contact.makeInput();
    call TP_IRQ.makeInput();
    call CoprocINT.makeOutput();
    call CoprocINT.clr();
    call TP_IRQi.edge(TRUE);
    call TP_IRQi.enable();
    atomic
    {
        st_fan = 0;
        shadow_fan = 0;
        shadow_heat = 0;
    }
    call contacti.edge(FALSE);
    call contacti.enable();
    post send_heat();
    
    call CPUart.setModeUart(&uconfig);
    call CPUart.enableRxIntr();
    
    fan_source = SOURCE_CLOUD;
    heat_source = SOURCE_CLOUD;
    
    temp_h = temp_l = relh_h = relh_l = 0;
  }
                        
     
  async command const msp430adc12_channel_config_t* ADCConfig.getConfiguration()
  {
    return &config;
  }

  event void BatteryADC.readDone( error_t result, uint16_t data )
  {
    bat_accum += data;
    bat_samples++;
    if (bat_samples == TOTAL_BAT_SAMPLES)
    {
        bat_reading = bat_accum;
        bat_accum = 0;
        bat_samples = 0;
    }
  }
  
                                            
                                               
}
