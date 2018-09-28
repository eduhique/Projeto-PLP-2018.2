/**
 * Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 **/
#include <string.h>
#include <string>
using namespace std;
#ifndef rsa_algorithm_h   
#define rsa_algorithm_h  

/**
 * Recebe uma mensagem, junto com a chave publica e chave privada, fazendo a criptografia usando
 * metodo.
 **/
void rsa_algorithm(string input, int e, unsigned long int d, long long int n);
void encrypt(string input, int e, long long int n);
void decrypt(unsigned long int d, long long int n);
void decrypt_message(string input, unsigned long int d, long long int n);

#endif 