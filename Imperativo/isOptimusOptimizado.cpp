#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "isOptimusOptimizado.h"
using namespace std;

/**
 * Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 *
 *  @author: Matheus Silva Araujo
**/

/**
 * Verifica se um numero é Primo.
 * */
int isPrime(int n)
{
    if (n <= 1) return 0;
    else if (n <= 3) return 1;

    else if (n % 2 == 0 || n % 3 == 0) return 0;

    int i = 5;
    while (i * i <= n)
    {
        if (n % i == 0 || n % (i + 2) == 0) return 0;

        i += 6;
    }
    return 1;
}

/**
 * Gera dois numeros primos grandes que serao utilizados no algoritmo RSA para gerar as chaves
 **/
void bigPrimeGenerator1(long *p, long *q)
{
    int numb = 0, times = 0;
    srand(time(NULL));
    while (true) {
        numb = rand() % 9999 + 1000;

        if (numb % 2 != 0) {
            if (isPrime(numb)) {
                if (times++ == 0) *p = numb;
                else {
                    (*q = numb);
                    return;
                }
            }
        }
    }
}