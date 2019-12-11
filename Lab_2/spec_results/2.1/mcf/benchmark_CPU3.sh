#1
./build/ARM/gem5.opt -d mcf/mcf_ICache032_Assoc02_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=32kB --l1i_assoc=2 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#2
./build/ARM/gem5.opt -d mcf/mcf_ICache064_Assoc02_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=64kB --l1i_assoc=2 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#3
./build/ARM/gem5.opt -d mcf/mcf_ICache128_Assoc02_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=128kB --l1i_assoc=2 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#4
./build/ARM/gem5.opt -d mcf/mcf_ICache032_Assoc04_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=32kB --l1i_assoc=4 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#5
./build/ARM/gem5.opt -d mcf/mcf_ICache064_Assoc04_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=64kB --l1i_assoc=4 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
#6
./build/ARM/gem5.opt -d mcf/mcf_ICache128_Assoc04_CL128 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=128kB --l1i_assoc=4 --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
