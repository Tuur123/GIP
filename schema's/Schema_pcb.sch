<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.1.0">
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
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="con-samtec">
<description>&lt;b&gt;Samtec Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TSW-107-02-S-S">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-9.019" y1="1.155" x2="9.019" y2="1.155" width="0.2032" layer="21"/>
<wire x1="9.019" y1="1.155" x2="9.019" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="9.019" y1="-1.155" x2="-9.019" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="-9.019" y1="-1.155" x2="-9.019" y2="1.155" width="0.2032" layer="21"/>
<pad name="1" x="7.62" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="0" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="-2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="6" x="-5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="7" x="-7.62" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="7.362" y="-2.498" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<text x="-9.525" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="10.795" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-7.97" y1="-0.35" x2="-7.27" y2="0.35" layer="51"/>
<rectangle x1="-5.43" y1="-0.35" x2="-4.73" y2="0.35" layer="51"/>
<rectangle x1="-2.89" y1="-0.35" x2="-2.19" y2="0.35" layer="51"/>
<rectangle x1="-0.35" y1="-0.35" x2="0.35" y2="0.35" layer="51"/>
<rectangle x1="2.19" y1="-0.35" x2="2.89" y2="0.35" layer="51"/>
<rectangle x1="4.73" y1="-0.35" x2="5.43" y2="0.35" layer="51"/>
<rectangle x1="7.27" y1="-0.35" x2="7.97" y2="0.35" layer="51"/>
</package>
<package name="TSW-107-02-S-S-RA">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-9.019" y1="-2.046" x2="9.019" y2="-2.046" width="0.2032" layer="21"/>
<wire x1="9.019" y1="-2.046" x2="9.019" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="9.019" y1="-0.106" x2="-9.019" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="-9.019" y1="-0.106" x2="-9.019" y2="-2.046" width="0.2032" layer="21"/>
<pad name="1" x="7.62" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="0" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="-2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="6" x="-5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="7" x="-7.62" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="-9.525" y="-7.62" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="10.795" y="-7.62" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="8.902" y="1.152" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<rectangle x1="-7.874" y1="0" x2="-7.366" y2="1.778" layer="51"/>
<rectangle x1="-5.334" y1="0" x2="-4.826" y2="1.778" layer="51"/>
<rectangle x1="-2.794" y1="0" x2="-2.286" y2="1.778" layer="51"/>
<rectangle x1="-0.254" y1="0" x2="0.254" y2="1.778" layer="51"/>
<rectangle x1="2.286" y1="0" x2="2.794" y2="1.778" layer="51"/>
<rectangle x1="4.826" y1="0" x2="5.334" y2="1.778" layer="51"/>
<rectangle x1="7.366" y1="0" x2="7.874" y2="1.778" layer="51"/>
<rectangle x1="-7.874" y1="-7.89" x2="-7.366" y2="-2.04" layer="21"/>
<rectangle x1="-5.334" y1="-7.89" x2="-4.826" y2="-2.04" layer="21"/>
<rectangle x1="-2.794" y1="-7.89" x2="-2.286" y2="-2.04" layer="21"/>
<rectangle x1="-0.254" y1="-7.89" x2="0.254" y2="-2.04" layer="21"/>
<rectangle x1="2.286" y1="-7.89" x2="2.794" y2="-2.04" layer="21"/>
<rectangle x1="4.826" y1="-7.89" x2="5.334" y2="-2.04" layer="21"/>
<rectangle x1="7.366" y1="-7.89" x2="7.874" y2="-2.04" layer="21"/>
</package>
<package name="TSW-105-02-S-S">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-6.479" y1="1.155" x2="6.479" y2="1.155" width="0.2032" layer="21"/>
<wire x1="6.479" y1="1.155" x2="6.479" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="6.479" y1="-1.155" x2="-6.479" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="-6.479" y1="-1.155" x2="-6.479" y2="1.155" width="0.2032" layer="21"/>
<pad name="1" x="5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="0" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="-2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="-5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="4.822" y="-2.498" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<text x="-6.985" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="8.255" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.43" y1="-0.35" x2="-4.73" y2="0.35" layer="51"/>
<rectangle x1="-2.89" y1="-0.35" x2="-2.19" y2="0.35" layer="51"/>
<rectangle x1="-0.35" y1="-0.35" x2="0.35" y2="0.35" layer="51"/>
<rectangle x1="2.19" y1="-0.35" x2="2.89" y2="0.35" layer="51"/>
<rectangle x1="4.73" y1="-0.35" x2="5.43" y2="0.35" layer="51"/>
</package>
<package name="TSW-105-02-S-S-RA">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-6.479" y1="-2.046" x2="6.479" y2="-2.046" width="0.2032" layer="21"/>
<wire x1="6.479" y1="-2.046" x2="6.479" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="6.479" y1="-0.106" x2="-6.479" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="-6.479" y1="-0.106" x2="-6.479" y2="-2.046" width="0.2032" layer="21"/>
<pad name="1" x="5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="0" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="-2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="-5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="-6.985" y="-7.62" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="8.255" y="-7.62" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="6.362" y="1.152" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<rectangle x1="-5.334" y1="0" x2="-4.826" y2="1.778" layer="51"/>
<rectangle x1="-2.794" y1="0" x2="-2.286" y2="1.778" layer="51"/>
<rectangle x1="-0.254" y1="0" x2="0.254" y2="1.778" layer="51"/>
<rectangle x1="2.286" y1="0" x2="2.794" y2="1.778" layer="51"/>
<rectangle x1="4.826" y1="0" x2="5.334" y2="1.778" layer="51"/>
<rectangle x1="-5.334" y1="-7.89" x2="-4.826" y2="-2.04" layer="21"/>
<rectangle x1="-2.794" y1="-7.89" x2="-2.286" y2="-2.04" layer="21"/>
<rectangle x1="-0.254" y1="-7.89" x2="0.254" y2="-2.04" layer="21"/>
<rectangle x1="2.286" y1="-7.89" x2="2.794" y2="-2.04" layer="21"/>
<rectangle x1="4.826" y1="-7.89" x2="5.334" y2="-2.04" layer="21"/>
</package>
<package name="TSW-103-02-S-S">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-3.939" y1="1.155" x2="3.939" y2="1.155" width="0.2032" layer="21"/>
<wire x1="3.939" y1="1.155" x2="3.939" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="3.939" y1="-1.155" x2="-3.939" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="-3.939" y1="-1.155" x2="-3.939" y2="1.155" width="0.2032" layer="21"/>
<pad name="1" x="2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="0" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="-2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="2.282" y="-2.498" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<text x="-4.445" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.715" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.89" y1="-0.35" x2="-2.19" y2="0.35" layer="51"/>
<rectangle x1="-0.35" y1="-0.35" x2="0.35" y2="0.35" layer="51"/>
<rectangle x1="2.19" y1="-0.35" x2="2.89" y2="0.35" layer="51"/>
</package>
<package name="TSW-103-02-S-S-RA">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-3.939" y1="-2.046" x2="3.939" y2="-2.046" width="0.2032" layer="21"/>
<wire x1="3.939" y1="-2.046" x2="3.939" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="3.939" y1="-0.106" x2="-3.939" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="-3.939" y1="-0.106" x2="-3.939" y2="-2.046" width="0.2032" layer="21"/>
<pad name="1" x="2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="0" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="-2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="-4.445" y="-7.62" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.715" y="-7.62" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="3.822" y="1.152" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<rectangle x1="-2.794" y1="0" x2="-2.286" y2="1.778" layer="51"/>
<rectangle x1="-0.254" y1="0" x2="0.254" y2="1.778" layer="51"/>
<rectangle x1="2.286" y1="0" x2="2.794" y2="1.778" layer="51"/>
<rectangle x1="-2.794" y1="-7.89" x2="-2.286" y2="-2.04" layer="21"/>
<rectangle x1="-0.254" y1="-7.89" x2="0.254" y2="-2.04" layer="21"/>
<rectangle x1="2.286" y1="-7.89" x2="2.794" y2="-2.04" layer="21"/>
</package>
<package name="TSW-109-02-S-S">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-11.559" y1="1.155" x2="11.559" y2="1.155" width="0.2032" layer="21"/>
<wire x1="11.559" y1="1.155" x2="11.559" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="11.559" y1="-1.155" x2="-11.559" y2="-1.155" width="0.2032" layer="21"/>
<wire x1="-11.559" y1="-1.155" x2="-11.559" y2="1.155" width="0.2032" layer="21"/>
<pad name="1" x="10.16" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="7.62" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="0" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="6" x="-2.54" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="7" x="-5.08" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="8" x="-7.62" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="9" x="-10.16" y="0" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="9.902" y="-2.498" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<text x="-12.065" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="13.335" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-10.51" y1="-0.35" x2="-9.81" y2="0.35" layer="51"/>
<rectangle x1="-7.97" y1="-0.35" x2="-7.27" y2="0.35" layer="51"/>
<rectangle x1="-5.43" y1="-0.35" x2="-4.73" y2="0.35" layer="51"/>
<rectangle x1="-2.89" y1="-0.35" x2="-2.19" y2="0.35" layer="51"/>
<rectangle x1="-0.35" y1="-0.35" x2="0.35" y2="0.35" layer="51"/>
<rectangle x1="2.19" y1="-0.35" x2="2.89" y2="0.35" layer="51"/>
<rectangle x1="4.73" y1="-0.35" x2="5.43" y2="0.35" layer="51"/>
<rectangle x1="7.27" y1="-0.35" x2="7.97" y2="0.35" layer="51"/>
<rectangle x1="9.81" y1="-0.35" x2="10.51" y2="0.35" layer="51"/>
</package>
<package name="TSW-109-02-S-S-RA">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<wire x1="-11.559" y1="-2.046" x2="11.559" y2="-2.046" width="0.2032" layer="21"/>
<wire x1="11.559" y1="-2.046" x2="11.559" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="11.559" y1="-0.106" x2="-11.559" y2="-0.106" width="0.2032" layer="21"/>
<wire x1="-11.559" y1="-0.106" x2="-11.559" y2="-2.046" width="0.2032" layer="21"/>
<pad name="1" x="10.16" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="2" x="7.62" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="3" x="5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="4" x="2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="5" x="0" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="6" x="-2.54" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="7" x="-5.08" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="8" x="-7.62" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<pad name="9" x="-10.16" y="1.524" drill="1" diameter="1.5" shape="octagon" rot="R180"/>
<text x="-12.065" y="-7.62" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="13.335" y="-7.62" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="11.442" y="1.152" size="1.1" layer="21" font="vector" rot="SR0">1</text>
<rectangle x1="-10.414" y1="0" x2="-9.906" y2="1.778" layer="51"/>
<rectangle x1="-7.874" y1="0" x2="-7.366" y2="1.778" layer="51"/>
<rectangle x1="-5.334" y1="0" x2="-4.826" y2="1.778" layer="51"/>
<rectangle x1="-2.794" y1="0" x2="-2.286" y2="1.778" layer="51"/>
<rectangle x1="-0.254" y1="0" x2="0.254" y2="1.778" layer="51"/>
<rectangle x1="2.286" y1="0" x2="2.794" y2="1.778" layer="51"/>
<rectangle x1="4.826" y1="0" x2="5.334" y2="1.778" layer="51"/>
<rectangle x1="7.366" y1="0" x2="7.874" y2="1.778" layer="51"/>
<rectangle x1="9.906" y1="0" x2="10.414" y2="1.778" layer="51"/>
<rectangle x1="-10.414" y1="-7.89" x2="-9.906" y2="-2.04" layer="21"/>
<rectangle x1="-7.874" y1="-7.89" x2="-7.366" y2="-2.04" layer="21"/>
<rectangle x1="-5.334" y1="-7.89" x2="-4.826" y2="-2.04" layer="21"/>
<rectangle x1="-2.794" y1="-7.89" x2="-2.286" y2="-2.04" layer="21"/>
<rectangle x1="-0.254" y1="-7.89" x2="0.254" y2="-2.04" layer="21"/>
<rectangle x1="2.286" y1="-7.89" x2="2.794" y2="-2.04" layer="21"/>
<rectangle x1="4.826" y1="-7.89" x2="5.334" y2="-2.04" layer="21"/>
<rectangle x1="7.366" y1="-7.89" x2="7.874" y2="-2.04" layer="21"/>
<rectangle x1="9.906" y1="-7.89" x2="10.414" y2="-2.04" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="MPINV">
<text x="-1.27" y="1.27" size="1.778" layer="96">&gt;VALUE</text>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<rectangle x1="0" y1="-0.254" x2="1.778" y2="0.254" layer="94"/>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="MPIN">
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<rectangle x1="0" y1="-0.254" x2="1.778" y2="0.254" layer="94"/>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TSW-107-02-S-S" prefix="X">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<gates>
<gate name="-1" symbol="MPINV" x="-1.27" y="7.62" addlevel="always"/>
<gate name="-2" symbol="MPIN" x="-1.27" y="5.08" addlevel="always"/>
<gate name="-3" symbol="MPIN" x="-1.27" y="2.54" addlevel="always"/>
<gate name="-4" symbol="MPIN" x="-1.27" y="0" addlevel="always"/>
<gate name="-5" symbol="MPIN" x="-1.27" y="-2.54" addlevel="always"/>
<gate name="-6" symbol="MPIN" x="-1.27" y="-5.08" addlevel="always"/>
<gate name="-7" symbol="MPIN" x="-1.27" y="-7.62" addlevel="always"/>
</gates>
<devices>
<device name="" package="TSW-107-02-S-S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-RA" package="TSW-107-02-S-S-RA">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TSW-105-02-S-S" prefix="X">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<gates>
<gate name="-1" symbol="MPINV" x="-1.27" y="5.08" addlevel="always"/>
<gate name="-2" symbol="MPIN" x="-1.27" y="2.54" addlevel="always"/>
<gate name="-3" symbol="MPIN" x="-1.27" y="0" addlevel="always"/>
<gate name="-4" symbol="MPIN" x="-1.27" y="-2.54" addlevel="always"/>
<gate name="-5" symbol="MPIN" x="-1.27" y="-5.08" addlevel="always"/>
</gates>
<devices>
<device name="" package="TSW-105-02-S-S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-RA" package="TSW-105-02-S-S-RA">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TSW-103-02-S-S" prefix="X">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<gates>
<gate name="-1" symbol="MPINV" x="-1.27" y="2.54" addlevel="always"/>
<gate name="-2" symbol="MPIN" x="-1.27" y="0" addlevel="always"/>
<gate name="-3" symbol="MPIN" x="-1.27" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="TSW-103-02-S-S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-RA" package="TSW-103-02-S-S-RA">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TSW-109-02-S-S" prefix="X">
<description>&lt;b&gt;THROUGH-HOLE .025" SQ POST HEADER&lt;/b&gt;&lt;p&gt;
Source: Samtec TSW.pdf</description>
<gates>
<gate name="-1" symbol="MPINV" x="-1.27" y="10.16" addlevel="always"/>
<gate name="-2" symbol="MPIN" x="-1.27" y="7.62" addlevel="always"/>
<gate name="-3" symbol="MPIN" x="-1.27" y="5.08" addlevel="always"/>
<gate name="-4" symbol="MPIN" x="-1.27" y="2.54" addlevel="always"/>
<gate name="-5" symbol="MPIN" x="-1.27" y="0" addlevel="always"/>
<gate name="-6" symbol="MPIN" x="-1.27" y="-2.54" addlevel="always"/>
<gate name="-7" symbol="MPIN" x="-1.27" y="-5.08" addlevel="always"/>
<gate name="-8" symbol="MPIN" x="-1.27" y="-7.62" addlevel="always"/>
<gate name="-9" symbol="MPIN" x="-1.27" y="-10.16" addlevel="always"/>
</gates>
<devices>
<device name="" package="TSW-109-02-S-S">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
<connect gate="-8" pin="1" pad="8"/>
<connect gate="-9" pin="1" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-RA" package="TSW-109-02-S-S-RA">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
<connect gate="-8" pin="1" pad="8"/>
<connect gate="-9" pin="1" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
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
<part name="CCS811" library="con-samtec" deviceset="TSW-107-02-S-S" device=""/>
<part name="DHT" library="con-samtec" deviceset="TSW-103-02-S-S" device=""/>
<part name="BH1750" library="con-samtec" deviceset="TSW-105-02-S-S" device=""/>
<part name="GPS" library="con-samtec" deviceset="TSW-105-02-S-S" device=""/>
<part name="SIM900" library="con-samtec" deviceset="TSW-103-02-S-S" device=""/>
<part name="UNO" library="con-samtec" deviceset="TSW-109-02-S-S" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="CCS811" gate="-1" x="66.04" y="80.01" rot="R90"/>
<instance part="CCS811" gate="-2" x="68.58" y="80.01" rot="R90"/>
<instance part="CCS811" gate="-3" x="71.12" y="80.01" rot="R90"/>
<instance part="CCS811" gate="-4" x="73.66" y="80.01" rot="R90"/>
<instance part="CCS811" gate="-5" x="76.2" y="80.01" rot="R90"/>
<instance part="CCS811" gate="-6" x="78.74" y="80.01" rot="R90"/>
<instance part="DHT" gate="-1" x="88.9" y="80.01" rot="R90"/>
<instance part="DHT" gate="-2" x="91.44" y="80.01" rot="R90"/>
<instance part="DHT" gate="-3" x="93.98" y="80.01" rot="R90"/>
<instance part="BH1750" gate="-1" x="49.53" y="55.88" rot="R180"/>
<instance part="BH1750" gate="-2" x="49.53" y="58.42" rot="R180"/>
<instance part="BH1750" gate="-3" x="49.53" y="60.96" rot="R180"/>
<instance part="BH1750" gate="-4" x="49.53" y="63.5" rot="R180"/>
<instance part="BH1750" gate="-5" x="49.53" y="66.04" rot="R180"/>
<instance part="GPS" gate="-1" x="49.53" y="40.64" rot="R180"/>
<instance part="GPS" gate="-2" x="49.53" y="43.18" rot="R180"/>
<instance part="GPS" gate="-3" x="49.53" y="45.72" rot="R180"/>
<instance part="GPS" gate="-4" x="49.53" y="48.26" rot="R180"/>
<instance part="GPS" gate="-5" x="49.53" y="50.8" rot="R180"/>
<instance part="SIM900" gate="-1" x="49.53" y="30.48" rot="R180"/>
<instance part="SIM900" gate="-2" x="49.53" y="33.02" rot="R180"/>
<instance part="SIM900" gate="-3" x="49.53" y="35.56" rot="R180"/>
<instance part="UNO" gate="-1" x="113.03" y="63.5"/>
<instance part="UNO" gate="-2" x="113.03" y="60.96"/>
<instance part="UNO" gate="-3" x="113.03" y="58.42"/>
<instance part="UNO" gate="-4" x="113.03" y="55.88"/>
<instance part="UNO" gate="-5" x="113.03" y="53.34"/>
<instance part="UNO" gate="-6" x="113.03" y="50.8"/>
<instance part="UNO" gate="-7" x="113.03" y="48.26"/>
<instance part="UNO" gate="-8" x="113.03" y="45.72"/>
<instance part="UNO" gate="-9" x="113.03" y="43.18"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="50.8" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
<wire x1="50.8" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<wire x1="93.98" y1="35.56" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
<wire x1="93.98" y1="43.18" x2="93.98" y2="63.5" width="0.1524" layer="91"/>
<wire x1="110.49" y1="63.5" x2="111.76" y2="63.5" width="0.1524" layer="91"/>
<pinref part="UNO" gate="-1" pin="1"/>
<label x="104.14" y="63.5" size="1.778" layer="95"/>
<wire x1="110.49" y1="63.5" x2="93.98" y2="63.5" width="0.1524" layer="91"/>
<wire x1="50.8" y1="63.5" x2="52.07" y2="63.5" width="0.1524" layer="91"/>
<pinref part="BH1750" gate="-4" pin="1"/>
<wire x1="52.07" y1="63.5" x2="58.42" y2="63.5" width="0.1524" layer="91"/>
<wire x1="58.42" y1="63.5" x2="93.98" y2="63.5" width="0.1524" layer="91"/>
<wire x1="50.8" y1="55.88" x2="52.07" y2="55.88" width="0.1524" layer="91"/>
<pinref part="BH1750" gate="-1" pin="1"/>
<wire x1="52.07" y1="55.88" x2="58.42" y2="55.88" width="0.1524" layer="91"/>
<wire x1="58.42" y1="55.88" x2="58.42" y2="63.5" width="0.1524" layer="91"/>
<junction x="58.42" y="63.5"/>
<junction x="93.98" y="43.18"/>
<junction x="93.98" y="63.5"/>
<label x="53.34" y="63.5" size="1.778" layer="95"/>
<label x="53.34" y="55.88" size="1.778" layer="95"/>
<label x="53.34" y="43.18" size="1.778" layer="95"/>
<label x="53.34" y="35.56" size="1.778" layer="95"/>
<wire x1="78.74" y1="78.74" x2="78.74" y2="76.2" width="0.1524" layer="91"/>
<wire x1="78.74" y1="76.2" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<wire x1="93.98" y1="76.2" x2="93.98" y2="78.74" width="0.1524" layer="91"/>
<wire x1="93.98" y1="63.5" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<junction x="93.98" y="76.2"/>
</segment>
</net>
<net name="RX" class="0">
<segment>
<wire x1="50.8" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<wire x1="96.52" y1="48.26" x2="96.52" y2="50.8" width="0.1524" layer="91"/>
<pinref part="UNO" gate="-6" pin="1"/>
<wire x1="110.49" y1="50.8" x2="111.76" y2="50.8" width="0.1524" layer="91"/>
<label x="104.14" y="50.8" size="1.778" layer="95"/>
<wire x1="96.52" y1="50.8" x2="110.49" y2="50.8" width="0.1524" layer="91"/>
<label x="53.34" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="50.8" y1="33.02" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<wire x1="101.6" y1="33.02" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<wire x1="101.6" y1="45.72" x2="110.49" y2="45.72" width="0.1524" layer="91"/>
<pinref part="UNO" gate="-8" pin="1"/>
<wire x1="110.49" y1="45.72" x2="111.76" y2="45.72" width="0.1524" layer="91"/>
<label x="104.14" y="45.72" size="1.778" layer="95"/>
<label x="53.34" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX" class="0">
<segment>
<wire x1="50.8" y1="30.48" x2="104.14" y2="30.48" width="0.1524" layer="91"/>
<wire x1="104.14" y1="30.48" x2="104.14" y2="43.18" width="0.1524" layer="91"/>
<wire x1="104.14" y1="43.18" x2="110.49" y2="43.18" width="0.1524" layer="91"/>
<pinref part="UNO" gate="-9" pin="1"/>
<wire x1="110.49" y1="43.18" x2="111.76" y2="43.18" width="0.1524" layer="91"/>
<label x="104.14" y="43.18" size="1.778" layer="95"/>
<label x="53.34" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="99.06" y1="45.72" x2="99.06" y2="48.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="45.72" x2="99.06" y2="45.72" width="0.1524" layer="91"/>
<wire x1="99.06" y1="48.26" x2="111.76" y2="48.26" width="0.1524" layer="91"/>
<label x="104.14" y="48.26" size="1.778" layer="95"/>
<label x="53.34" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="3.3V" class="0">
<segment>
<wire x1="110.49" y1="60.96" x2="111.76" y2="60.96" width="0.1524" layer="91"/>
<pinref part="UNO" gate="-2" pin="1"/>
<label x="104.14" y="60.96" size="1.778" layer="95"/>
<wire x1="91.44" y1="66.04" x2="91.44" y2="60.96" width="0.1524" layer="91"/>
<wire x1="91.44" y1="60.96" x2="110.49" y2="60.96" width="0.1524" layer="91"/>
<wire x1="50.8" y1="50.8" x2="91.44" y2="50.8" width="0.1524" layer="91"/>
<wire x1="91.44" y1="50.8" x2="91.44" y2="60.96" width="0.1524" layer="91"/>
<wire x1="52.07" y1="66.04" x2="50.8" y2="66.04" width="0.1524" layer="91"/>
<pinref part="BH1750" gate="-5" pin="1"/>
<wire x1="52.07" y1="66.04" x2="91.44" y2="66.04" width="0.1524" layer="91"/>
<junction x="91.44" y="60.96"/>
<label x="53.34" y="66.04" size="1.778" layer="95"/>
<label x="53.34" y="50.8" size="1.778" layer="95"/>
<wire x1="91.44" y1="66.04" x2="91.44" y2="78.74" width="0.1524" layer="91"/>
<junction x="91.44" y="66.04"/>
</segment>
</net>
<net name="SER" class="0">
<segment>
<pinref part="UNO" gate="-3" pin="1"/>
<wire x1="110.49" y1="58.42" x2="111.76" y2="58.42" width="0.1524" layer="91"/>
<label x="104.14" y="58.42" size="1.778" layer="95"/>
<wire x1="88.9" y1="58.42" x2="110.49" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="UNO" gate="-4" pin="1"/>
<wire x1="110.49" y1="55.88" x2="111.76" y2="55.88" width="0.1524" layer="91"/>
<label x="104.14" y="55.88" size="1.778" layer="95"/>
<wire x1="76.2" y1="58.42" x2="76.2" y2="55.88" width="0.1524" layer="91"/>
<wire x1="76.2" y1="55.88" x2="110.49" y2="55.88" width="0.1524" layer="91"/>
<wire x1="50.8" y1="58.42" x2="52.07" y2="58.42" width="0.1524" layer="91"/>
<pinref part="BH1750" gate="-2" pin="1"/>
<wire x1="52.07" y1="58.42" x2="76.2" y2="58.42" width="0.1524" layer="91"/>
<label x="53.34" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="UNO" gate="-5" pin="1"/>
<wire x1="110.49" y1="53.34" x2="111.76" y2="53.34" width="0.1524" layer="91"/>
<label x="104.14" y="53.34" size="1.778" layer="95"/>
<wire x1="73.66" y1="60.96" x2="73.66" y2="53.34" width="0.1524" layer="91"/>
<wire x1="73.66" y1="53.34" x2="110.49" y2="53.34" width="0.1524" layer="91"/>
<wire x1="50.8" y1="60.96" x2="52.07" y2="60.96" width="0.1524" layer="91"/>
<pinref part="BH1750" gate="-3" pin="1"/>
<wire x1="52.07" y1="60.96" x2="73.66" y2="60.96" width="0.1524" layer="91"/>
<label x="53.34" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
