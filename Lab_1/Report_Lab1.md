#### Amoiridis Vasileios 8772
#### Stefanos Tsoukias 8936

Question no.1

In the file _starter_se.py_ there are several variables that are able to change the parameters of the systems that we simulate in **GEM5**. These variables can be very easily distinguished from the _parser_ function of the same program.

* _--cpu_: this flag defines the type of kernel that we want to use in our simulation. There are 3 choices which are: atomic, minor, hpi.
* _--cpu-freq_: this flag of CPU clock frequency.
* _--num-cores_: this flag defines the number of cores that the CPU is going to use for the execution of the program. If the program has no parallelism, then this number doesn't matter.
* _--mem-type_: this flag defines the type of RAM that we want to use in the simulation.
* _--mem-channels_: this flag defines the number of Channels that the memory consists of.
* _--mem-rank_: this flag defines the rank of the memory.
* _--mem-size_: this flag defines the total size of RAM.

Using these flags we can basically change the characteristics of the system to be simulated, except for its domain frequency. The frequency that is changed using the flag _--cpu-freq_ is the CPU clock frequency and not the system frequency. In order to change the domain frequency which consists of the CPU and the peripherals we need to change the value of _clk_domain.clock_ variable which is in the same file.
