
#include <lib6lowpan/6lowpan.h>

configuration PECSControlFWC {

} implementation {
  components MainC, LedsC;
  components PECSControlFWP;

  components HplMsp430GeneralIOC;
  
  PECSControlFWP.relay -> HplMsp430GeneralIOC.Port21;
  PECSControlFWP.contact -> HplMsp430GeneralIOC.Port60;
  PECSControlFWP.contactg -> HplMsp430GeneralIOC.Port61;
  
  PECSControlFWP.Boot -> MainC;
  PECSControlFWP.Leds -> LedsC;

  components new TimerMilliC() as ReportT;
  components new TimerMilliC() as SetT;
  components new TimerMilliC() as ResetT;
  
  PECSControlFWP.ReportTimer -> ReportT;
  PECSControlFWP.WaveSetTimer -> SetT;
  PECSControlFWP.WaveResetTimer -> ResetT;
  
  components IPStackC;

  PECSControlFWP.RadioControl ->  IPStackC;
  components new UdpSocketC() as Echo,
    new UdpSocketC() as Reports;
  PECSControlFWP.Echo -> Echo;

  PECSControlFWP.Reports -> Reports;

  components RPLRoutingC;

  components RandomC;
  PECSControlFWP.Random -> RandomC;

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
