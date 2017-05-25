/*
Author : Shay Gal-On, EEMBC

This file is part of  EEMBC(R) and CoreMark(TM), which are Copyright (C) 2009 
All rights reserved.                            

EEMBC CoreMark Software is a product of EEMBC and is provided under the terms of the
CoreMark License that is distributed with the official EEMBC COREMARK Software release. 
If you received this EEMBC CoreMark Software without the accompanying CoreMark License, 
you must discontinue use and download the official release from www.coremark.org.  

Also, if you are publicly displaying scores generated from the EEMBC CoreMark software, 
make sure that you are in compliance with Run and Reporting rules specified in the accompanying readme.txt file.

EEMBC 
4354 Town Center Blvd. Suite 114-200
El Dorado Hills, CA, 95762 
*/ 
/* File: core_main.c
	This file contains the framework to acquire a block of memory, seed initial parameters, tun the benchmark and report the results.
*/
#include "coremark.h"
#include <stdlib.h>

/* Function: iterate
	Run the benchmark for a specified number of iterations.

	Operation:
	For each type of benchmarked algorithm:
		a - Initialize the data block for the algorithm.
		b - Execute the algorithm N times.

	Returns:
	NULL.
*/
static ee_u16 list_known_crc[]   =      {(ee_u16)0xd4b0,(ee_u16)0x3340,(ee_u16)0x6a79,(ee_u16)0xe714,(ee_u16)0xe3c1};
static ee_u16 matrix_known_crc[] =      {(ee_u16)0xbe52,(ee_u16)0x1199,(ee_u16)0x5608,(ee_u16)0x1fd7,(ee_u16)0x0747};
static ee_u16 state_known_crc[]  =      {(ee_u16)0x5e47,(ee_u16)0x39bf,(ee_u16)0xe5a4,(ee_u16)0x8e3a,(ee_u16)0x8d84};
void *iterate(void *pres) {
	ee_u32 i;
	ee_u16 crc;
	core_results *res=(core_results *)pres;
	ee_u32 iterations=res->iterations;
	res->crc=0;
	res->crclist=0xe714;
	res->crcmatrix=0x1fd7;
	res->crcstate=0x8e3a;

	for (i=0; i<iterations; i++) {
		//crc=core_bench_matrix(&res->mat,res->seed1,res->crc);
		crc=core_bench_list(res,1);
		res->crc=crcu16(crc,res->crc);
		crc=core_bench_list(res,-1);
		res->crc=crcu16(crc,res->crc);
		if (i==0) res->crclist=res->crc;
	}
	return NULL;
}

#if (SEED_METHOD==SEED_ARG)
ee_s32 get_seed_args(int i, int argc, char *argv[]);
#define get_seed(x) (ee_s16)get_seed_args(x,argc,argv)
#define get_seed_32(x) get_seed_args(x,argc,argv)
#else /* via function or volatile */
ee_s32 get_seed_32(int i);
#define get_seed(x) (ee_s16)get_seed_32(x)
#endif

#if (MEM_METHOD==MEM_STATIC)
ee_u8 static_memblk[TOTAL_DATA_SIZE];
#endif
char *mem_name[3] = {"Static","Heap","Stack"};
/* Function: main
	Main entry routine for the benchmark.
	This function is responsible for the following steps:

	1 - Initialize input seeds from a source that cannot be determined at compile time.
	2 - Initialize memory block for use.
	3 - Run and time the benchmark.
	4 - Report results, testing the validity of the output if the seeds are known.

	Arguments:
	1 - first seed  : Any value
	2 - second seed : Must be identical to first for iterations to be identical
	3 - third seed  : Any value, should be at least an order of magnitude less then the input size, but bigger then 32.
	4 - Iterations  : Special, if set to 0, iterations will be automatically determined such that the benchmark will run between 10 to 100 secs

*/

int main (void){
	ee_s16*  A=(ee_s16*)malloc(sizeof(40000*sizeof(ee_s16)));
		ee_u16  B[1048576];
		ee_u16 val=5;
		ee_u32* C=(ee_u32*)malloc(sizeof(40000*sizeof(ee_u16)));
		ee_u16 i,j=0,num_algorithms=0;
		for (i=0;i<40000;i++){
			A[i]=i;

			}
	CORE_TICKS total_time;
	start_time();
	for(i=0;i<100;i++){
			matrix_test(100,C,A,A,val);
	}


		stop_time();
		total_time=get_time();
		xil_printf("O xronos pou pire itan %d\n",total_time);
}


