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
   
The first two are a lot more dominanant than the latter ones. McPAT generates results for the first two for this reason but it includes equations including the latter ones also.

The power consumed due to the capacitive load of the switching transistors is analogous to the number of transistors that are switching. If we run a program that requires more transistors to be switched ON/OFF we would result in of course higher **Peak Dynamic**. The **Total Leakage** is analogous to the number of transistors that are **not** switching because as we said it is the static power of the Processor. So a program which would require a lot less transistors switching than another, would have a lot more transistors switched OFF becuase they would be unused.. This means that these transistors would let some leakage current pass through as it was mentioned before.  

Moreover, there is a variable in the generated info with the name **Runtime Dynamic**. This variable is in fact the total energy required by a program during processing divided by the total simulation time. So if we decided to run the same program 2 or more times consecutively, and we assume that every time the processor behaves exactly the same as the previous one, then we would see the following results:
   1. **Peak Dynamic** would be the **same** as running the program just once because the maximum number of transistors switching would remain the same during the different executions of the program.
   2. **Runtime Dynamic** would be the **same** as running the program just once because theoretically every time the Processor would do the same calculations with the same transistors so the energy needed would be the same and the execution time would also be the same.
   3. **Total Leakage** would be **different**, with its value being _n_ times higher where _n_ is the number of times that we run the program. 

### 1.2 Low Power vs High Power Processor and Energy Efficiency

In a situation that we had 2 Processors, one at **5W** and one at **40W**, and we needed to find a way in which the latter one could drain a battery slower than the first one, we would need to make it a lot more **Energy Efficient** than the first one. There are several ways in order to make a Processor more Energy Efficient. 
* **Static Power** or else **Leakage** in a CPU could be reduced mainly with the use of less leaky transistors. Less leaky transistors mean less _Leakage_ but also mean slower switching which could make the CPU slower. Another way that could be implemented is to reduce or even cut-off the power in the regions of the CPU that are not used in order to reduce the _Leakage_ in the OFF state.
* **Dynamic Power** can be manipulated with a lot more flexibility than the _Static Power_. 
   * First of all the voltage of the CPU could be scaled down in some sections of it or even more to the whole chip when the lower execution time is not need that much.
   * Moreover we could reduce the switching frequency of the majority of the transistors in order to reduce the short circuit current and the total current for switching the state of the transistors.  
   
The way to achieve these two is to create a more sophisticated **DVFS Hnadler** (**D**ynamic **V**oltage and **F**requency **S**caling) which could reduce frequency and voltage in way that would improve the energy efficiency of the Processor without affecting its performance.

Even though **McPAT** gives us all the appropriate information about power, it does not give us the _total simulation time_ which is necessary in order to calculate the performance of a given processor. This information could be found and used in a **gem5** + **McPat** collaboration.

### 1.3 Xeon vs ARM Cortex-A9 Energy Efficiency

McPAT has build in information on some commercial processors such as _Xeon Tulsa_ and _Cortex-A9 2GHz_. We are going to run simulations for these two processors in order to compare them in terms of Energy Efficiency. Because of the fact that we do not have the Total Runtimes of the programs executed on the Processors, we are going to assume completely arbitrary that Xeon is 40 times faster than the A9. For the commands we are going to use ```-print_level 1``` because it generates all the necessary information and we are going to save the results in a text file named after the name of the processor.

For Xeon we execute the command:
```bash 
./mcpat -infile ProcessorDescriptionFiles/Xeon.xml -print_level 1 > Xeon.txt
```

And for the Cortex-A9 at 2GHz we use:
```bash
./mcpat -infile ProcessorDescriptionFiles/ARM_A9_2GHz.xml -print_level 1 > ARM_A9_2GHz.txt
```

The results of the above simulations are shown in the table below:

|                                        | Xeon Tulsa   | ARM Cortex-A9 |
|:--------------------------------------:|:------------:|:-------------:|
| Technology                             | 65nm         | 40nm          |
| Clock Frequency                        | 3.4 GHz      | 2 GHz         |
| Area                                   | 410.507 mm^2 | 5.39698 mm^2  |
| Peak Power                             | 134.938 W    | 1.74189 W     |
| Total Leakage                          | 36.8319 W    | 0.108687 W    |
| Peak Dynamic                           | 98.1063 W    | 1.6332 W      |
| Subthreshold Leakage                   | 35.1632 W    | 0.0523094 W   |
| Subthreshold Leakage with power gating | 16.3977 W    | -             |
| Gate Leakage                           | 1.66871 W    | 0.0563774 W   |
| Runtime Dynamic                        | 72.9199 W    | 2.96053 W     |
| Total Simulation Time                  | t            | 40*t          |

With the above results we can calculate the total energy that each processor used in order to execute the program. The equation that we are going to use for the Energy calculation is:  

<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{150}&space;Energy&space;=&space;[Runtime\_Dynamic&space;&plus;&space;Total\_Leakage]&space;*&space;Simulation\_Time" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dpi{150}&space;Energy&space;=&space;[Runtime\_Dynamic&space;&plus;&space;Total\_Leakage]&space;*&space;Simulation\_Time" title="Energy = [Runtime\_Dynamic + Total\_Leakage] * Simulation\_Time" /></a>

For the Cortex-A9 the results are: <a href="https://www.codecogs.com/eqnedit.php?latex=\small&space;Energy&space;=&space;[2.96053&space;W&space;&plus;&space;0.108687W]*40t&space;sec&space;=&space;122.76868t&space;J" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\small&space;Energy&space;=&space;[2.96053&space;W&space;&plus;&space;0.108687W]*40t&space;sec&space;=&space;122.76868t&space;J" title="\small Energy = [2.96053 W + 0.108687W]*40t sec = 122.76868t J" /></a> 

While for the Xeon Tulsa the results are: <a href="https://www.codecogs.com/eqnedit.php?latex=\small&space;Energy&space;=&space;[72.9199&space;W&space;&plus;&space;36.8319W]*t&space;sec&space;=&space;109.7518t&space;J" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\small&space;Energy&space;=&space;[72.9199&space;W&space;&plus;&space;36.8319W]*t&space;sec&space;=&space;109.7518t&space;J" title="\small Energy = [72.9199 W + 36.8319W]*t sec = 109.7518t J" /></a>  

If we take into account the fact that after the execution of the program, the _Xeon Tulsa_ is not going to turn off, but is going to stall until the ARM finishes its execution, then we need to add to the _Subthreshold Leakage with Power Gating_ for **ALL** the transistors of the CPU for the _39*t_ seconds. The calculations show that the added energy is > 16.3977*39t which is extremely higher than the _122.76868t Joules_ of the ARM Cortex-A9.

## 2. gem5 + McPAT: Searching for EDAP Optimization

We are going to provide **McPAT** with the generated files of our previous **SPEC CPU2006** Benchmarks which we run in **gem5** in order to see how each _Cache Memory_ parameter affects the EDA Product.

### 2.1 Energy-Delay-Area calculations

We need to extract the values of these variables either in _gem5_ or _McPAT_ generated informations.

* **Energy**  _(units in Joules)_: Energy can be calculated by the equation <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;\dpi{100}&space;\small&space;[Runtime\_Dynamic&space;&plus;&space;Total\_Leakage]&space;*&space;Simulation\_Time" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;\dpi{100}&space;\small&space;[Runtime\_Dynamic&space;&plus;&space;Total\_Leakage]&space;*&space;Simulation\_Time" title="\small [Runtime\_Dynamic + Total\_Leakage] * Simulation\_Time" /></a>.
* **Delay** _(units in seconds)_: It is the _total simulation seconds_ given in stats.txt from _gem5_. 
* **Area** _(units in mm^2)_: It is given as an output of _McPAT_. 
