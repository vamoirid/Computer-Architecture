#Simulation with 32Byte Cach Line
./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specbzip_CacheLine32kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=32 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specmcf_CacheLine32kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=32 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/spechmmer_CacheLine32kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=32 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specsjeng_CacheLine32kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=32 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/speclibm_CacheLine32kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=32 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
#simulations with 128Byte Cache Line
./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specbzip_CacheLine128kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specmcf_CacheLine128kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/spechmmer_CacheLine128kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/specsjeng_CacheLine128kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d /home/vamoirid/Desktop/git/Computer-Architecture/Lab_2/spec_results/speclibm_CacheLine128kB configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cacheline_size=128 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
