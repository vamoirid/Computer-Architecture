#1
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc08_L1DSize128_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=2 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#2
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc08_L1DSize128_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=4 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#3
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc08_L1DSize128_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#4
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc08_L1DSize128_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=16 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

#5
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc16_L1DSize128_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=16 --l1d_size=128kB --l1d_assoc=2 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#6
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc16_L1DSize128_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=16 --l1d_size=128kB --l1d_assoc=4 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#7
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc16_L1DSize128_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=16 --l1d_size=128kB --l1d_assoc=8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#8
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size2_Assoc16_L1DSize128_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=2MB --l2_assoc=16 --l1d_size=128kB --l1d_assoc=16 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

#9
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc8_L1DSize128_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=2 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#10
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc8_L1DSize128_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=4 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#11
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc8_L1DSize128_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#12
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc8_L1DSize128_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=16 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

#13
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc16_L1DSize128_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=2 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#14
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc16_L1DSize128_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=4 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#15
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc16_L1DSize128_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
#16
./build/ARM/gem5.opt -d sjeng/sjeng_CL128_L2Size4_Assoc16_L1DSize128_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 --l2_size=4MB --l2_assoc=8 --l1d_size=128kB --l1d_assoc=16 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000


