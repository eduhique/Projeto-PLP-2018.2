/** Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 **/
#include <iostream>
#include <string.h>
#include <string>
#include <stdlib.h>
#include <cstdio>
#include <math.h>
#include <sstream>
#include "rsa_algorithm.h"

using namespace std;

/*
@author: João Pedro Barros Barbosa
*/

int input_tam;
long long int encrypted[100], decrypted[100];

/** Calcula c**d realizando operacao de mod a cada interacao.
 * @param c base da exponenciacao
 * @param d expoente
 * @param n valor a ser tirado modulo
 * @return valor calculado por (c d) % n
**/
long long int pow_and_mod(long c, unsigned long int d, long long int n ){
   long long int value = 1;
    while(d > 0){
        value *= c;
        value %= n;
        d--;
    }
   return value;
}

/** Realiza todo o processo do algoritmo RSA, criptografando com a chave publica, depois
* descriptografando com a chave privada.
**/
void rsa_algorithm(string input, int e, unsigned long int d, long long int n){
    input_tam = input.length();
    encrypt(input, e, n);
    decrypt(d, n);
}
/* Encripta uma mensagem, recebendo o valor e e n como valores da chave publica **/
void encrypt(string input, int e, long long int n){
    cout << "Criptografando..." << endl;
    string encrypted_message;

    int message[input.length() - 1];

    for (int i = 0; i < input.length(); i++){
    message[i] = ((int) input[i]);
    encrypted[i] = pow_and_mod(message[i], e, n);
    encrypted_message += char(encrypted[i]);
    }
    cout << "Mensagem criptografada: " << endl;
    for (int i = 0; i <= sizeof(message) / sizeof(message[0]); i++){
    cout << encrypted[i] << " ";
    }
    cout << "\n";
}

/**
 * Decripta a mensagem criptografada anteriomente, recebendo o valor `d` e `n` como valores da chave privada
 * @author: Thayanne
 **/
void decrypt(unsigned long int d, long long int n){
    cout << "Descriptografando..." << endl;
    string decrypted_message = "";

    for(int i = 0; i < input_tam; i++){
        decrypted[i] = pow_and_mod(encrypted[i], d, n);
        decrypted_message += (char) decrypted[i];
    }

   cout << "Descriptograda: " << decrypted_message << endl;
}

/**
 * Decripta uma mensagem criptografada, recebendo o valor `d` e `n` como valores da chave privada
 * @author: Thayanne
 **/
void decrypt_message(string input, unsigned long int d, long long int n){
    cout << "Descriptografando... \n\n";
    string decrypted_message;
    input += " ";
    string aux;
    int tam = 0;
    for (int i = 0; i <= input.length(); i++) {
        if (input[i] == ' ') {
            tam++;
        }
    }
    long long int array[tam];
    int j = 0;

    for (int i = 0; i <= input.length(); i++) {
        if (input[i] != ' ') aux += input[i];
        else {
            if (j == tam -1){
                break;
            }
            array[j++] = stoll(aux);
            aux = "";
        }
    }

    int decrypted[tam]; 

    for(int i = 0; i < tam; i++){
        decrypted[i] = pow_and_mod(array[i], d, n);
        decrypted_message += (char)decrypted[i];
    }

   cout << "Descriptografei: " << decrypted_message << endl;
}
