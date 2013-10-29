<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="Mechanical" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Gehäuse" color="7" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="yes" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="yes" active="yes"/>
<layer number="254" name="OrgLBR" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="pecs">
<packages>
<package name="TO252-5">
<smd name="TAG" x="0" y="0" dx="8" dy="6" layer="1" rot="R270"/>
<smd name="P5" x="2.6" y="-7.75" dx="3.5" dy="0.8" layer="1" rot="R90"/>
<smd name="P4" x="1.33" y="-7.75" dx="3.5" dy="0.8" layer="1" rot="R90"/>
<smd name="P2" x="-1.21" y="-7.75" dx="3.5" dy="0.8" layer="1" rot="R90"/>
<smd name="P1" x="-2.48" y="-7.75" dx="3.5" dy="0.8" layer="1" rot="R90"/>
<wire x1="-3.5" y1="4.5" x2="3.5" y2="4.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="4.5" x2="3.5" y2="-10" width="0.127" layer="21"/>
<wire x1="3.5" y1="-10" x2="-3.5" y2="-10" width="0.127" layer="21"/>
<wire x1="-3.5" y1="-10" x2="-3.5" y2="4.5" width="0.127" layer="21"/>
<text x="-3.5" y="-11.5" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="SMPS_MODULE">
<pad name="VIN" x="-2.54" y="0" drill="1" shape="square"/>
<pad name="GND" x="0" y="0" drill="1"/>
<pad name="VOUT" x="2.54" y="0" drill="1"/>
<wire x1="-5.334" y1="4.064" x2="5.334" y2="4.064" width="0.127" layer="21"/>
<wire x1="5.334" y1="4.064" x2="5.334" y2="-3.556" width="0.127" layer="21"/>
<wire x1="5.334" y1="-3.556" x2="-5.334" y2="-3.556" width="0.127" layer="21"/>
<wire x1="-5.334" y1="-3.556" x2="-5.334" y2="4.064" width="0.127" layer="21"/>
</package>
<package name="0805">
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
<wire x1="1.905" y1="-0.9525" x2="-1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0.9525" x2="1.905" y2="0.9525" width="0.127" layer="21"/>
<wire x1="1.905" y1="0.9525" x2="1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0.9525" x2="-1.905" y2="-0.9525" width="0.127" layer="21"/>
</package>
<package name="MSOP10">
<smd name="P10" x="0" y="3.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P9" x="0.5" y="3.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P8" x="1" y="3.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P7" x="1.5" y="3.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P6" x="2" y="3.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P1" x="0" y="-0.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P2" x="0.5" y="-0.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P3" x="1" y="-0.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P4" x="1.5" y="-0.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<smd name="P5" x="2" y="-0.75" dx="1.5" dy="0.305" layer="1" rot="R90"/>
<wire x1="-0.5" y1="3.5" x2="-0.5" y2="0" width="0.127" layer="21"/>
<wire x1="-0.5" y1="0" x2="-0.5" y2="-0.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="3.5" x2="2.5" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-0.5" y1="0" x2="-1" y2="0" width="0.127" layer="21"/>
<wire x1="-1" y1="0" x2="-1" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.5" x2="-0.5" y2="-0.5" width="0.127" layer="21"/>
</package>
<package name="NTD2955">
<smd name="TAG" x="0" y="8.6" dx="5.8" dy="8.2" layer="1"/>
<smd name="P3" x="2.3" y="0" dx="4" dy="1.6" layer="1" rot="R90"/>
<smd name="P1" x="-2.3" y="0" dx="4" dy="1.6" layer="1" rot="R90"/>
<wire x1="-3.6" y1="13.2" x2="-3.6" y2="-2.4" width="0.127" layer="21"/>
<wire x1="-3.6" y1="-2.4" x2="3.6" y2="-2.4" width="0.127" layer="25"/>
<wire x1="3.6" y1="-2.4" x2="3.6" y2="13.2" width="0.127" layer="21"/>
<wire x1="3.6" y1="13.2" x2="-3.6" y2="13.2" width="0.127" layer="21"/>
<text x="-3.6" y="-4" size="1.27" layer="21">&gt;NAME</text>
</package>
<package name="SOT23-3">
<wire x1="-1.5" y1="1" x2="-2" y2="1" width="0.127" layer="21"/>
<wire x1="-2" y1="1" x2="-2" y2="-1" width="0.127" layer="21"/>
<wire x1="-2" y1="-1" x2="-0.5" y2="-1" width="0.127" layer="21"/>
<wire x1="0.5" y1="-1" x2="2" y2="-1" width="0.127" layer="21"/>
<wire x1="2" y1="-1" x2="2" y2="1" width="0.127" layer="21"/>
<wire x1="2" y1="1" x2="1.5" y2="1" width="0.127" layer="21"/>
<wire x1="-0.5" y1="1" x2="0.5" y2="1" width="0.127" layer="21"/>
<smd name="P3" x="0" y="-1.05" dx="0.8" dy="1.2" layer="1"/>
<smd name="P2" x="-0.95" y="0.95" dx="0.8" dy="1.2" layer="1"/>
<smd name="P1" x="0.95" y="0.95" dx="0.8" dy="1.2" layer="1"/>
<text x="2.54" y="-2.54" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="1206">
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.27" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.127" layer="21"/>
</package>
<package name="DPAK">
<smd name="TAG" x="0" y="8.6" dx="5.8" dy="8.2" layer="1"/>
<smd name="P3" x="2.3" y="0" dx="4" dy="1.6" layer="1" rot="R90"/>
<smd name="P1" x="-2.3" y="0" dx="4" dy="1.6" layer="1" rot="R90"/>
<wire x1="-3.6" y1="13.2" x2="-3.6" y2="-2.4" width="0.127" layer="21"/>
<wire x1="-3.6" y1="-2.4" x2="3.6" y2="-2.4" width="0.127" layer="25"/>
<wire x1="3.6" y1="-2.4" x2="3.6" y2="13.2" width="0.127" layer="21"/>
<wire x1="3.6" y1="13.2" x2="-3.6" y2="13.2" width="0.127" layer="21"/>
<text x="-3.6" y="-4" size="1.27" layer="21">&gt;NAME</text>
</package>
<package name="HM10">
<smd name="P$22" x="0" y="0" dx="1.9" dy="1" layer="1"/>
<smd name="P$23" x="0" y="1.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$24" x="0" y="3" dx="1.9" dy="1" layer="1"/>
<smd name="P$25" x="0" y="4.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$26" x="0" y="6" dx="1.9" dy="1" layer="1"/>
<smd name="P$27" x="0" y="7.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$28" x="0" y="9" dx="1.9" dy="1" layer="1"/>
<smd name="P$29" x="0" y="10.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$30" x="0" y="12" dx="1.9" dy="1" layer="1"/>
<smd name="P$31" x="0" y="13.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$32" x="0" y="15" dx="1.9" dy="1" layer="1"/>
<smd name="P$33" x="0" y="16.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$34" x="0" y="18" dx="1.9" dy="1" layer="1"/>
<smd name="P$13" x="-13.1" y="0" dx="1.9" dy="1" layer="1"/>
<smd name="P$12" x="-13.1" y="1.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$11" x="-13.1" y="3" dx="1.9" dy="1" layer="1"/>
<smd name="P$10" x="-13.1" y="4.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$9" x="-13.1" y="6" dx="1.9" dy="1" layer="1"/>
<smd name="P$8" x="-13.1" y="7.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$7" x="-13.1" y="9" dx="1.9" dy="1" layer="1"/>
<smd name="P$6" x="-13.1" y="10.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$5" x="-13.1" y="12" dx="1.9" dy="1" layer="1"/>
<smd name="P$4" x="-13.1" y="13.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$3" x="-13.1" y="15" dx="1.9" dy="1" layer="1"/>
<smd name="P$2" x="-13.1" y="16.5" dx="1.9" dy="1" layer="1"/>
<smd name="P$1" x="-13.1" y="18" dx="1.9" dy="1" layer="1"/>
<smd name="P$21" x="-1.35" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$20" x="-2.85" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$19" x="-4.35" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$18" x="-5.85" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$17" x="-7.35" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$16" x="-8.85" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$15" x="-10.35" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<smd name="P$14" x="-11.85" y="-1.84" dx="1.9" dy="1" layer="1" rot="R90"/>
<wire x1="-14.5" y1="25.5" x2="1.5" y2="25.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="25.5" x2="1.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-3.5" x2="-14.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="-14.5" y1="-3.5" x2="-14.5" y2="25.5" width="0.127" layer="21"/>
<text x="-14" y="-5" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="HD.1-16">
<pad name="P1" x="0" y="0" drill="1" shape="square"/>
<pad name="P2" x="0" y="2.54" drill="1" shape="octagon"/>
<pad name="P3" x="2.54" y="0" drill="1" shape="octagon"/>
<pad name="P4" x="2.54" y="2.54" drill="1" shape="octagon"/>
<pad name="P5" x="5.08" y="0" drill="1" shape="octagon"/>
<pad name="P6" x="5.08" y="2.54" drill="1" shape="octagon"/>
<pad name="P7" x="7.62" y="0" drill="1" shape="octagon"/>
<pad name="P8" x="7.62" y="2.54" drill="1" shape="octagon"/>
<pad name="P9" x="10.16" y="0" drill="1" shape="octagon"/>
<pad name="P10" x="10.16" y="2.54" drill="1" shape="octagon"/>
<pad name="P11" x="12.7" y="0" drill="1" shape="octagon"/>
<pad name="P12" x="12.7" y="2.54" drill="1" shape="octagon"/>
<pad name="P13" x="15.24" y="0" drill="1" shape="octagon"/>
<pad name="P14" x="15.24" y="2.54" drill="1" shape="octagon"/>
<wire x1="-1.27" y1="3.81" x2="-1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="16.51" y2="-1.27" width="0.127" layer="21"/>
<wire x1="16.51" y1="-1.27" x2="16.51" y2="3.81" width="0.127" layer="21"/>
<wire x1="16.51" y1="3.81" x2="-1.27" y2="3.81" width="0.127" layer="21"/>
</package>
<package name="H.1-2">
<pad name="P1" x="0" y="0" drill="1" shape="square"/>
<pad name="P2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-1.27" y1="1.27" x2="3.81" y2="1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="-1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="1.27" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="BA00BC0WFP-E2_ADJ_LDO">
<pin name="VIN" x="-5.08" y="0" visible="pin" length="middle" direction="pwr"/>
<pin name="CTL" x="-5.08" y="-2.54" visible="pin" length="middle"/>
<pin name="OUT" x="22.86" y="0" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="ADJ" x="22.86" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="GND" x="22.86" y="-5.08" visible="pin" length="middle" direction="pwr" rot="R180"/>
<wire x1="0" y1="2.54" x2="0" y2="-7.62" width="0.254" layer="94"/>
<wire x1="0" y1="-7.62" x2="17.78" y2="-7.62" width="0.254" layer="94"/>
<wire x1="17.78" y1="-7.62" x2="17.78" y2="2.54" width="0.254" layer="94"/>
<wire x1="17.78" y1="2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="0.254" y="-9.652" size="1.27" layer="95">&gt;NAME</text>
<text x="0" y="2.794" size="1.27" layer="97">BA00BC0WFP-E2</text>
</symbol>
<symbol name="OKI-78SR_3V3_SMPS">
<pin name="VIN" x="-7.62" y="5.08" visible="pin" length="middle" direction="pwr"/>
<pin name="GND" x="17.78" y="2.54" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="VOUT" x="17.78" y="5.08" visible="pin" length="middle" direction="pwr" rot="R180"/>
<wire x1="-2.54" y1="7.62" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="12.7" y2="0" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="12.7" y2="7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<text x="-2.032" y="-1.524" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="7.874" size="1.27" layer="96">OKI-78SR-3V3</text>
</symbol>
<symbol name="CAPACITOR">
<pin name="P$1" x="-2.54" y="0" visible="off" length="point" direction="pas"/>
<pin name="P$2" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<wire x1="-2.54" y1="0" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="0.508" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="1.016" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.508" y2="-1.016" width="0.254" layer="94"/>
<wire x1="0.508" y1="-1.016" x2="0.508" y2="0" width="0.254" layer="94"/>
<wire x1="0.508" y1="0" x2="0.508" y2="1.016" width="0.254" layer="94"/>
<text x="-0.508" y="-3.048" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="2.54" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="AD5290">
<pin name="A" x="15.24" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="B" x="15.24" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="W" x="15.24" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="VSS" x="15.24" y="-2.54" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="VDD" x="15.24" y="7.62" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="MOSI" x="-12.7" y="7.62" visible="pin" length="middle"/>
<pin name="!CS!" x="-12.7" y="2.54" visible="pin" length="middle"/>
<pin name="GND" x="-12.7" y="-2.54" visible="pin" length="middle" direction="pwr"/>
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<pin name="MISO" x="-12.7" y="5.08" visible="pin" length="middle"/>
<pin name="CLK" x="-12.7" y="0" visible="pin" length="middle"/>
<text x="-7.112" y="-6.858" size="1.27" layer="95">&gt;NAME</text>
<text x="-7.366" y="10.414" size="1.27" layer="95">AD5290YRMZ100</text>
</symbol>
<symbol name="RESISTOR">
<pin name="P$1" x="-5.08" y="0" visible="off" length="point" direction="pas"/>
<pin name="P$2" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<wire x1="-5.08" y1="0" x2="-3.81" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0" x2="-3.556" y2="1.016" width="0.254" layer="94"/>
<wire x1="-3.556" y1="1.016" x2="-2.921" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-2.921" y1="-1.016" x2="-2.286" y2="1.016" width="0.254" layer="94"/>
<wire x1="-2.286" y1="1.016" x2="-1.651" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-1.651" y1="-1.016" x2="-1.016" y2="1.016" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.016" x2="-0.381" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-1.016" x2="0.254" y2="1.016" width="0.254" layer="94"/>
<wire x1="0.254" y1="1.016" x2="0.889" y2="-1.016" width="0.254" layer="94"/>
<wire x1="0.889" y1="-1.016" x2="1.27" y2="0" width="0.254" layer="94"/>
<text x="-4.826" y="-2.794" size="1.27" layer="95">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="PFET">
<wire x1="0" y1="0.762" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-0.762" width="0.254" layer="94"/>
<wire x1="0" y1="3.683" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.397" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.397" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-3.683" width="0.254" layer="94"/>
<wire x1="-1.143" y1="2.54" x2="-1.143" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="7.62" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<circle x="2.54" y="2.54" radius="0.3592" width="0" layer="94"/>
<text x="-12.7" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<text x="-12.7" y="-1.27" size="1.778" layer="95">&gt;NAME</text>
<pin name="S" x="2.54" y="7.62" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="D" x="2.54" y="-7.62" visible="off" length="middle" direction="pas" rot="R90"/>
<pin name="G" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<polygon width="0.1524" layer="94">
<vertex x="2.286" y="0"/>
<vertex x="1.27" y="0.762"/>
<vertex x="1.27" y="-0.762"/>
</polygon>
<wire x1="-1.27" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="2.54" width="0.1524" layer="94"/>
</symbol>
<symbol name="NFET">
<wire x1="0" y1="-2.54" x2="1.3208" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0.762" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="3.683" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.397" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
<wire x1="5.08" y1="0" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-1.397" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="-3.683" width="0.254" layer="94"/>
<wire x1="1.397" y1="2.54" x2="1.397" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="7.62" width="0.1524" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<circle x="5.08" y="-2.54" radius="0.3592" width="0" layer="94"/>
<text x="-8.89" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="-8.89" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<pin name="D" x="5.08" y="7.62" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="S" x="5.08" y="-7.62" visible="off" length="middle" direction="pas" rot="R90"/>
<pin name="G" x="-2.54" y="-2.54" visible="off" length="short" direction="pas"/>
<polygon width="0.1524" layer="94">
<vertex x="2.794" y="0"/>
<vertex x="3.81" y="0.762"/>
<vertex x="3.81" y="-0.762"/>
</polygon>
</symbol>
<symbol name="HM10_BLE">
<pin name="UART_TX" x="-38.1" y="17.78" visible="pin" length="middle"/>
<pin name="UART_RX" x="-38.1" y="15.24" visible="pin" length="middle"/>
<pin name="UART_CTS" x="-38.1" y="12.7" visible="pin" length="middle"/>
<pin name="UART_RTS" x="-38.1" y="10.16" visible="pin" length="middle"/>
<pin name="NC1" x="-38.1" y="7.62" visible="pin" length="middle" direction="nc"/>
<pin name="NC2" x="-38.1" y="5.08" visible="pin" length="middle" direction="nc"/>
<pin name="NC3" x="-38.1" y="2.54" visible="pin" length="middle" direction="nc"/>
<pin name="NC4" x="-38.1" y="0" visible="pin" length="middle" direction="nc"/>
<pin name="NC5" x="-38.1" y="-2.54" visible="pin" length="middle" direction="nc"/>
<pin name="NC6" x="-38.1" y="-5.08" visible="pin" length="middle" direction="nc"/>
<pin name="RESETB" x="-38.1" y="-7.62" visible="pin" length="middle" direction="in"/>
<pin name="VCC" x="-38.1" y="-10.16" visible="pin" length="middle" direction="pwr"/>
<pin name="GND1" x="-38.1" y="-12.7" visible="pin" length="middle" direction="pwr"/>
<pin name="GND2" x="-27.94" y="-30.48" visible="pin" length="middle" direction="pwr" rot="R90"/>
<pin name="USB_D-" x="-25.4" y="-30.48" visible="pin" length="middle" rot="R90"/>
<pin name="NC7" x="-22.86" y="-30.48" visible="pin" length="middle" direction="nc" rot="R90"/>
<pin name="NC8" x="-20.32" y="-30.48" visible="pin" length="middle" direction="nc" rot="R90"/>
<pin name="NC9" x="-17.78" y="-30.48" visible="pin" length="middle" direction="nc" rot="R90"/>
<pin name="NC10" x="-15.24" y="-30.48" visible="pin" length="middle" direction="nc" rot="R90"/>
<pin name="UB_D+" x="-12.7" y="-30.48" visible="pin" length="middle" rot="R90"/>
<pin name="GND3" x="-10.16" y="-30.48" visible="pin" length="middle" direction="pwr" rot="R90"/>
<pin name="GND4" x="0" y="-12.7" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="PIO0" x="0" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="PIO1" x="0" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="PIO2" x="0" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="PIO3" x="0" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="PIO4" x="0" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="PIO5" x="0" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="PIO6" x="0" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="PIO7" x="0" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="PIO8" x="0" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="PIO9" x="0" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="PIO10" x="0" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="PIO11" x="0" y="17.78" visible="pin" length="middle" rot="R180"/>
<wire x1="-33.02" y1="35.56" x2="-33.02" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-33.02" y1="-25.4" x2="-5.08" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-25.4" x2="-5.08" y2="35.56" width="0.254" layer="94"/>
<wire x1="-7.62" y1="22.86" x2="-7.62" y2="33.02" width="0.254" layer="94"/>
<wire x1="-7.62" y1="33.02" x2="-12.7" y2="33.02" width="0.254" layer="94"/>
<wire x1="-12.7" y1="33.02" x2="-12.7" y2="25.4" width="0.254" layer="94"/>
<wire x1="-12.7" y1="25.4" x2="-17.78" y2="25.4" width="0.254" layer="94"/>
<wire x1="-17.78" y1="25.4" x2="-17.78" y2="33.02" width="0.254" layer="94"/>
<wire x1="-17.78" y1="33.02" x2="-22.86" y2="33.02" width="0.254" layer="94"/>
<wire x1="-22.86" y1="33.02" x2="-22.86" y2="25.4" width="0.254" layer="94"/>
<wire x1="-22.86" y1="25.4" x2="-27.94" y2="25.4" width="0.254" layer="94"/>
<wire x1="-27.94" y1="25.4" x2="-27.94" y2="33.02" width="0.254" layer="94"/>
<wire x1="-27.94" y1="33.02" x2="-30.48" y2="33.02" width="0.254" layer="94"/>
<wire x1="-33.02" y1="35.56" x2="-5.08" y2="35.56" width="0.254" layer="94"/>
</symbol>
<symbol name="HD.1-14">
<pin name="1" x="-7.62" y="2.54" visible="pin" length="middle"/>
<pin name="2" x="15.24" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="3" x="-7.62" y="0" visible="pin" length="middle"/>
<pin name="5" x="-7.62" y="-2.54" visible="pin" length="middle"/>
<pin name="7" x="-7.62" y="-5.08" visible="pin" length="middle"/>
<pin name="9" x="-7.62" y="-7.62" visible="pin" length="middle"/>
<pin name="11" x="-7.62" y="-10.16" visible="pin" length="middle"/>
<pin name="4" x="15.24" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="6" x="15.24" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="8" x="15.24" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="10" x="15.24" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="12" x="15.24" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="13" x="-7.62" y="-12.7" visible="pin" length="middle"/>
<pin name="14" x="15.24" y="-12.7" visible="pin" length="middle" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-15.24" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<text x="-2.286" y="-17.018" size="1.27" layer="95">&gt;NAME</text>
</symbol>
<symbol name="H.1-2">
<pin name="1" x="-5.08" y="0" visible="pin" length="middle"/>
<pin name="2" x="-5.08" y="-2.54" visible="pin" length="middle"/>
<wire x1="0" y1="2.54" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="0" y="-7.62" size="1.778" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="BA00BC0WFP-E2_ADJ_LDO" prefix="U">
<gates>
<gate name="G$1" symbol="BA00BC0WFP-E2_ADJ_LDO" x="-7.62" y="2.54"/>
</gates>
<devices>
<device name="" package="TO252-5">
<connects>
<connect gate="G$1" pin="ADJ" pad="P5"/>
<connect gate="G$1" pin="CTL" pad="P1"/>
<connect gate="G$1" pin="GND" pad="TAG"/>
<connect gate="G$1" pin="OUT" pad="P4"/>
<connect gate="G$1" pin="VIN" pad="P2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="OKI-78SR_3V3_SMPS" prefix="U">
<gates>
<gate name="G$1" symbol="OKI-78SR_3V3_SMPS" x="-5.08" y="-2.54"/>
</gates>
<devices>
<device name="" package="SMPS_MODULE">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="VOUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0805_CAPACITOR" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="AD5290" prefix="U">
<gates>
<gate name="G$1" symbol="AD5290" x="-2.54" y="-2.54"/>
</gates>
<devices>
<device name="" package="MSOP10">
<connects>
<connect gate="G$1" pin="!CS!" pad="P5"/>
<connect gate="G$1" pin="A" pad="P1"/>
<connect gate="G$1" pin="B" pad="P2"/>
<connect gate="G$1" pin="CLK" pad="P6"/>
<connect gate="G$1" pin="GND" pad="P4"/>
<connect gate="G$1" pin="MISO" pad="P8"/>
<connect gate="G$1" pin="MOSI" pad="P7"/>
<connect gate="G$1" pin="VDD" pad="P9"/>
<connect gate="G$1" pin="VSS" pad="P3"/>
<connect gate="G$1" pin="W" pad="P10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0805_RESISTOR" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NTD2955G_PCH" prefix="Q">
<gates>
<gate name="G$1" symbol="PFET" x="0" y="0"/>
</gates>
<devices>
<device name="" package="NTD2955">
<connects>
<connect gate="G$1" pin="D" pad="TAG"/>
<connect gate="G$1" pin="G" pad="P1"/>
<connect gate="G$1" pin="S" pad="P3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NFET">
<gates>
<gate name="G$1" symbol="NFET" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-3">
<connects>
<connect gate="G$1" pin="D" pad="P3"/>
<connect gate="G$1" pin="G" pad="P1"/>
<connect gate="G$1" pin="S" pad="P2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1206_RESISTOR" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1206">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NFET_DPAK" prefix="Q">
<gates>
<gate name="G$1" symbol="NFET" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="DPAK">
<connects>
<connect gate="G$1" pin="D" pad="TAG"/>
<connect gate="G$1" pin="G" pad="P1"/>
<connect gate="G$1" pin="S" pad="P3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HM10_BLE" prefix="BLE">
<gates>
<gate name="G$1" symbol="HM10_BLE" x="17.78" y="-2.54"/>
</gates>
<devices>
<device name="" package="HM10">
<connects>
<connect gate="G$1" pin="GND1" pad="P$13"/>
<connect gate="G$1" pin="GND2" pad="P$14"/>
<connect gate="G$1" pin="GND3" pad="P$21"/>
<connect gate="G$1" pin="GND4" pad="P$22"/>
<connect gate="G$1" pin="NC1" pad="P$5"/>
<connect gate="G$1" pin="NC10" pad="P$19"/>
<connect gate="G$1" pin="NC2" pad="P$6"/>
<connect gate="G$1" pin="NC3" pad="P$7"/>
<connect gate="G$1" pin="NC4" pad="P$8"/>
<connect gate="G$1" pin="NC5" pad="P$9"/>
<connect gate="G$1" pin="NC6" pad="P$10"/>
<connect gate="G$1" pin="NC7" pad="P$16"/>
<connect gate="G$1" pin="NC8" pad="P$17"/>
<connect gate="G$1" pin="NC9" pad="P$18"/>
<connect gate="G$1" pin="PIO0" pad="P$23"/>
<connect gate="G$1" pin="PIO1" pad="P$24"/>
<connect gate="G$1" pin="PIO10" pad="P$33"/>
<connect gate="G$1" pin="PIO11" pad="P$34"/>
<connect gate="G$1" pin="PIO2" pad="P$25"/>
<connect gate="G$1" pin="PIO3" pad="P$26"/>
<connect gate="G$1" pin="PIO4" pad="P$27"/>
<connect gate="G$1" pin="PIO5" pad="P$28"/>
<connect gate="G$1" pin="PIO6" pad="P$29"/>
<connect gate="G$1" pin="PIO7" pad="P$30"/>
<connect gate="G$1" pin="PIO8" pad="P$31"/>
<connect gate="G$1" pin="PIO9" pad="P$32"/>
<connect gate="G$1" pin="RESETB" pad="P$11"/>
<connect gate="G$1" pin="UART_CTS" pad="P$3"/>
<connect gate="G$1" pin="UART_RTS" pad="P$4"/>
<connect gate="G$1" pin="UART_RX" pad="P$2"/>
<connect gate="G$1" pin="UART_TX" pad="P$1"/>
<connect gate="G$1" pin="UB_D+" pad="P$20"/>
<connect gate="G$1" pin="USB_D-" pad="P$15"/>
<connect gate="G$1" pin="VCC" pad="P$12"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HD.1-14" prefix="J">
<gates>
<gate name="G$1" symbol="HD.1-14" x="-5.08" y="5.08"/>
</gates>
<devices>
<device name="" package="HD.1-16">
<connects>
<connect gate="G$1" pin="1" pad="P1"/>
<connect gate="G$1" pin="10" pad="P10"/>
<connect gate="G$1" pin="11" pad="P11"/>
<connect gate="G$1" pin="12" pad="P12"/>
<connect gate="G$1" pin="13" pad="P13"/>
<connect gate="G$1" pin="14" pad="P14"/>
<connect gate="G$1" pin="2" pad="P2"/>
<connect gate="G$1" pin="3" pad="P3"/>
<connect gate="G$1" pin="4" pad="P4"/>
<connect gate="G$1" pin="5" pad="P5"/>
<connect gate="G$1" pin="6" pad="P6"/>
<connect gate="G$1" pin="7" pad="P7"/>
<connect gate="G$1" pin="8" pad="P8"/>
<connect gate="G$1" pin="9" pad="P9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="H.1-2" prefix="J" uservalue="yes">
<gates>
<gate name="G$1" symbol="H.1-2" x="-2.54" y="2.54"/>
</gates>
<devices>
<device name="" package="H.1-2">
<connects>
<connect gate="G$1" pin="1" pad="P1"/>
<connect gate="G$1" pin="2" pad="P2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" prefix="+3V3">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+14V">
<wire x1="0" y1="1.905" x2="0" y2="0.635" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-2.54" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+14V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+14V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+14V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="pecs" deviceset="BA00BC0WFP-E2_ADJ_LDO" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="+14V" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="U2" library="pecs" deviceset="OKI-78SR_3V3_SMPS" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="C1" library="pecs" deviceset="0805_CAPACITOR" device="" value="10uF"/>
<part name="C2" library="pecs" deviceset="0805_CAPACITOR" device="" value="1uF"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="+14V" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="U3" library="pecs" deviceset="AD5290" device=""/>
<part name="R1" library="pecs" deviceset="0805_RESISTOR" device="" value="3k9"/>
<part name="R2" library="pecs" deviceset="0805_RESISTOR" device="" value="33k"/>
<part name="SUPPLY3" library="supply2" deviceset="+14V" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="Q1" library="pecs" deviceset="NTD2955G_PCH" device=""/>
<part name="SUPPLY4" library="supply2" deviceset="+14V" device=""/>
<part name="Q2" library="pecs" deviceset="NFET" device=""/>
<part name="R3" library="pecs" deviceset="0805_RESISTOR" device=""/>
<part name="R4" library="pecs" deviceset="0805_RESISTOR" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="R6" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="R7" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="R8" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="R9" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="R10" library="pecs" deviceset="1206_RESISTOR" device=""/>
<part name="Q3" library="pecs" deviceset="NFET_DPAK" device=""/>
<part name="Q4" library="pecs" deviceset="NFET_DPAK" device=""/>
<part name="Q5" library="pecs" deviceset="NFET_DPAK" device=""/>
<part name="Q6" library="pecs" deviceset="NFET_DPAK" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="R11" library="pecs" deviceset="0805_RESISTOR" device="" value="10k"/>
<part name="R12" library="pecs" deviceset="0805_RESISTOR" device="" value="10k"/>
<part name="R13" library="pecs" deviceset="0805_RESISTOR" device="" value="10k"/>
<part name="R14" library="pecs" deviceset="0805_RESISTOR" device="" value="1k8"/>
<part name="BLE1" library="pecs" deviceset="HM10_BLE" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="J1" library="pecs" deviceset="HD.1-14" device=""/>
<part name="J2" library="pecs" deviceset="H.1-2" device=""/>
<part name="J3" library="pecs" deviceset="H.1-2" device=""/>
<part name="J4" library="pecs" deviceset="H.1-2" device=""/>
<part name="J5" library="pecs" deviceset="H.1-2" device=""/>
<part name="J6" library="pecs" deviceset="H.1-2" device=""/>
<part name="SUPPLY5" library="supply2" deviceset="+14V" device=""/>
<part name="J7" library="pecs" deviceset="H.1-2" device=""/>
<part name="SUPPLY6" library="supply2" deviceset="+14V" device=""/>
<part name="R15" library="pecs" deviceset="0805_RESISTOR" device="" value="4k7"/>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="167.64" y="33.02" size="1.27" layer="97">Bypass J</text>
</plain>
<instances>
<instance part="U1" gate="G$1" x="53.34" y="45.72"/>
<instance part="SUPPLY1" gate="G$1" x="-22.86" y="45.72"/>
<instance part="+3V1" gate="G$1" x="10.16" y="45.72" smashed="yes">
<attribute name="VALUE" x="12.446" y="48.26" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U2" gate="G$1" x="-12.7" y="35.56"/>
<instance part="GND2" gate="1" x="10.16" y="30.48"/>
<instance part="C1" gate="G$1" x="-22.86" y="38.1" smashed="yes" rot="R90">
<attribute name="NAME" x="-21.336" y="37.846" size="1.27" layer="95"/>
<attribute name="VALUE" x="-21.336" y="36.068" size="1.27" layer="96"/>
</instance>
<instance part="C2" gate="G$1" x="10.16" y="38.1" smashed="yes" rot="R90">
<attribute name="NAME" x="11.938" y="38.1" size="1.27" layer="95"/>
<attribute name="VALUE" x="11.938" y="36.322" size="1.27" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="-22.86" y="30.48"/>
<instance part="SUPPLY2" gate="G$1" x="45.72" y="50.8"/>
<instance part="GND4" gate="1" x="78.74" y="35.56"/>
<instance part="U3" gate="G$1" x="116.84" y="40.64" rot="MR0"/>
<instance part="R1" gate="G$1" x="96.52" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="95.25" y="53.594" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="95.25" y="52.07" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R2" gate="G$1" x="96.52" y="35.56" smashed="yes" rot="R90">
<attribute name="NAME" x="94.742" y="35.306" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="94.742" y="33.528" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY3" gate="G$1" x="101.6" y="58.42"/>
<instance part="GND5" gate="1" x="96.52" y="25.4"/>
<instance part="Q1" gate="G$1" x="78.74" y="7.62" smashed="yes">
<attribute name="NAME" x="82.042" y="7.874" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY4" gate="G$1" x="81.28" y="22.86"/>
<instance part="Q2" gate="G$1" x="63.5" y="0" smashed="yes">
<attribute name="NAME" x="69.596" y="-0.508" size="1.778" layer="95"/>
</instance>
<instance part="R3" gate="G$1" x="68.58" y="15.24" rot="R90"/>
<instance part="R4" gate="G$1" x="58.42" y="-7.62" rot="R90"/>
<instance part="GND6" gate="1" x="68.58" y="-17.78"/>
<instance part="R5" gate="G$1" x="124.46" y="0" rot="R90"/>
<instance part="R6" gate="G$1" x="129.54" y="0" rot="R90"/>
<instance part="R7" gate="G$1" x="144.78" y="0" rot="R90"/>
<instance part="R8" gate="G$1" x="149.86" y="0" rot="R90"/>
<instance part="R9" gate="G$1" x="134.62" y="0" rot="R90"/>
<instance part="R10" gate="G$1" x="154.94" y="0" rot="R90"/>
<instance part="Q3" gate="G$1" x="124.46" y="-17.78" smashed="yes">
<attribute name="NAME" x="129.794" y="-19.812" size="1.778" layer="95"/>
</instance>
<instance part="Q4" gate="G$1" x="104.14" y="-17.78" smashed="yes">
<attribute name="NAME" x="109.474" y="-19.812" size="1.778" layer="95"/>
</instance>
<instance part="Q5" gate="G$1" x="144.78" y="-17.78" smashed="yes">
<attribute name="NAME" x="150.114" y="-19.812" size="1.778" layer="95"/>
</instance>
<instance part="Q6" gate="G$1" x="165.1" y="-17.78" smashed="yes">
<attribute name="NAME" x="170.434" y="-19.812" size="1.778" layer="95"/>
</instance>
<instance part="GND7" gate="1" x="177.8" y="-33.02"/>
<instance part="R11" gate="G$1" x="101.6" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="99.822" y="-23.114" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="99.822" y="-24.892" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R12" gate="G$1" x="121.92" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="120.142" y="-23.114" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="120.142" y="-24.892" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R13" gate="G$1" x="142.24" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="140.462" y="-23.114" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="140.462" y="-24.892" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="R14" gate="G$1" x="162.56" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="160.782" y="-23.114" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="160.782" y="-24.892" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="BLE1" gate="G$1" x="25.4" y="-17.78"/>
<instance part="GND1" gate="1" x="15.24" y="-58.42"/>
<instance part="GND8" gate="1" x="30.48" y="-38.1"/>
<instance part="GND9" gate="1" x="-17.78" y="-38.1"/>
<instance part="+3V2" gate="G$1" x="-38.1" y="-22.86" smashed="yes">
<attribute name="VALUE" x="-35.814" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND10" gate="1" x="132.08" y="33.02"/>
<instance part="J1" gate="G$1" x="66.04" y="-48.26"/>
<instance part="J2" gate="G$1" x="134.62" y="-40.64"/>
<instance part="J3" gate="G$1" x="-38.1" y="40.64" rot="MR0"/>
<instance part="J4" gate="G$1" x="27.94" y="40.64"/>
<instance part="J5" gate="G$1" x="27.94" y="27.94"/>
<instance part="J6" gate="G$1" x="134.62" y="-60.96"/>
<instance part="SUPPLY5" gate="G$1" x="124.46" y="-55.88"/>
<instance part="J7" gate="G$1" x="172.72" y="43.18"/>
<instance part="SUPPLY6" gate="G$1" x="162.56" y="48.26"/>
<instance part="R15" gate="G$1" x="-20.32" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="-22.098" y="-23.114" size="1.27" layer="95" rot="R180"/>
<attribute name="VALUE" x="-22.098" y="-24.892" size="1.27" layer="96" rot="R180"/>
</instance>
<instance part="FRAME1" gate="G$1" x="-55.88" y="-104.14"/>
</instances>
<busses>
</busses>
<nets>
<net name="+14V" class="0">
<segment>
<pinref part="SUPPLY1" gate="G$1" pin="+14V"/>
<wire x1="-22.86" y1="43.18" x2="-22.86" y2="40.64" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VIN"/>
<wire x1="-22.86" y1="40.64" x2="-20.32" y2="40.64" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="P$2"/>
<junction x="-22.86" y="40.64"/>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="-33.02" y1="40.64" x2="-22.86" y2="40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDD"/>
<wire x1="101.6" y1="48.26" x2="101.6" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SUPPLY3" gate="G$1" pin="+14V"/>
</segment>
<segment>
<pinref part="SUPPLY2" gate="G$1" pin="+14V"/>
<pinref part="U1" gate="G$1" pin="CTL"/>
<wire x1="48.26" y1="43.18" x2="45.72" y2="43.18" width="0.1524" layer="91"/>
<wire x1="45.72" y1="43.18" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VIN"/>
<wire x1="45.72" y1="45.72" x2="45.72" y2="48.26" width="0.1524" layer="91"/>
<wire x1="48.26" y1="45.72" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<junction x="45.72" y="45.72"/>
</segment>
<segment>
<pinref part="SUPPLY4" gate="G$1" pin="+14V"/>
<pinref part="Q1" gate="G$1" pin="S"/>
<wire x1="81.28" y1="20.32" x2="81.28" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="P$2"/>
<wire x1="81.28" y1="17.78" x2="81.28" y2="15.24" width="0.1524" layer="91"/>
<wire x1="68.58" y1="17.78" x2="81.28" y2="17.78" width="0.1524" layer="91"/>
<junction x="81.28" y="17.78"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="1"/>
<wire x1="129.54" y1="-60.96" x2="127" y2="-60.96" width="0.1524" layer="91"/>
<pinref part="SUPPLY5" gate="G$1" pin="+14V"/>
<wire x1="124.46" y1="-58.42" x2="127" y2="-60.96" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY6" gate="G$1" pin="+14V"/>
<wire x1="162.56" y1="45.72" x2="165.1" y2="43.18" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="1"/>
<wire x1="165.1" y1="43.18" x2="167.64" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="VOUT"/>
<wire x1="5.08" y1="40.64" x2="10.16" y2="40.64" width="0.1524" layer="91"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<wire x1="10.16" y1="40.64" x2="10.16" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="P$2"/>
<junction x="10.16" y="40.64"/>
<pinref part="J4" gate="G$1" pin="1"/>
<wire x1="10.16" y1="40.64" x2="20.32" y2="40.64" width="0.1524" layer="91"/>
<wire x1="20.32" y1="40.64" x2="22.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="20.32" y1="40.64" x2="20.32" y2="27.94" width="0.1524" layer="91"/>
<junction x="20.32" y="40.64"/>
<pinref part="J5" gate="G$1" pin="1"/>
<wire x1="20.32" y1="27.94" x2="22.86" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="BLE1" gate="G$1" pin="VCC"/>
<wire x1="-12.7" y1="-27.94" x2="-20.32" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="-27.94" x2="-35.56" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="-27.94" x2="-38.1" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="R15" gate="G$1" pin="P$1"/>
<junction x="-20.32" y="-27.94"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="58.42" y1="-45.72" x2="53.34" y2="-45.72" width="0.1524" layer="91"/>
<label x="53.34" y="-45.72" size="1.27" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="5.08" y1="38.1" x2="7.62" y2="35.56" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
<wire x1="7.62" y1="35.56" x2="10.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="10.16" y1="35.56" x2="10.16" y2="33.02" width="0.1524" layer="91"/>
<junction x="10.16" y="35.56"/>
<wire x1="10.16" y1="35.56" x2="15.24" y2="35.56" width="0.1524" layer="91"/>
<wire x1="15.24" y1="35.56" x2="17.78" y2="38.1" width="0.1524" layer="91"/>
<pinref part="J4" gate="G$1" pin="2"/>
<wire x1="17.78" y1="38.1" x2="22.86" y2="38.1" width="0.1524" layer="91"/>
<wire x1="15.24" y1="35.56" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
<wire x1="15.24" y1="27.94" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
<junction x="15.24" y="35.56"/>
<pinref part="J5" gate="G$1" pin="2"/>
<wire x1="17.78" y1="25.4" x2="22.86" y2="25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="P$1"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="-22.86" y1="35.56" x2="-22.86" y2="33.02" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="-33.02" y1="38.1" x2="-30.48" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="38.1" x2="-27.94" y2="35.56" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="35.56" x2="-22.86" y2="35.56" width="0.1524" layer="91"/>
<junction x="-22.86" y="35.56"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="76.2" y1="40.64" x2="78.74" y2="38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="P$1"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="96.52" y1="30.48" x2="96.52" y2="27.94" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VSS"/>
<wire x1="101.6" y1="38.1" x2="101.6" y2="27.94" width="0.1524" layer="91"/>
<wire x1="101.6" y1="27.94" x2="96.52" y2="27.94" width="0.1524" layer="91"/>
<junction x="96.52" y="27.94"/>
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="S"/>
<wire x1="68.58" y1="-7.62" x2="68.58" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="R4" gate="G$1" pin="P$1"/>
<wire x1="58.42" y1="-12.7" x2="60.96" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-15.24" x2="68.58" y2="-15.24" width="0.1524" layer="91"/>
<junction x="68.58" y="-15.24"/>
</segment>
<segment>
<pinref part="Q4" gate="G$1" pin="S"/>
<wire x1="109.22" y1="-25.4" x2="111.76" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-27.94" x2="121.92" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="Q3" gate="G$1" pin="S"/>
<wire x1="121.92" y1="-27.94" x2="132.08" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="132.08" y1="-27.94" x2="142.24" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-27.94" x2="152.4" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="152.4" y1="-27.94" x2="162.56" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="162.56" y1="-27.94" x2="172.72" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="129.54" y1="-25.4" x2="132.08" y2="-27.94" width="0.1524" layer="91"/>
<junction x="132.08" y="-27.94"/>
<pinref part="Q5" gate="G$1" pin="S"/>
<wire x1="149.86" y1="-25.4" x2="152.4" y2="-27.94" width="0.1524" layer="91"/>
<junction x="152.4" y="-27.94"/>
<pinref part="Q6" gate="G$1" pin="S"/>
<wire x1="170.18" y1="-25.4" x2="172.72" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-27.94" x2="175.26" y2="-27.94" width="0.1524" layer="91"/>
<junction x="172.72" y="-27.94"/>
<wire x1="175.26" y1="-27.94" x2="177.8" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="R12" gate="G$1" pin="P$1"/>
<junction x="121.92" y="-27.94"/>
<pinref part="R13" gate="G$1" pin="P$1"/>
<junction x="142.24" y="-27.94"/>
<pinref part="R14" gate="G$1" pin="P$1"/>
<junction x="162.56" y="-27.94"/>
<pinref part="R11" gate="G$1" pin="P$1"/>
<wire x1="101.6" y1="-27.94" x2="111.76" y2="-27.94" width="0.1524" layer="91"/>
<junction x="111.76" y="-27.94"/>
</segment>
<segment>
<pinref part="BLE1" gate="G$1" pin="GND3"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="15.24" y1="-48.26" x2="15.24" y2="-53.34" width="0.1524" layer="91"/>
<pinref part="BLE1" gate="G$1" pin="GND2"/>
<wire x1="15.24" y1="-53.34" x2="15.24" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="-48.26" x2="-2.54" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="-50.8" x2="0" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="0" y1="-53.34" x2="15.24" y2="-53.34" width="0.1524" layer="91"/>
<junction x="15.24" y="-53.34"/>
</segment>
<segment>
<pinref part="BLE1" gate="G$1" pin="GND4"/>
<wire x1="25.4" y1="-30.48" x2="27.94" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-30.48" x2="30.48" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-33.02" x2="30.48" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="BLE1" gate="G$1" pin="GND1"/>
<wire x1="-12.7" y1="-30.48" x2="-15.24" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-30.48" x2="-17.78" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="-17.78" y1="-33.02" x2="-17.78" y2="-35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="129.54" y1="38.1" x2="132.08" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="81.28" y1="-45.72" x2="86.36" y2="-45.72" width="0.1524" layer="91"/>
<label x="83.82" y="-45.72" size="1.27" layer="95"/>
</segment>
</net>
<net name="FAN_P" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="OUT"/>
<wire x1="76.2" y1="45.72" x2="78.74" y2="45.72" width="0.1524" layer="91"/>
<label x="83.82" y="45.72" size="1.27" layer="95" xref="yes"/>
<wire x1="78.74" y1="45.72" x2="83.82" y2="45.72" width="0.1524" layer="91"/>
<wire x1="78.74" y1="45.72" x2="78.74" y2="55.88" width="0.1524" layer="91"/>
<junction x="78.74" y="45.72"/>
<pinref part="R1" gate="G$1" pin="P$2"/>
<wire x1="78.74" y1="55.88" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="81.28" y1="0" x2="81.28" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="81.28" y1="-2.54" x2="83.82" y2="-2.54" width="0.1524" layer="91"/>
<label x="83.82" y="-2.54" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="129.54" y1="-40.64" x2="127" y2="-40.64" width="0.1524" layer="91"/>
<label x="124.46" y="-40.64" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="2"/>
<wire x1="167.64" y1="40.64" x2="162.56" y2="40.64" width="0.1524" layer="91"/>
<label x="162.56" y="40.64" size="1.27" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="A"/>
<wire x1="99.06" y1="45.72" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<wire x1="99.06" y1="45.72" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="B"/>
<wire x1="101.6" y1="40.64" x2="99.06" y2="40.64" width="0.1524" layer="91"/>
<wire x1="99.06" y1="40.64" x2="96.52" y2="38.1" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="ADJ"/>
<pinref part="U3" gate="G$1" pin="W"/>
<wire x1="76.2" y1="43.18" x2="101.6" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="G"/>
<pinref part="R3" gate="G$1" pin="P$1"/>
<wire x1="73.66" y1="10.16" x2="68.58" y2="10.16" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="D"/>
<wire x1="68.58" y1="10.16" x2="68.58" y2="7.62" width="0.1524" layer="91"/>
<junction x="68.58" y="10.16"/>
</segment>
</net>
<net name="RBYPASS" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="G"/>
<wire x1="60.96" y1="-2.54" x2="58.42" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
<wire x1="58.42" y1="-2.54" x2="58.42" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-2.54" x2="55.88" y2="-2.54" width="0.1524" layer="91"/>
<junction x="58.42" y="-2.54"/>
<label x="55.88" y="-2.54" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="11"/>
<wire x1="58.42" y1="-58.42" x2="53.34" y2="-58.42" width="0.1524" layer="91"/>
<label x="53.34" y="-58.42" size="1.27" layer="95"/>
</segment>
</net>
<net name="FAN_N" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="D"/>
<wire x1="109.22" y1="-10.16" x2="109.22" y2="10.16" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
<wire x1="124.46" y1="2.54" x2="127" y2="5.08" width="0.1524" layer="91"/>
<wire x1="127" y1="5.08" x2="129.54" y2="5.08" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="5.08" x2="132.08" y2="5.08" width="0.1524" layer="91"/>
<wire x1="132.08" y1="5.08" x2="134.62" y2="2.54" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="5.08" x2="129.54" y2="2.54" width="0.1524" layer="91"/>
<junction x="129.54" y="5.08"/>
<wire x1="129.54" y1="5.08" x2="129.54" y2="10.16" width="0.1524" layer="91"/>
<wire x1="109.22" y1="10.16" x2="129.54" y2="10.16" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="144.78" y1="2.54" x2="147.32" y2="5.08" width="0.1524" layer="91"/>
<wire x1="147.32" y1="5.08" x2="149.86" y2="5.08" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="P$2"/>
<wire x1="149.86" y1="5.08" x2="152.4" y2="5.08" width="0.1524" layer="91"/>
<wire x1="152.4" y1="5.08" x2="154.94" y2="2.54" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="P$2"/>
<wire x1="149.86" y1="5.08" x2="149.86" y2="2.54" width="0.1524" layer="91"/>
<junction x="149.86" y="5.08"/>
<wire x1="149.86" y1="5.08" x2="149.86" y2="10.16" width="0.1524" layer="91"/>
<wire x1="129.54" y1="10.16" x2="149.86" y2="10.16" width="0.1524" layer="91"/>
<junction x="129.54" y="10.16"/>
<wire x1="149.86" y1="10.16" x2="152.4" y2="12.7" width="0.1524" layer="91"/>
<junction x="149.86" y="10.16"/>
<label x="152.4" y="12.7" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="129.54" y1="-43.18" x2="127" y2="-43.18" width="0.1524" layer="91"/>
<label x="124.46" y="-43.18" size="1.27" layer="95"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="P$1"/>
<wire x1="124.46" y1="-5.08" x2="127" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="127" y1="-7.62" x2="129.54" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="P$1"/>
<wire x1="129.54" y1="-7.62" x2="129.54" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="129.54" y1="-7.62" x2="132.08" y2="-7.62" width="0.1524" layer="91"/>
<junction x="129.54" y="-7.62"/>
<pinref part="R9" gate="G$1" pin="P$1"/>
<wire x1="132.08" y1="-7.62" x2="134.62" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="Q3" gate="G$1" pin="D"/>
<wire x1="129.54" y1="-7.62" x2="129.54" y2="-10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$1"/>
<wire x1="144.78" y1="-5.08" x2="147.32" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-7.62" x2="149.86" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="Q5" gate="G$1" pin="D"/>
<wire x1="149.86" y1="-7.62" x2="149.86" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<wire x1="149.86" y1="-5.08" x2="149.86" y2="-7.62" width="0.1524" layer="91"/>
<junction x="149.86" y="-7.62"/>
<pinref part="R10" gate="G$1" pin="P$1"/>
<wire x1="154.94" y1="-5.08" x2="152.4" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="152.4" y1="-7.62" x2="149.86" y2="-7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HEAT_N" class="0">
<segment>
<pinref part="Q6" gate="G$1" pin="D"/>
<wire x1="170.18" y1="-10.16" x2="170.18" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="170.18" y1="-5.08" x2="172.72" y2="-2.54" width="0.1524" layer="91"/>
<label x="172.72" y="-2.54" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="2"/>
<wire x1="129.54" y1="-63.5" x2="127" y2="-63.5" width="0.1524" layer="91"/>
<label x="124.46" y="-63.5" size="1.27" layer="95"/>
</segment>
</net>
<net name="HC" class="0">
<segment>
<pinref part="Q6" gate="G$1" pin="G"/>
<wire x1="162.56" y1="-20.32" x2="160.02" y2="-17.78" width="0.1524" layer="91"/>
<label x="160.02" y="-17.78" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="R14" gate="G$1" pin="P$2"/>
<junction x="162.56" y="-20.32"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="10"/>
<wire x1="81.28" y1="-55.88" x2="86.36" y2="-55.88" width="0.1524" layer="91"/>
<label x="83.82" y="-55.88" size="1.27" layer="95"/>
</segment>
</net>
<net name="FC_C" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="G"/>
<wire x1="142.24" y1="-20.32" x2="139.7" y2="-17.78" width="0.1524" layer="91"/>
<label x="139.7" y="-17.78" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="R13" gate="G$1" pin="P$2"/>
<junction x="142.24" y="-20.32"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="8"/>
<wire x1="81.28" y1="-53.34" x2="86.36" y2="-53.34" width="0.1524" layer="91"/>
<label x="83.82" y="-53.34" size="1.27" layer="95"/>
</segment>
</net>
<net name="FC_B" class="0">
<segment>
<pinref part="Q3" gate="G$1" pin="G"/>
<wire x1="121.92" y1="-20.32" x2="119.38" y2="-17.78" width="0.1524" layer="91"/>
<label x="119.38" y="-17.78" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="R12" gate="G$1" pin="P$2"/>
<junction x="121.92" y="-20.32"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="81.28" y1="-50.8" x2="86.36" y2="-50.8" width="0.1524" layer="91"/>
<label x="83.82" y="-50.8" size="1.27" layer="95"/>
</segment>
</net>
<net name="FC_A" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="G"/>
<wire x1="101.6" y1="-20.32" x2="99.06" y2="-17.78" width="0.1524" layer="91"/>
<label x="99.06" y="-17.78" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="R11" gate="G$1" pin="P$2"/>
<junction x="101.6" y="-20.32"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="81.28" y1="-48.26" x2="86.36" y2="-48.26" width="0.1524" layer="91"/>
<label x="83.82" y="-48.26" size="1.27" layer="95"/>
</segment>
</net>
<net name="UART_MISO" class="0">
<segment>
<pinref part="BLE1" gate="G$1" pin="UART_TX"/>
<wire x1="-12.7" y1="0" x2="-15.24" y2="0" width="0.1524" layer="91"/>
<label x="-15.24" y="0" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="58.42" y1="-48.26" x2="53.34" y2="-48.26" width="0.1524" layer="91"/>
<label x="53.34" y="-48.26" size="1.27" layer="95"/>
</segment>
</net>
<net name="UART_MOSI" class="0">
<segment>
<pinref part="BLE1" gate="G$1" pin="UART_RX"/>
<wire x1="-12.7" y1="-2.54" x2="-15.24" y2="-2.54" width="0.1524" layer="91"/>
<label x="-15.24" y="-2.54" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="5"/>
<wire x1="58.42" y1="-50.8" x2="53.34" y2="-50.8" width="0.1524" layer="91"/>
<label x="53.34" y="-50.8" size="1.27" layer="95"/>
</segment>
</net>
<net name="SYSKEY" class="0">
<segment>
<pinref part="BLE1" gate="G$1" pin="PIO0"/>
<wire x1="25.4" y1="-27.94" x2="27.94" y2="-27.94" width="0.1524" layer="91"/>
<label x="27.94" y="-27.94" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="9"/>
<wire x1="58.42" y1="-55.88" x2="53.34" y2="-55.88" width="0.1524" layer="91"/>
<label x="53.34" y="-55.88" size="1.27" layer="95"/>
</segment>
</net>
<net name="RESETB" class="0">
<segment>
<pinref part="BLE1" gate="G$1" pin="RESETB"/>
<wire x1="-12.7" y1="-25.4" x2="-15.24" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-25.4" x2="-15.24" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-22.86" x2="-17.78" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="-20.32" x2="-20.32" y2="-20.32" width="0.1524" layer="91"/>
<label x="-22.86" y="-20.32" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="R15" gate="G$1" pin="P$2"/>
<junction x="-20.32" y="-20.32"/>
<wire x1="-20.32" y1="-20.32" x2="-22.86" y2="-20.32" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="7"/>
<wire x1="58.42" y1="-53.34" x2="53.34" y2="-53.34" width="0.1524" layer="91"/>
<label x="53.34" y="-53.34" size="1.27" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="MOSI"/>
<wire x1="129.54" y1="48.26" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<label x="132.08" y="48.26" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="12"/>
<wire x1="81.28" y1="-58.42" x2="86.36" y2="-58.42" width="0.1524" layer="91"/>
<label x="83.82" y="-58.42" size="1.27" layer="95"/>
</segment>
</net>
<net name="POT_CS" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!CS!"/>
<wire x1="129.54" y1="43.18" x2="132.08" y2="43.18" width="0.1524" layer="91"/>
<label x="132.08" y="43.18" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="14"/>
<wire x1="81.28" y1="-60.96" x2="86.36" y2="-60.96" width="0.1524" layer="91"/>
<label x="83.82" y="-60.96" size="1.27" layer="95"/>
</segment>
</net>
<net name="CLK" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="CLK"/>
<wire x1="129.54" y1="40.64" x2="132.08" y2="40.64" width="0.1524" layer="91"/>
<label x="132.08" y="40.64" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="13"/>
<wire x1="58.42" y1="-60.96" x2="53.34" y2="-60.96" width="0.1524" layer="91"/>
<label x="53.34" y="-60.96" size="1.27" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
