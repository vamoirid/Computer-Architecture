# Energy-Delay-Area Product Optimization (gem5 + McPAT)

## 1. Familiarization with McPAT  

McPAT (**M**ulti**c**ore **P**ower, **A**rea, and **T**iming) is an integrated power, area, and timing modeling framework for multithreaded, multicore, and manycore architectures. It can model different architectures in order to estimate their power, area and timing for different types of VLSI technologies which vary from 90nm to 22nm.

### 1.1 Dynamic Power and Leakage

In the generated results of the McPAT we can see some variables about **Power** and **Leakage**. We are going to examine them in order to understand what these variables stand for.

* **Peak Power**: It is the total power that the CPU can dissipate during extreme conditions. The total power is the sum of 3 different sources.  
<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{150}&space;P_{total}=P_{dyn}&plus;P_{sc}&plus;P_{leak}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dpi{150}&space;P_{total}=P_{dyn}&plus;P_{sc}&plus;P_{leak}" title="P_{total}=P_{dyn}+P_{sc}+P_{leak}" /></a>
* **Dynamic Power**: It is the total power that is required in order to drive the transistors inside the CPU either HIGH or LOW. We can think the input of a transistor as a capacitance that it needs charging and discharging. The power that we need to do that during the operation of the CPU is called _Dynamic Power_ and it is proportional to that Capacitance, the squared Voltage and the Switching Frequency. The equation that describes the Dynamic Power is:
<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{150}&space;P_{dyn}&space;=&space;a*C*V_{dd}*\Delta&space;V*f_{clk}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dpi{150}&space;P_{dyn}&space;=&space;a*C*V_{dd}*\Delta&space;V*f_{clk}" title="P_{dyn} = a*C*V_{dd}*\Delta V*f_{clk}" /></a>  
where:
   * <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;C" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;C" title="C" /></a> is the total load capacitance.
   * <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;V_{dd}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;V_{dd}" title="V_{dd}" /></a> is the Supply Voltage of the Processor.
   * <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;\Delta&space;V" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;\Delta&space;V" title="\Delta V" /></a> is the voltage swing during switching.
   * <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;f_{clk}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;f_{clk}" title="f_{clk}" /></a> is the CPU Clock Frequency.
   * <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;\alpha" title="\alpha" /></a> is an activity factor which indicates the fraction of total circuit capacitance being charged during a clock cycle.  
* **Short Circuit Power**: It is the power that flows through 2 or more transistors when they are a little slower with respect to each other and conduct simultaneously for an incredibly small amount of time. Even though it is not a variable in the generated info of McPAT, _Short Circuit Power_ is calculated and added to the total _Dynamic Power_ because in fact, when a transistor switches it consumes both _Dynamic_ and _Short Circuit_ Power.
* **Leakage Power**: This is the _Static_ power that is consumed by the processors. It is consumed either the Processor is running a program or it just stalls. It is caused because of the fact that transistors have some imperfections in their body which let current to flow through them (either Gate or Drain-Source or Substrate). The different leakage currents are:
   1. _Subthreshold Current_, which is the current that flows through Drain-Source when a transistor is supposed to be "OFF".
   2. _Gate Leakage Current_, which is the current that flows through Gate-Substrate due to the oxide which makes it act as a dielectric.
   3. _Diode Reverse Bias Current_, which flows through Drain-Substrate or Source-Substrate due to the fact that the opposite charges.
   4. _Gate induced Current_, which flows through Gate-Drain due to construction restrictions.
   
The first two are a lot more devastating than the latter ones. McPAT generates results for the first two for this reason but it includes equations including the latter ones also.
