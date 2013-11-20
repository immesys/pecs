
#include <lib6lowpan/6lowpan.h>

configuration PECSControlC {

} implementation {
  components MainC, LedsC;
  components PECSControlP;

  components HplMsp430GeneralIOC;
  components HplMsp430InterruptC;
  
  PECSControlP.fanA -> HplMsp430GeneralIOC.Port20;
  PECSControlP.fanB -> HplMsp430GeneralIOC.Port21;
  PECSControlP.fanC -> HplMsp430GeneralIOC.Port22;
  PECSControlP.contact -> HplMsp430GeneralIOC.Port26;
  PECSControlP.contacti -> HplMsp430InterruptC.Port26;
  PECSControlP.heat -> HplMsp430GeneralIOC.Port16;
  
  PECSControlP.Boot -> MainC;
  PECSControlP.Leds -> LedsC;

  components new TimerMilliC();
  components IPStackC;

  PECSControlP.RadioControl ->  IPStackC;
  components new UdpSocketC() as Echo,
    new UdpSocketC() as Reports;
  PECSControlP.Echo -> Echo;

  PECSControlP.Reports -> Reports;

  PECSControlP.ReportTimer -> TimerMilliC;

 // components UdpC, IPDispatchC;
 // UDPEchoP.IPStats -> IPDispatchC;
 // UDPEchoP.UDPStats -> UdpC;

#ifdef RPL_ROUTING
  components RPLRoutingC;
#endif

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

#ifdef PRINTFUART_ENABLED
  /* This component wires printf directly to the serial port, and does
   * not use any framing.  You can view the output simply by tailing
   * the serial device.  Unlike the old printfUART, this allows us to
   * use PlatformSerialC to provide the serial driver.
   * 
   * For instance:
   * $ stty -F /dev/ttyUSB0 115200
   * $ tail -f /dev/ttyUSB0
  */
  components SerialPrintfC;

  /* This is the alternative printf implementation which puts the
   * output in framed tinyos serial messages.  This lets you operate
   * alongside other users of the tinyos serial stack.
   */
  // components PrintfC;
  // components SerialStartC;
#endif

}
