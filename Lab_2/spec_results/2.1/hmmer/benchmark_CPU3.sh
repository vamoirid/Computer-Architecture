#1
./build/ARM/gem5.opt -d hmmer/hmmer_CL128_L1DSize064_Assoc02 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=2 --cacheline_size=128 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000
#2
./build/ARM/gem5.opt -d hmmer/hmmer_CL128_L1DSize064_Assoc04 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=4 --cacheline_size=128 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000
#3
./build/ARM/gem5.opt -d hmmer/hmmer_CL128_L1DSize064_Assoc08 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=8 --cacheline_size=128 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000
#4
./build/ARM/gem5.opt -d hmmer/hmmer_CL128_L1DSize064_Assoc16 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1d_assoc=16 --cacheline_size=128 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

