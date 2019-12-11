#1
./build/ARM/gem5.opt -d mcf/mcf_ICache032_Assoc08_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=32kB --l1i_assoc=8 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#2
./build/ARM/gem5.opt -d mcf/mcf_ICache064_Assoc08_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=64kB --l1i_assoc=8 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#3
./build/ARM/gem5.opt -d mcf/mcf_ICache128_Assoc08_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=128kB --l1i_assoc=8 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#4
./build/ARM/gem5.opt -d mcf/mcf_ICache032_Assoc16_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=32kB --l1i_assoc=16 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#5
./build/ARM/gem5.opt -d mcf/mcf_ICache064_Assoc16_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=64kB --l1i_assoc=16 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#6
./build/ARM/gem5.opt -d mcf/mcf_ICache128_Assoc16_CL064 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=128kB --l1i_assoc=16 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
