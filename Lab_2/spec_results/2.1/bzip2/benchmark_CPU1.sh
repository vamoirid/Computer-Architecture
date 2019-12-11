#1
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc08_DCache064_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=2 --l2_size=2MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#2
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc08_DCache064_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=4 --l2_size=2MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#3
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc08_DCache064_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=8 --l2_size=2MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#4
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc08_DCache064_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=16 --l2_size=2MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

#5
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc16_DCache064_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=2 --l2_size=2MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#6
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc16_DCache064_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=4 --l2_size=2MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#7
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc16_DCache064_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=8 --l2_size=2MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#8
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache2_Assoc16_DCache064_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=16 --l2_size=2MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

#9
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc08_DCache064_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=2 --l2_size=4MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#10
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc08_DCache064_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=4 --l2_size=4MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#11
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc08_DCache064_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=8 --l2_size=4MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#12
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc08_DCache064_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=16 --l2_size=4MB --l2_assoc=8 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

#13
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc16_DCache064_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=2 --l2_size=4MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#14
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc16_DCache064_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=4 --l2_size=4MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#15
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc16_DCache064_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=8 --l2_size=4MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
#16
./build/ARM/gem5.opt -d bzpip2/bzip_CL064_L2Cache4_Assoc16_DCache064_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=16 --l2_size=4MB --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

