#include <iostream>
#include "primes.h"

using namespace std;
#define MAX 1000000

int get_prime(){
    srand ( time(NULL) ); // to not get the same number always

    bool arr[MAX + 1];
    memset(arr, true, sizeof(arr));
    
    for(int p = 2; p * p <= MAX; p++){
        if(arr[p] == true){
            for(int i = p * 2; i <= MAX; i += p)
                arr[i] = false;     
        }
    }

    while(true){
        int index = (rand() % 1000000 + 10000);
        if(arr[index])
            return index;
    }
    
}