/*
    #2.1 Actuation control
*/    


#include <IPDispatch.h>
#include <lib6lowpan/lib6lowpan.h>
#include <lib6lowpan/ip.h>
#include <lib6lowpan/ip.h>

#include "PECSFWReport.h"
#include "blip_printf.h"

#include <msp430usart.h>

#define REPORT_PERIOD 10L
#define WAVE_PERIOD 64
#define DELAY_OFF 2

module PECSControlFWP
{
  uses 
  {
    interface Boot;
    interface SplitControl as RadioControl;
  
    interface UDP as Echo;
    interface UDP as Reports;

    interface HplMsp430GeneralIO as relay;
    interface HplMsp430GeneralIO as contact;
    interface HplMsp430GeneralIO as contactg;
    
    interface Leds;
    
    interface Timer<TMilli> as ReportTimer;
    interface Timer<TMilli> as WaveSetTimer;
    interface Timer<TMilli> as WaveResetTimer;
    
    interface Random;
  }
}

implementation
{


    bool timerStarted;
    bool is_actuator_on;
    uint8_t duty_cycle;
    uint8_t duty_cycle_shadow;
    nx_struct pecs_report controls;
    struct sockaddr_in6 route_dest;
    uint8_t occupied_delay;
    
    event void Boot.booted() 
    {
        call RadioControl.start();
        timerStarted = FALSE;
        route_dest.sin6_port = htons(7005);
        inet_pton6(REPORT_DEST, &route_dest.sin6_addr);
        call ReportTimer.startOneShot(call Random.rand16() % (1024 * REPORT_PERIOD));

        call Echo.bind(7);
        call Reports.bind(7001);

        //Set up IO
        call relay.makeOutput();
        call relay.clr();
        call contactg.makeOutput();
        call contactg.clr();
        call contact.makeInput();

        duty_cycle = 32;
        duty_cycle_shadow = 32;
        
        call WaveSetTimer.startPeriodic(WAVE_PERIOD);
    }

    event void WaveSetTimer.fired()
    {
        if (duty_cycle > 32)
        {
         //   call WaveResetTimer.startOneShot(duty_cycle);
            call relay.set();
        }
        else
        {
            call relay.clr();
        }
    }
    
    event void WaveResetTimer.fired()
    {
        call relay.clr();
    }
    
  
  task void sendrep()
  {
    controls.device_type = 0x02;
    controls.heat_setting = duty_cycle_shadow;
    controls.occupancy = !(call contact.get());
    controls.uid = 0x200 | TOS_NODE_ID;
    call Leds.led1Toggle();
    call Reports.sendto(&route_dest, &controls, sizeof(controls));
  }

  event void RadioControl.startDone(error_t e) {
  }

  event void RadioControl.stopDone(error_t e) {

  }

/*
  async event void contacti.fired() 
  {
    post sendrep();
    if (!call contact.get())
    {
        post send_occupied();
    }
    call contacti.clear();
  }
  */

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
                duty_cycle = pd[1];
                duty_cycle_shadow = pd[1];
            }
            post sendrep();
            break;
    }
  }

  event void Echo.recvfrom(struct sockaddr_in6 *from, void *data, 
                           uint16_t len, struct ip6_metadata *meta) 
  {
    call Echo.sendto(from, data, len);
  }

  event void ReportTimer.fired() 
  {
    if (!timerStarted) 
    {
      call ReportTimer.startPeriodic(1024 * REPORT_PERIOD);
      timerStarted = TRUE;
    }
    if (!(call contact.get()))
    { //Not occupied
        if (occupied_delay >= DELAY_OFF)
        {
            duty_cycle = 0;
        }
        else
        {
            occupied_delay++;
        }
    }
    else
    {
        duty_cycle = duty_cycle_shadow;
        occupied_delay = 0;
    }
    post sendrep();
  }
  
}
