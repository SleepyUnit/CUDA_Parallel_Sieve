#!/bin/bash
nvcc SorensonPar.cu -o SorensonPar
./SorensonPar 1000 > sorenson_1000
./SorensonPar 10000 > sorenson_10000
./SorensonPar 100000 > sorenson_100000
./SorensonPar 1000000 > sorenson_1000000
./SorensonPar 10000000 > sorenson_10000000
./SorensonPar 100000000 > sorenson_100000000
./SorensonPar 1000000000 > sorenson_1000000000

nvcc Shared\ Primes.cu -o sharedprimes
./sharedprimes 1000 > sharedprimes_1000
./sharedprimes 10000 > sharedprimes_10000
./sharedprimes 100000 > sharedprimes_100000
./sharedprimes 1000000 > sharedprimes_1000000
./sharedprimes 10000000 > sharedprimes_10000000
./sharedprimes 100000000 > sharedprimes_100000000
./sharedprimes 1000000000 > sharedprimes_1000000000

nvcc Simple\ Kernel.cu -o simplekernel
./simplekernel 1000 > simplekernel_1000
./simplekernel 10000 > simplekernel_10000
./simplekernel 100000 > simplekernel_100000
./simplekernel 1000000 > simplekernel_1000000
./simplekernel 10000000 > simplekernel_10000000
./simplekernel 100000000 > simplekernel_100000000
./simplekernel 1000000000 > simplekernel_1000000000


nvcc CPU\ Naive.cu -o cpusieve
./cpusieve 1000 > cpusieve_1000
./cpusieve 10000 > cpusieve_10000
./cpusieve 100000 > cpusieve_100000
./cpusieve 1000000 > cpusieve_1000000
./cpusieve 10000000 > cpusieve_10000000
./cpusieve 100000000 > cpusieve_100000000
./cpusieve 1000000000 > cpusieve_1000000000

echo "Finished testing SorensonPar, Shared Primes, CPU Naive, and Simple Kernel from 1,000 to 1,000,000,000"
