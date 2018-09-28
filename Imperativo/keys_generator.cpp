/**
 * Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 **/
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "keys_generator.h"
using namespace std;

long e;
unsigned long d;
long long int n;

/**
 * Calcula maior divisor comum de maneira otimizada.
 **/
int gcd(long long int a, int b)
{
    return b == 0 ? a : gcd(b, a % b);
}

/**
 * Calcula o expoente E para que seja menor que o totiente, e que possa como GCD igual a 1
 **/
int getE(long long int value)
{
    srand(time(NULL));
    int retorno, numb;
    while(true) {
        numb = rand() % value + 2;
        retorno = gcd(value, numb);
    if (retorno == 1) return numb;
    }
    return 0;
}

/**
 * Calcula o expoente D usando funcao modular inversa.
 **/
unsigned long getD(long long int totiente, long e){
    for(unsigned long index = 1;index < totiente;index++)
    { 
         if ((e * index) % totiente == 1) {
          return index; 
         }
    }
    return 0;
}

/**
 * Recebe dois primos, e faz os calculos caracteristicos do algoritmo RSA para definir chaves privadas e publicas
 **/
void generate_keys(long p, long q){
    n = p * q;

    long long int totiente = (p-1)*(q-1);
    e = getE(totiente);
    d = getD(totiente, e);
    printf("\nChave pública: \n  n: %lld \n  e: %ld \n\nChave Privada: \n  Primo 1: %ld \n  Primo 2: %ld \n  d: %ld \n\n",n,e,p,q,d);
}