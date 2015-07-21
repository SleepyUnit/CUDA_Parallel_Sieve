/* SorensonPar.cu
   Parallel Implementation of Algorithm 4.1
   as discussed in Sorenson and Parberry's
   1994 paper "Two Fast Parallel Prime Number
   Sieves".

   Authors:
   Daniel Anzaldo
   David Frank
   Antonio Lanfranchi
*/

// Visual Studio Dependencies (Can be commented out)
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

// C dependencies
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
using namespace std;

// C++ dependencies
#include <algorithm>

typedef unsigned long long big;

// GLOBAL VARIABLES--------------------------------------

bool * S;	// Global shared bit array of numbers up to N

/* These are for tracking time */
struct timezone myTimezone;	
struct timeval startTime, endTime;

// HOST FUNCTION HEADERS---------------------------------

/*	EratosthenesSieve
	HELPER: for Algorithm 4.1 Sequential Portion
	The most basic form of generating primes.
*/
void EratosthenesSieveNaive(big n);

/* Set a checkpoint and show the total running time in seconds */
double report_running_time(const char *arr);


/*	MAIN
	To run this add the ff. args:
	1. N = the number up to which you're sieving
*/
int main(int argc, char **argv)
{
	big N = (big)strtoul(argv[1], NULL, 10);
	S = new bool[N]; //(bool*)malloc(N * sizeof(bool));

	printf("Find primes up to: %llu\n\n", N);
	
	/* start counting time */
	gettimeofday(&startTime, &myTimezone);

	/* sieve for primes up to N */
	EratosthenesSieveNaive(N);

	/* check the total running time */ 
	report_running_time("Algorithm 4.1 CPU");

	// Display the primes.
	for (int i = 0; i < N; i++)
		if (S[i]) printf("%llu ", i);

	delete[] S;
    return 0;
}


// HOST FUNCTION DEFINITIONS-----------------------------

void EratosthenesSieveNaive(big n)
{
	// 0 and 1 are non-primes.
	S[0] = S[1] = false;
	for (big i = 2; i < n; i++)
		S[i] = true;

	// Simple Sieving Operation.
	for (big i = 2; i < n; i++)
		if (S[i])
		{
			int j;
			for (j = i*i; j < n; j += i)
				S[j] = false;
		}
}

/* 
	set a checkpoint and show the (natural) running time in seconds 
*/
double report_running_time(const char *arr) {
	long sec_diff, usec_diff;
	gettimeofday(&endTime, &myTimezone);
	sec_diff = endTime.tv_sec - startTime.tv_sec;
	usec_diff= endTime.tv_usec-startTime.tv_usec;
	if(usec_diff < 0) {
		sec_diff --;
		usec_diff += 1000000;
	}
	printf("Running time for %s: %ld.%06ld sec\n\n", arr, sec_diff, usec_diff);
	return (double)(sec_diff*1.0 + usec_diff/1000000.0);
}
