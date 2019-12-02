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
Similarly, if we search for the term _dcache_ inside the _config.ini_ file we are going to find some of the information that we need about the Data Cache Memory. In _Line 155_: **[system.cpu.dcache]**, we can very easily recognise that the variable _size = 65536_ states that the L1-Data Cache has a size of **64k**. Moreover, the variable _assoc = 2_ states that the I-Cache has a 2-way Set Associativity.

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
* **456.hmmer** is a benchmark which makes the CPU search in a gene database using Hiden Markov Model.  
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

If we thing about a basic rule for the calculation of the CPI

<a href="https://www.codecogs.com/eqnedit.php?latex=CPI&space;=&space;1&space;&plus;&space;\frac{(L1.Instruction.total\_misses&space;&plus;&space;L1.Data.total\_misses)*L1.miss\_penalty&space;&plus;&space;L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?CPI&space;=&space;1&space;&plus;&space;\frac{(L1.Instruction.total\_misses&space;&plus;&space;L1.Data.total\_misses)*L1.miss\_penalty&space;&plus;&space;L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" title="CPI = 1 + \frac{(L1.Instruction.total\_misses + L1.Data.total\_misses)*L1.miss\_penalty + L2.total\_misses*L2.miss\_penalty}{Total\_Num\_Of\_Instructions}" /></a>

we can understand that is not only the Miss Rate of the L2 Cache that can make the execution of the program a lot slower, but it is also the number of the overall accesses (read+write to the respective memory) in combination with the Miss Rate. In our case, in the generated files the **overall** L2 Cache acceses and misses were:

|        | L2 Cache Accesses | L2 Cache Misses | L1 I-Cache Accesses | L1 D-Cache Accesses |
|:------:|:-----------------:|:---------------:|:-------------------:|:-------------------:|
| bzip   | 712,341           | 200,996         | 9,663,457           | 52,077,014          |
| mcf    | 724,390           | 39,875          | 28,329,862          | 35,735,336          |
| hmmer  | 70,563            | 5,487           | 17,315,710          | 43,920,897          |
| sjeng  | 5,264,051         | 5,263,903       | 31,870,341          | 86,380,797          |
| libm   | 1,488,538         | 1,488,455       | 5,959,471           | 48,806,657          |

