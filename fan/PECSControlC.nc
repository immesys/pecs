
#include <lib6lowpan/6lowpan.h>

configuration PECSControlC {

} implementation {
  components MainC, LedsC;
  components PECSControlP;

  components HplMsp430GeneralIOC;
  components HplMsp430InterruptC;
  components HplMsp430Usart1C;
  
  PECSControlP.BLEGPIO -> HplMsp430GeneralIOC.Port53;
  PECSControlP.fanA -> HplMsp430GeneralIOC.Port54;
  PECSControlP.fanB -> HplMsp430GeneralIOC.Port55;
  PECSControlP.fanC -> HplMsp430GeneralIOC.Port56;
  
  PECSControlP.CoprocINT -> HplMsp430GeneralIOC.Port61;
  PECSControlP.Actl0 -> HplMsp430GeneralIOC.Port62;
  PECSControlP.Actl1 -> HplMsp430GeneralIOC.Port63;
  PECSControlP.Actl2 -> HplMsp430GeneralIOC.Port64;
  PECSControlP.Actl3 -> HplMsp430GeneralIOC.Port65;
  PECSControlP.Actl4 -> HplMsp430GeneralIOC.Port66;
  PECSControlP.Actl5 -> HplMsp430GeneralIOC.Port67;
  PECSControlP.Dctl0 -> HplMsp430GeneralIOC.Port12;
  PECSControlP.Dctl1 -> HplMsp430GeneralIOC.Port15;
  PECSControlP.Dctl2 -> HplMsp430GeneralIOC.Port16;
  
  PECSControlP.CPUart -> HplMsp430Usart1C;
  PECSControlP.CPUarti -> HplMsp430Usart1C;
  
  // Dctl3 is being used as the contact switch
 // PECSControlP.Dctl3 -> HplMsp430GeneralIOC.Port17;
  
  
  PECSControlP.Boot -> MainC;
  PECSControlP.Leds -> LedsC;

  components new TimerMilliC();
  components new TimerMilliC() as CmdT;
  components IPStackC;

  PECSControlP.RadioControl ->  IPStackC;
  components new UdpSocketC() as Echo,
    new UdpSocketC() as Reports;
  PECSControlP.Echo -> Echo;

  PECSControlP.Reports -> Reports;

  PECSControlP.ReportTimer -> TimerMilliC;
  PECSControlP.CommandTimer -> CmdT;
  components RPLRoutingC;

  components RandomC;
  PECSControlP.Random -> RandomC;

  // UDP shell on port 2000
  components UDPShellC;

  // prints the routing table
  components RouteCmdC;

#ifdef IN6_PREFIX
  components StaticIPAddressC;
#else
  components Dhcp6C;
  components DhcpCmdC;
#endif


}
