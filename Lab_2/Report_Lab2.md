## Report for Lab2

### 1. Run SPEC CPU2006 Benchmarks at gem5.

The 2nd Laboratory is about running various benchmarks in **gem5** for different systems, that vary in Cache Memory parameters. These benchmarks are a subset of **SPEC CPU2006** benchmark suite.

#### 1.1 Cache Memory parameters in generated files.

Every generated file from the simulation contains all the preconfigured parameters of the system and obviously the results of the simulation. In this assignement we need to find some general characteristics about Cache Memories inside the CPU and comment on them. The specific parameters that we need to look for are:

* L1 Instruction Cache size
* L1 Instruction Cache Associativity
* L1 Data Cache size
* L1 Data Cache Associativity
* L2 Cache size
* L2 Cache Associativity
* Cache Line size

What we need to do, is to search for the respective references of each parameter in order to find its value. For the sake of readability and organization we are going to search the _config.ini_ file of a simulation.

* **L1 Instruction Cache**  
If we search for the term _icache_ inside the _config.ini_ file we are going to find some of the information that we need about the Insruction Cache Memory. In _Line 789_: **[system.cpu.icache]**, we can very easily recognise that the variable _size = 32768_ states that the L1-Instruction Cache has a size of **32kB**. Moreover, the variable _assoc = 2_ states that the I-Cache has 2-way Set Associativity.

* **L1 Data Cache**  
Similarly, if we search for the term _dcache_ inside the _config.ini_ file we are going to find some of the information that we need about the Data Cache Memory. In _Line 155_: **[system.cpu.dcache]**, we can very easily recognise that the variable _size = 65536_ states that the L1-Data Cache has a size of **64kB**. Moreover, the variable _assoc = 2_ states that the I-Cache has a 2-way Set Associativity.

* **L2 Cache**  
The procedure in order to search for the _L2 Cache_ parameters is exactly the same. In _Line 994_: **[system.l2]**, we can very easily see that the _size = 2097152_ (which is equal to 2*2^20) and it means that L2-Cache has a size of **2MB**. Moreover, the variable _assoc = 8_ states that the L2-Cache has a 8-way Set Associativity.

* **Cache Line size**  
Last but not least, the size of the Cache Line can be found in the very first lines of the generated _config.ini_. In _Line 11_: **[system]** we can see that the variable _cache_line_size = 64_ clearly states that the size of the Cache Line is **64 Bytes**.

The above results are generated from the standar _spec cpu2006 bzip_ benchmarks. 
```bash
./build/ARM/gem5.opt -d spec_results/specbzip configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
```
#### 1.2 Total time, CPI & Cache Miss Rates for various benchmarks

A subset of the Spec CPU2006 benchmarks was used in order to see the performance of the simulated system. These are different benchmarks aiming on different aspects of the CPU capabilties. The list of commands that were used as it was proposed are:

* **401.bzip2** is a benchmark which makes the CPU compress and decompress different types of files such as images or raw binary files .   
```bash
./build/ARM/gem5.opt -d spec_results/specbzip configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
```
* **429.mcf**  is a benchmark which uses almost only integer logic for vehicle route scheduling in mass public transportation systems.  
```bash
./build/ARM/gem5.opt -d spec_results/specmcf configs/example/se.py --cpu- type=MinorCPU --caches --l2cache -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
```
* **456.hmmer** is a benchmark which makes the CPU search in a gene database using Hiden Markov Models.  
```bash
./build/ARM/gem5.opt -d spec_results/spechmmer configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000
```
* **458.sjeng** is a benchmark which uses tree-searches for Artificial Intelligence algorithms.
```bash
./build/ARM/gem5.opt -d spec_results/specsjeng configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
```
* **470.lbm** is a benchmark which uses only computational fluid dynamics calculations.  
```bash
./build/ARM/gem5.opt -d spec_results/speclibm configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
```

After running all of these benchmarks, there were some very interesting results that are shown in the following table:

|        | Simulation Seconds | Cycles per Instruction (CPI) | L2 Cache Miss Rate | L1 I-Cache Miss Rate | L1 D-Cache Miss Rate |
|:------:|:------------------:|:----------------------------:|:------------------:|:--------------------:|:--------------------:|
| bzip   | 0.083982           | 1.679650                     | 0.282163           | 0.000077             | 0.014798             |
| mcf    | 0.064955           | 1.299095                     | 0.055046           | 0.023612             | 0.002108             |
| hmmer  | 0.059396           | 1.187917                     | 0.077760           | 0.000221             | 0.001637             |
| sjeng  | 0.513528           | 10.270554                    | 0.999972           | 0.000020             | 0.121831             |
| libm   | 0.174671           | 3.493415                     | 0.999944           | 0.000094             | 0.060972             |

The results above show some very important information about the cache memory. The _sjeng_ and _libm_ benchmarks had the biggest elapsed simulation time and also the biggest CPI number. This happens because of the fact that the L2 Cache Miss Rate is over 99.99%. Every time that the CPU has a miss in the L2 Cache, there is a time penalty like the L1 Cache. Nevertheless, because of the fact that the L2 Cache is noticeably slower than L1 Cache, it is obvious that the miss-penalty for L2 Cache is a lot higher than this of L1 Cache. 

If we thing about the basic equation for the calculation of the CPI

<a href="https://www.codecogs.com/eqnedit.php?latex=CPI&space;=&space;1&space;&plus;&space;\frac{(L1.Instruction.total\_misses&space;&plus;&space;L1.Data.total\_misses)*L1.miss\_penalty&space;&plus;&space;L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?CPI&space;=&space;1&space;&plus;&space;\frac{(L1.Instruction.total\_misses&space;&plus;&space;L1.Data.total\_misses)*L1.miss\_penalty&space;&plus;&space;L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" title="CPI = 1 + \frac{(L1.Instruction.total\_misses + L1.Data.total\_misses)*L1.miss\_penalty + L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" /></a>

we can understand that it is not only the Miss Rate of the L2 Cache that can make the execution of the program a lot slower, but it is also the number of the overall accesses (read+write to the respective memory) in combination with the Miss Rate. In our case, in the generated files the **overall** L2 Cache acceses and misses were:

|        | L2 Cache Accesses | L2 Cache Misses | L1 I-Cache Accesses | L1 D-Cache Accesses |
|:------:|:-----------------:|:---------------:|:-------------------:|:-------------------:|
| bzip   | 712,341           | 200,996         | 9,663,457           | 52,077,014          |
| mcf    | 724,390           | 39,875          | 28,329,862          | 35,735,336          |
| hmmer  | 70,563            | 5,487           | 17,315,710          | 43,920,897          |
| sjeng  | 5,264,051         | 5,263,903       | 31,870,341          | 86,380,797          |
| libm   | 1,488,538         | 1,488,455       | 5,959,471           | 48,806,657          |

As we see, the total accesses in the L2-Cache were a lot more than every other simulation in _sjeng_ and _libm_. This is a result of the slightly higher L1 D-Cache Miss Rate in these 2 benchmarks (0.12 and 0.06 respectfully) with respect to the other 3 benchmarks.

#### 1.3 Differences between System Clock and CPU Clock

Inside the _stats.txt_ and _config.ini_ we can find 2 variables about the clock characteristics. The **system.clk_domain** and **system.cpu_clk_domain**. These 2 variables define the clock sources for different subsets of the system. The clocks that every subset uses can be found in the _config.ini_ file in the respective class of the object. In order to understand the usage of these 2 variables we run the exact same simulations as before, but this time we added the flag `--cpu-clock=1GHz` in order to change the default CPU frequency of 2GHz to 1GHz. If we take a closer look at the generated _config.dot.pdf_ we can have a first understanding of how the internals of the system are seperated.

![General Map Image](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/images/map.png)

In this image we can clearly understand that the Main Memory and L2 Cache are not part of the CPU. L2 Cache has the feature that communicates both with the CPU and the Main Memory meaning that in case there is a difference in _system.clk_domain_ and _system.cpu_clk_domain_ the L2 Cache must be able to communicate in different rates with the 2 subsets. The CPU parts are in the _system.cpu_clk_domain_ while the system parts are in the _system.clk_domain_. This means that in the 2nd round of simulations that the CPU clock was changed to 1GHz the clock domains would be like this:

* Main Memory Controller at _system.clk_domain_ = **2GHz**.
* Main Memory <-----> L2 Cache Memory side communication at _system.clk_domain_ = **2GHz**.
* L2 Cache CPU side <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.
* L1 I-Cache <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.
* L1 D-Cache <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.

The results of the previous benchmarks but with a 1GHz CPU clock are shown below:

|        | Simulation Seconds | Cycles per Instruction (CPI) | L2 Cache Miss Rate | L1 I-Cache Miss Rate | L1 D-Cache Miss Rate |
|:------:|:------------------:|:----------------------------:|:------------------:|:--------------------:|:--------------------:|
| bzip   | 0.161025           | 1.610247                     | 0.282157           | 0.000077             | 0.014675             |
| mcf    | 0.127942           | 1.279422                     | 0.055046           | 0.023627             | 0.002108             |
| hmmer  | 0.118530           | 1.185304                     | 0.077747           | 0.000221             | 0.001629             |
| sjeng  | 0.704056           | 7.040561                     | 0.999972           | 0.000020             | 0.121831             |
| libm   | 0.262327           | 2.623265                     | 0.999944           | 0.000094             | 0.060971             |
 
Comparing the 2 tables, one can understand some very crucial information on the working of the system. First of all, the Miss Rates of all memories are exactly the same because the Miss Rate has no direct relation with the CPU Clock. The interesting part though is in the Total _Simulation Seconds_ and _CPI_ of the respective benchmarks. What we need to take into consideration is that L1 I-Cache and L1 D-Cache run at the CPU clock speed which means that their speed in both hits and misses is dropped at half, resulting in a higher miss-penalty. However, L2 Cache communication with the Main Memory remains untouched from the CPU clock, so the miss-penalty is exactly the same with the previous simulations. The percentages of these changes are shown in the table below:

|        | Simulation Seconds Increase % | Cycles per Instruction (CPI) Decrease % |
|:------:|:-----------------------------:|:---------------------------------------:|
| bzip   | 91.73%                        | 4.13%                                   |
| mcf    | 96.97%                        | 1.51%                                   |
| hmmer  | 99.55%                        | 0.02%                                   |
| sjeng  | 37.10%                        | 31.45%                                  |
| libm   | 50.18%                        | 24.9%                                   |
