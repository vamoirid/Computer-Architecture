
#5.simulations with L1 dCache Size 16kB
./build/ARM/gem5.opt -d spec_results/specbzip_L1dCacheSize16kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=16kB -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_L1dCacheSize16kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=16kB -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_L1dCacheSize16kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=16kB -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_L1dCacheSize16kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=16kB -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_L1dCacheSize16kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache ---l1d_size=16kB -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000



