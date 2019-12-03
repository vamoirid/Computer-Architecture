#1.simulations with L2 Cache Associativity 2 & L2 Cache Size 4MB & 32Byte Cache Line
./build/ARM/gem5.opt -d spec_results/specbzip_L2CacheAssoc2_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=2 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_L2CacheAssoc2_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=2 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_L2CacheAssoc2_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=2 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_L2CacheAssoc2_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=2 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_L2CacheAssoc2_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=2 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

#2.simulations with L2 Cache Associativity 4 & L2 Cache Size 4MB & 32Byte Cache Line
./build/ARM/gem5.opt -d spec_results/specbzip_L2CacheAssoc4_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=4 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_L2CacheAssoc4_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=4 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_L2CacheAssoc4_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=4 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_L2CacheAssoc4_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=4  --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_L2CacheAssoc4_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=4 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

#3.simulations with L2 Cache Associativity 8 & L2 Cache Size 4MB & 32Byte Cache Line
./build/ARM/gem5.opt -d spec_results/specbzip_L2CacheAssoc8_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=8 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_L2CacheAssoc8_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=8 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_L2CacheAssoc8_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=8 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_L2CacheAssoc8_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=8 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_L2CacheAssoc8_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=8 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

#4.simulations with L2 Cache Associativity 16 & L2 Cache Size 4MB & 32Byte Cache Line
./build/ARM/gem5.opt -d spec_results/specbzip_L2CacheAssoc16_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=16 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_L2CacheAssoc16_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=16 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_L2CacheAssoc16_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=16 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_L2CacheAssoc16_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=16 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_L2CacheAssoc16_L2CacheSize4MB_CacheLine32B configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l2_assoc=16 --l2_size=4MB --cacheline_size=32 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000


