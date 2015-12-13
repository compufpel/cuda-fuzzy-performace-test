#include <iostream>
#include <time.h>

#include "includes/cuda-fuzzy/lib/FuzzyLogic/FuzzyLogic.cu"
#include "includes/cuda-fuzzy/lib/FuzzyLogic/BulkLogic.cu"
#include "includes/cuda-fuzzy/lib/FuzzyLogic/d_BulkLogic.cu"

using namespace std;

double* generateRandomArray(int size);
double fRand(double fMin, double fMax);

int main() {

	float deviceTime, hostTime;

	int arraySize;

	cout << "arraySize,operation,sequentialTime,cudaTime" << endl;

	for(arraySize = 10000; arraySize < 1000000000; arraySize = arraySize*10) {

		for(int i = 0; i < 30; i++) {

			double* array1 = generateRandomArray(arraySize);
			double* array2 = generateRandomArray(arraySize);
			double* result;

			cudaEvent_t start, stop;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkNot(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);
			
			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkNot(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",Not," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkNot2(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkNot2(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",Not2," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkNot3(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkNot3(array1, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",Not3," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkAnd(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkAnd(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",And," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkAnd2(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkAnd2(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",And2," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkOr(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkOr(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",Or," << hostTime << "," << deviceTime << endl;

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = h_BulkOr2(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&hostTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cudaEventCreate(&start);
			cudaEventCreate(&stop);

			cudaEventRecord(start, 0);
			result = d_BulkOr2(array1, array2, arraySize);
			cudaEventRecord(stop, 0);

			free(result);

			cudaEventSynchronize(stop);

			cudaEventElapsedTime(&deviceTime, start, stop);
			
			cudaEventDestroy(start);
			cudaEventDestroy(stop);

			cout << arraySize << ",Or2," << hostTime << "," << deviceTime << endl;

			free(array1);
			free(array2);
		}
	}	

	return 1;

}

double* generateRandomArray(int size) {

	double* array = (double*)malloc(sizeof(double) * size);
	srand(time(NULL));

	for(int i = 0; i < size; i++) {

		array[0] = fRand(0, 1);

	}

	return array;

}

double fRand(double fMin, double fMax) {
	double f = (double)rand() / RAND_MAX;
 	return fMin + f * (fMax - fMin);
}