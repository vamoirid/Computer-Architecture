# Report for Lab2
## 1. Run SPEC CPU2006 Benchmarks at gem5.

The 2nd Laboratory is about running various benchmarks in **gem5** for different systems, that vary in Cache Memory parameters. These benchmarks are a subset of **SPEC CPU2006** benchmark suite.

### 1.1 Cache Memory parameters in generated files.

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
Similarly, if we search for the term _dcache_ inside the _config.ini_ file we are going to find some of the information that we need about the Data Cache Memory. In _Line 155_: **[system.cpu.dcache]**, we can very easily recognise that the variable _size = 65536_ states that the L1-Data Cache has a size of **64kB**. Moreover, the variable _assoc = 2_ states that the D-Cache has a 2-way Set Associativity.

* **L2 Cache**  
The procedure in order to search for the _L2 Cache_ parameters is exactly the same. In _Line 994_: **[system.l2]**, we can very easily see that the _size = 2097152_ (which is equal to 2*2^20) and it means that L2-Cache has a size of **2MB**. Moreover, the variable _assoc = 8_ states that the L2-Cache has a 8-way Set Associativity.

* **Cache Line size**  
Last but not least, the size of the Cache Line can be found in the very first lines of the generated _config.ini_. In _Line 11_: **[system]** we can see that the variable _cache_line_size = 64_ clearly states that the size of the Cache Line is **64 Bytes**.

|                      | Size | Associativity | 
|:--------------------:|:----:|:-------------:|
| L1 Instruction-Cache | 32kB | 2             |
| L1 Data-Cache        | 64kB | 2             |
| L2 Cache             | 2MB  | 8             |

**Cache Line**: 64 Bytes.

The above results are generated from the standar _spec cpu2006 bzip_ benchmarks. 
```bash
./build/ARM/gem5.opt -d spec_results/specbzip configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
```
### 1.2 Total time, CPI & Cache Miss Rates for various benchmarks

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
* **458.sjeng** is a benchmark which uses tree-searches for Artificial Intelligence & Machine Learning algorithms.
```bash
./build/ARM/gem5.opt -d spec_results/specsjeng configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
```
* **470.lbm** is a benchmark which uses only computational fluid dynamics (CFD) calculations.  
```bash
./build/ARM/gem5.opt -d spec_results/speclibm configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
```

After running all of these benchmarks, there were some very interesting results that are shown in the following graph and table:

<img src="https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/bargraph_final.png" />

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

### 1.3 Differences between System Clock and CPU Clock

Inside the _stats.txt_ and _config.ini_ we can find 2 variables about the clock characteristics. The **system.clk_domain** which by default is 1GHz and **system.cpu_clk_domain** which by default is 2GHz. These 2 variables define the clock sources for different subsets of the system. The clocks that every subset uses can be found in the _config.ini_ file in the respective class of the object. In order to understand the usage of these 2 variables we run the exact same simulations as before, but this time we added the flag `--cpu-clock=1GHz` in order to change the default CPU frequency of 2GHz to 1GHz. If we take a closer look at the generated _config.dot.pdf_ we can have a first understanding of how the internals of the system are seperated.

![General Map Image](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/images/map.png)

In this image we can clearly understand that the Main Memory and L2 Cache are not part of the CPU. L2 Cache has the feature that communicates both with the CPU and the Main Memory meaning that in case there is a difference in _system.clk_domain_ and _system.cpu_clk_domain_ the L2 Cache must be able to communicate in different rates with the 2 subsets. The CPU parts are in the _system.cpu_clk_domain_ while the system parts are in the _system.clk_domain_. This means that in the 2nd round of simulations that the CPU clock was changed to 1GHz the clock domains would be like this:

* Main Memory Controller at _system.clk_domain_ = **1GHz**.
* Main Memory <-----> L2 Cache Memory side communication at _system.clk_domain_ = **1GHz**.
* L2 Cache CPU side <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.
* L1 I-Cache <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.
* L1 D-Cache <-----> CPU communication at _system.cpu_clk_domain_ = **1GHz**.  

The addition of an extra CPU could have been helpful if we had our program parallel computed. Now that it has no parallelism there would be no difference in simulation seconds. Except for this, the new CPU will have the same characteristics as the first one regarding CPU clock, L1 I-Cache and L1 D-Cache.

The results of the previous benchmarks but with a 1GHz CPU clock are shown below:

|        | Simulation Seconds | Cycles per Instruction (CPI) | L2 Cache Miss Rate | L1 I-Cache Miss Rate | L1 D-Cache Miss Rate |
|:------:|:------------------:|:----------------------------:|:------------------:|:--------------------:|:--------------------:|
| bzip   | 0.161025           | 1.610247                     | 0.282157           | 0.000077             | 0.014675             |
| mcf    | 0.127942           | 1.279422                     | 0.055046           | 0.023627             | 0.002108             |
| hmmer  | 0.118530           | 1.185304                     | 0.077747           | 0.000221             | 0.001629             |
| sjeng  | 0.704056           | 7.040561                     | 0.999972           | 0.000020             | 0.121831             |
| libm   | 0.262327           | 2.623265                     | 0.999944           | 0.000094             | 0.060971             |
 
Comparing the 2 tables, one can understand some very crucial information on the working of the system. First of all, the Miss Rates of all memories are exactly the same because the Miss Rate has no direct relation with the CPU Clock. The interesting part though is in the Total _Simulation Seconds_ and _CPI_ of the respective benchmarks. What we need to take into consideration is that L1 I-Cache and L1 D-Cache run at the CPU clock speed which means that their speed in both hits and misses is dropped at half, resulting in a higher miss-penalty. However, L2 Cache communication with the Main Memory remains untouched from the CPU clock, so the miss-penalty is exactly the same with the previous simulations.  

The percentages of these changes are shown in the table below:

|        | Simulation Seconds Increase % | Cycles per Instruction (CPI) Decrease % |
|:------:|:-----------------------------:|:---------------------------------------:|
| bzip   | 91.73%                        | 4.13%                                   |
| mcf    | 96.97%                        | 1.51%                                   |
| hmmer  | 99.55%                        | 0.02%                                   |
| sjeng  | 37.10%                        | 31.45%                                  |
| libm   | 50.18%                        | 24.9%                                   |

The most interesting result is the fact that the _sjeng_ and _libm_ benchmarks had the "most different" results regarding the change in the CPU Clock. It is obvious that while the _bzip_, _mcf_ and _hmmer_ had almost 2-times higher Simulation Seconds, the _sjeng_ and _libm_ had a lot lower percentage. This is because of the fact that L1-Cache miss penalty is higher than before while the L2-Cache miss penalty remained unchanged. Moreover, the CPI had a tremendous decrease in _sjeng_ and _libm_ while there was a slight difference in the other 3.  

The final and most important result is that the L2-Cache Miss Rate has a tremendous influence in the programs' running time. Even though we doubled the speed of the CPU from 1GHz to 2GHz, the simulations that had a very high L2 Cache Miss Rate couldn't have the same increase in speed as the simulations with a lot lower L2-Cache Miss Rate which had an increase in speed of almost 2x.

## 2. Design Exploration - Performance Optimization

Now that we have run some basic benchmarks we need to find how we can achieve better performance by changing values in the respective Cache Memory parameters. This can be done by various flags in the bash command such as ```--l1i_size``` ```--l1i_assoc``` ```--l1d_size``` ```--l1d_assoc``` ```--l2_size``` ```--l2_assoc``` ```--cacheline_size```. The purpose of this is to understand not only how just one parameter affects the whole program, but how the total combination of all these parameters can achieve a serious improvement in performance. 

### 2.1 Performance Optimization with Memory Organization

Memory Organization is in fact the combination of all the above parameters. In order to change the default values we need to know firstly the upper limits for every parameter and secondly the most commonly used distinct values. The total size of memories has some limitations derived from psysical and economical reasons while associativity and cache line size is a little bit more abstract. In fact, if we search the various books and papers we can find some really important information about very common values also for these parameters.

1. Maximum combined L1 Instruction-Cache size and L1 Data-Cache size is 256kB.
2. Maximum L2 Cache size is 4MB. 
3. Most common n-set Associativities are 2,4,8,16
4. Most common Cache Line sizes are 32,64,128 Bytes.
5. Most common Cache size in discrete powers of 2 (16kB,32kB,...,MAX) which means that L1 I-Cache and L1 D-Cache are at 16kB,32kB,64kB,128kB and L2 Cache is respectively 4MB,2MB,1MB,512kB.

These are all the limitations and acceptable values that we can use in our simulations in order to improve the performance of the CPU in every benchmark. Now we need to look at where each benchmark is lagging and try to find ways to improve it.

#### 2.1.1 401.bzip2 Benchmark Optimization

|        | L2 Cache Miss Rate & Accesses | L1 I-Cache Miss Rate & Accesses | L1 D-Cache Miss Rate & Accesses |
|:------:|:-----------------------------:|:-------------------------------:|:-------------------------------:|
| bzip   | 0.282163 in 712,341           | 0.000077 in 9,663,457           | 0.014798 in 52,077,014          |

**CPI**: 1.679650

If we take a closer look at the results of the _bzip_ benchmark we can see that L1 I-Cache has a very low Miss Rate and also **5 times less** acceses compared to L1 D-Cache, which make us give a lot more attention to L1 D-Cache rather than to L1 I-Cache. Moreover, L1 D-Cache except for the high number in accesses has also a Miss Rate which is almost 1.5%. This amount of Miss Rate equals to more than 750,000 misses in L1 D-Cache which surely causes the CPU to slow down. Furthermore, L2 Cache has a Miss Rate of approximately 28% which corresponds to more than 200,000 misses in L2 cache which considerably slower than L1 Caches and so the miss penalty is a lot higher.

#### 2.1.2 429.mcf Benchmark Optimization

|        | L2 Cache Miss Rate & Accesses | L1 I-Cache Miss Rate & Accesses | L1 D-Cache Miss Rate & Accesses |
|:------:|:-----------------------------:|:-------------------------------:|:-------------------------------:|
| mcf    | 0.055046 in 724,390           | 0.023612 in 28,329,862          | 0.002108 in 35,735,336          |

**CPI**: 1.299095

In comparison with the previous benchmark there are a lot of differences regarding the CPI value. First of all, this benchmark has a considerably higher L1 I-Cache Miss Rate at 2.36% which in combination with the over 28 million accesses give us a total number of L1 I-Cache Misses to more than 600,000. We cannot neglect this high number of misses in L1 I-Cache and so upgrading the value or associativity of L1 I-Cache or the overall Cache Line Size. L1 D-Cache has a very low Miss Rate which is not going to cause any effect in the total CPI. Finally, even though L2 Cache has a lot lower Miss Rate at 5.5% we cannot ignore the fact that the L2 Cache Miss-Penalty is a lot higher than that in L1 and so we also need to modify the same parameters as in L1 I-Cache.

#### 2.1.3 456.hmmer Benchmark Optimization

|        | L2 Cache Miss Rate & Accesses | L1 I-Cache Miss Rate & Accesses | L1 D-Cache Miss Rate & Accesses |
|:------:|:-----------------------------:|:-------------------------------:|:-------------------------------:|
| hmmer  | 0.077760 in 70,563            | 0.000221 in 17,315,710          | 0.001637 in 43,920,897          |

**CPI**: 1.187917

The CPI of this benchmark are already near the minimum possible number which is 1. The L1 I-Cache Miss Rate is almost 0.02%, L1 D-Cache Miss Rate is almost 0.16% while L2 Cache Miss Rate is 7.7%. Even though 7.7% seems like it could be improved, the total acceses in L2 were only 70k compare to 17M in L1 I-Cache and 44M in L1 D-Cache so even if we tried to reduce the L2 Cache Miss Rate the resulting CPI wouldn't get any better. The only thing that could possibly improve the CPI could be to add more space in L1 D-Cache and increase associativity in order to reduce the Miss Rate. Moreover if the spatial locality of values is high, an even bigger Cache Line size could help improve but in the end all these changes wouldn't be worth it in terms of cost.

#### 2.1.4 458.sjeng Benchmark Optimization

|        | L2 Cache Miss Rate & Accesses | L1 I-Cache Miss Rate & Accesses | L1 D-Cache Miss Rate & Accesses |
|:------:|:-----------------------------:|:-------------------------------:|:-------------------------------:|
| sjeng  | 0.999972 in 5,264,051         | 0.000020 in 31,870,341          | 0.121831 in 86,380,797          |

**CPI**: 10.270554 

The results of this benchmark are quite obvious with respect to what is going wrong. The L2 Cache Miss Rate is over 99.99% with a total number of 5.2M accesses. It absolutely needs enormous improvement in the L2 Cache Miss Rate. This can be done either with the increase of size, the increase of associativity or the increase in Cache Line size. All these three variables, depending on the way the memory accesses happen can improve dramatically the CPI. Moreover, we can see a 12% Miss Rate in L1 D-Cache with more than 86M accesses. This means that almost 900,000 accesses are misses and these lead to L2 Cache accesses. An improvement in L1 D-Cache maybe could reduce the total number of acceses in L2 which is the main reason for the extremely high CPI rate. L1 I-Cache Miss Rate is 0.002% which is almost perfect compared to the other 2.

#### 2.1.5 470.libm Benchmark Optimization

|        | L2 Cache Miss Rate & Accesses | L1 I-Cache Miss Rate & Accesses | L1 D-Cache Miss Rate & Accesses |
|:------:|:-----------------------------:|:-------------------------------:|:-------------------------------:|
| libm   | 0.999944 in 1,488,538         | 0.000094 in 5,959,471           | 0.060972 in 48,806,657          |

**CPI**: 3.493415

The results of this benchmarks leads as to the same decisions like the previous one because they are quite alike. L2 Cache Miss Rate is over 99.99%, L2 Cache accesses are again too many with almost 1.5M accesses, L1 D-Cache has a Miss Rate of 6% which even though is not that much in combination with the 48M accesses resembles a lot the previous one and last but not least, L1 I-Cache has a Miss Rate of 0.009% which is too close to the previous benchmark. **So everything that we assumed in the previous benchmark applies here also.**

### 2.2 Effect of each parameter in CPI

Every parameter regarding Cache Memory, affects the execution time of benchmarks in different ways. In the following table there are graphs that show the change in CPI with respect to the change of **only one** variable each time.

#### 2.2.1 CPI vs L1 Instruction-Cache Size

![CPI vs L1 Instruction-Cache Size](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L1_iCache_Size.png)
As we said before, the available L1 I-Cache size are 16kB, 32kB, 64kB and 128kB. What we see here is what it was a little bit expected. Every benchmark has a L1 I-Cache Miss Rate value <0.0001% except for the _mcf_ benchmark which has a L1 I-Cache Miss Rate of 0.023%. As a result, _mcf_ was the only benchmark that saw an increase in performance by reducing CPI from 1.4 to 1.15 while every other benchmark had almost no change in performance.

#### 2.2.2 CPI vs L1 Instruction-Cache Associativity

![CPI vs L1 Instruction-Cache Associativity](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L1_iCache_Assoc.png)
Again, as it happened before with the L1 I-Cache Size, L1 I-Cache Associativity only affects the _mcf_ benchmark. Moreover, we can validate this result by looking not only the L1 I-Cache Miss Rate but also the overall accesses in L1 I-Cache in _mcf_ benchmark which are noticeably more than other benchmarks.

#### 2.2.3 CPI vs L1 Data-Cache Size

![CPI vs L1 Data-Cache Size](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L1_dCache_Size.png)
L1 D-Cache has a lot more acceses than L1 I-Cache because there are more operation regarding memory reads and writes rather than fetching instructions. This means that an increase in size of this type of Cache could bring lower CPI rates in most apllications. In our case we can see that only _bzip_ and _mcf_ benchmarks see an improvement in CPI even though _sjeng_ and _libm_ have a lot higher L1 D-Cache Miss rates. This means that _sjeng_ and _libm_ most probably suffer also from very high L2 Cache Miss Rates (_>99.99%_) and so maybe the main reason for their high CPI value is this.

#### 2.2.4 CPI vs L1 Data-Cache Associativity

![CPI vs L1 Data-Cache Associativity](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L1_dCache_Assoc.png)
In this graph we can barely see any change in the benchmarks regarding the associativity of L1 D-Cache with the exception of _bzip_ which had a slight improvement due to the high L1 D-Cache Accesses.

#### 2.2.5 CPI vs L2 Cache Size

![CPI vs L2 Cache Size](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L2_Cache_Size.png)
Even though _sjeng_ and _libm_ benchmarks had a very high L2 Cache Memory Miss Rate, the increase of its size had no impact in the overall performance. This means that probably the problem is not the amount of data that L2 Cache can store, but how "close" are the data that the CPU needs. In addition, _bzip_ benchmark that also had a high L2 Cache Miss Rate of 28% saw an improvement in the CPI.

#### 2.2.6 CPI vs L2 Cache Associativity

![CPI vs L2 Cache Associativity](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/L2_Cache_Assoc.png)
Again, as before the results are for all benchmarks the same except for a slight change in _bzip_ for the reasons that we stated above.

#### 2.2.7 CPI vs Cache Line Size

![CPI vs Cache Line Size](https://github.com/vamoirid/Computer-Architecture/blob/master/Lab_2/plots/Cacheline_Size.png)
The results in this graph are quite obvious and a little bit controversial one could say. We can clearly see a dramatic reduction in CPI for _sjeng_ and _libm_ benchmarks, a quite smaller reduction in terms of CPI for _bzip_, almost no change for _hmmer_ and a little increase(!) of CPI in _mcf_ benchmark. This means that the theory of **spatial locality** is very well established in the _sjeng_ and _libm_ benchmarks in contrast with the other 3 benchmarks. 

## 3. Cost of Performance and Cost Efficiency Optimization

The final part of this assignment is about categorizing the changes in the parameters of Cache Memory not only with the CPI optimization but also the overall **"cost"** that they add to the system. With the term **cost** we do not only mean the real price in money, but also the cost of adding physical size to memories, the cost of adding associativity to a memory, the cost of adding bytes in the Cache Line by reducing the total speed and many more examples like these. So we need to find a corresponding function in order to understand which changes are really worth.

### 3.1 Parameters affecting the Cost Performance.

After looking for a lot of papers and citations about the Cache Memory Organization and characteristics we came to some findings about the parameters which affect the cost and their relationship between.

* **Speed of Memory**  
It is known that the faster a memory is the more costly is going to be because its elements are more expensive to be fabricated. 
* **Size of Memory**  
The total size of a memory is directly connected with its cost because of the number of transistors that is used. For example, it is reasonable that a 2x size memory would have _almost_ 2x more transistors so its cost would also be 2x.
* **Associativity of Memory**  
Even though Associativity has nothing to do with total capacity of memory, it is known that more complexity is added to the memory with higher associativity. A memory with more sets of associativity needs more and bigger Multiplexers in order to access and fetch the data and that adds more hardware.
* **Block Size of Memory**  
The Block Size of a memory defines the architecture of a memory. A bigger Block Size would take advantage of spatial locality of a program but also would make the memory slower because it would need to access every time a lot more data in order to be fetced.

### 3.2 Association between the variables

* **L1 vs L2 Cache Size**  
**L1 Cache** is _5-6_ times faster than L2 cache. It aims for lower latency (_0.9-1.3ns_) compared to **L2 Cache** (_4.5-6.2ns_), thus it's made of larger transistors, wider metal tracks, trading off space and needs more power for speed. In terms of _complexity_ **L1 Cache** is one step ahead because it is devided into **instruction** and **data** cache which are accessed _parallelly_.  

By these factors we can assume that L1 Cache Size has 7-8 times bigger impact in cost than L2 Cache Size. 

* **L1 Vs L2 Cache Associativity**  
**L1 Cache** is positioned as close to the processor as possible, thus the addition of extra multiplexers and comparators is more difficult than **L2 Cache**. 

Associativity complexity depends on the **Cache size**. Therefore, we can assume that each step of associativity adds a cost of <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;(1&plus;\frac{L1_{Assoc}}{10})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;(1&plus;\frac{L1_{Assoc}}{10})" title="(1+\frac{L1_{Assoc}}{10})" /></a> on L1 Caches and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;(1&plus;\frac{L2_{Assoc}}{15})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;(1&plus;\frac{L2_{Assoc}}{15})" title="(1+\frac{L2_{Assoc}}{15})" /></a> on L2 Caches. 

* **Cache Line Size**  
The increase of the **Cache Line size** takes advantage of spatial locality in order to reduce miss rate, but they make the memory a lot slower. So as we can understand the increase of Cache Line size in L1 Cache should be a lot costlier than that in L2 Cache because L1 Cache aims exclusively for speed while L2 Cache aims not only for speed but for capacity also. Every time that we need to load a new line we would load 2x the amount of data if we double the amount of data in the Line.

So for L1 Cache the coefficient is <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;(1&plus;\frac{L1_{CacheLine}}{64})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;(1&plus;\frac{L1_{CacheLine}}{64})" title="(1+\frac{L1_{CacheLine}}{64})" /></a> while for L2 Cache is <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;(1&plus;\frac{L2_{CacheLine}}{128})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;(1&plus;\frac{L2_{CacheLine}}{128})" title="(1+\frac{L2_{CacheLine}}{128})" /></a>.

### 3.3 Generating the Function 
The cost function is a polyominal of: 

* **L1 & L2 Cache Size**
* **L1 & L2 Associativity**
* **Cache Line Size**

multiplicated with a **CPI Gain** function. 

<a href="https://www.codecogs.com/eqnedit.php?latex=Cost&space;=&space;[8L1_{size}(1&plus;\frac{L1_{Assoc}}{10}&space;&plus;&space;\frac{L1_{CacheLine}}{64})&plus;L2_{size}(1&plus;\frac{L2_{Assoc}}{15}&plus;\frac{L2_{CacheLine}}{128})]*ln(\frac{e^{cpi_{old}}-e^{cpi_{new}}}{2e^{cpi_{old}}}&plus;1)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Cost&space;=&space;[8L1_{size}(1&plus;\frac{L1_{Assoc}}{10}&space;&plus;&space;\frac{L1_{CacheLine}}{64})&plus;L2_{size}(1&plus;\frac{L2_{Assoc}}{15}&plus;\frac{L2_{CacheLine}}{128})]*ln(\frac{e^{cpi_{old}}-e^{cpi_{new}}}{2e^{cpi_{old}}}&plus;1)" title="Cost = [8L1_{size}(1+\frac{L1_{Assoc}}{10} + \frac{L1_{CacheLine}}{64})+L2_{size}(1+\frac{L2_{Assoc}}{15}+\frac{L2_{CacheLine}}{128})]*ln(\frac{e^{cpi_{old}}-e^{cpi_{new}}}{2e^{cpi_{old}}}+1)" /></a>
