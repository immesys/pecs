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

#define REPORT_PERIOD 10L

module PECSControlP
{
  uses 
  {
    interface Boot;
    interface SplitControl as RadioControl;

    interface UDP as Echo;
    interface UDP as Reports;
    interface HplMsp430GeneralIO as fanA;
    interface HplMsp430GeneralIO as fanB;
    interface HplMsp430GeneralIO as fanC;
    interface HplMsp430GeneralIO as contact;
    interface HplMsp430GeneralIO as heat;
    interface HplMsp430Interrupt as contacti;
    interface Leds;
    
    interface Timer<TMilli> as ReportTimer;
    
    interface Random;
  }
}
implementation
{

  bool timerStarted;
  nx_struct pecs_report controls;
  struct sockaddr_in6 route_dest;

  uint8_t st_fan;
  uint8_t st_heat;
  bool bl;
  
  event void Boot.booted() 
  {
    call RadioControl.start();
    timerStarted = FALSE;

    route_dest.sin6_port = htons(7005);
    inet_pton6(REPORT_DEST, &route_dest.sin6_addr);
    call ReportTimer.startOneShot(call Random.rand16() % (1024 * REPORT_PERIOD));

    dbg("Boot", "booted: %i\n", TOS_NODE_ID);
    call Echo.bind(7);
    call Reports.bind(7001);
    
    call fanA.makeOutput();
    call fanA.clr();
    call fanB.makeOutput();
    call fanB.clr();
    call fanC.makeOutput();
    call fanC.clr();
    call contact.makeInput();
    call heat.makeOutput();
    call heat.clr();
    atomic
    {
        st_fan = 0;
        st_heat = 0;
    }
    bl = FALSE;
    call contacti.edge(bl);
    call contacti.enable();
  }
  
  task void sendrep()
  {
  
    controls.fan_setting = st_fan;
    controls.heat_setting = st_heat;
    controls.occupancy = !(call contact.get());
    controls.uid = 0xAABBCCDD;

    call Leds.led1Toggle();
    call Reports.sendto(&route_dest, &controls, sizeof(controls));
  }

  void set_fan()
  {
    if (st_fan & 1 || st_fan > 7) call fanC.set(); else call fanC.clr();
    if (st_fan & 2 || st_fan > 7) call fanB.set(); else call fanB.clr();
    if (st_fan & 4 || st_fan > 7) call fanA.set(); else call fanA.clr();
  }
  
  void set_heat()
  {
    if (st_heat > 0) call heat.set(); else call heat.clr();
  }
  
  event void RadioControl.startDone(error_t e) {
  }

  event void RadioControl.stopDone(error_t e) {

  }

  async event void contacti.fired() {
    post sendrep();
    call contacti.clear();
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
            }
            set_fan();
            post sendrep();
            break;
        case 0x11:
            atomic
            {
                st_heat = pd[1];
            }
            set_heat();
            post sendrep();
            break;
    }
  }


  
  event void Echo.recvfrom(struct sockaddr_in6 *from, void *data, 
                           uint16_t len, struct ip6_metadata *meta) 
  {
#ifdef PRINTFUART_ENABLED
    int i;
    uint8_t *cur = data;
    call Leds.led0Toggle();
    printf("Echo recv [%i]: ", len);
    for (i = 0; i < len; i++) {
      printf("%02x ", cur[i]);
    }
    printf("\n");
#endif
    call Echo.sendto(from, data, len);
  }

  event void ReportTimer.fired() 
  {
    if (!timerStarted) 
    {
      call ReportTimer.startPeriodic(1024 * REPORT_PERIOD);
      timerStarted = TRUE;
    }
    post sendrep();
  }
}
