#ifndef keys_generator_h   
#define keys_generator_h 

/**
 * Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 **/
/**
 * @author Eduardo Henrique Pontes Silva
 * */

extern unsigned long d;
extern long long int n;
extern long e;

/**
 * Ao receber dois primos, gera as chaves: chave_publica(e, n), chave_privada(d, e)
 * e as imprime para o usuario
 **/
void generate_keys(long p, long q);

#endif 