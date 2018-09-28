/**
 * Criptografia RSA
 * Grupo: Eduardo Henrique
 *        Thayanne Sousa
 *        Joao Pedro
 *        Rafael Dantas
 *        Matheus Araujo
 **/
#include <iostream>
#include <string.h>
#include <string>
#include <stdio.h>
#include "rsa_algorithm.h"
#include "keys_generator.h"
#include "isOptimusOptimizado.h"
using namespace std;

/*
     @author: Rafael Dantas Santos de Azevedo
*/


int main() 
{
    string mensagem;
    int opcao;
   do{
       printf("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair\n\n");
        cout << "Opção => ";
        scanf("%i",&opcao);
       switch (opcao) {
           case 1:
           {
                long primo1, primo2;
                printf("\n(1)Inserir primos\n(2)Gerar automaticamente\n\n");
                cout << "Opção => ";
                cin >> opcao;
                if(opcao == 1) {
                    printf("Insira os primos a seguir: ");
                    cout << "\n  Insira o primo 1: ";
                    cin >> primo1;
                    cout << "  Insira o primo 2: ";
                    cin >> primo2;
                    generate_keys(primo1, primo2);

                }
                else if(opcao == 2) {
            
                    bigPrimeGenerator1(&primo1, &primo2);
                    generate_keys(primo1, primo2);
                }
           }
            break; 

            case 2:
            {
                int e1;
                long long int n1;
                cout << "Insira a mensagem: ";
                cin.ignore();
                getline(cin, mensagem);
                cout << "\nInsira Chave pública: \n  n: ";
                cin >> n1;
                cin.ignore();
                cout << "  e: ";
                cin >> e1;
                encrypt(mensagem, e1, n1);
            }
                break;
            case 3:
            {
                unsigned long int d1;
                long long int n2;
                string mensagem2;
                cout << "Insira a mensagem criptografada: ";
                cin.ignore();
                getline(cin, mensagem2);
                cout << "\nInsira Chave Privada: \n  d: ";
                cin >> d1;
                cin.ignore();
                cout << "  n: ";
                cin >> n2;
                decrypt_message(mensagem2, d1, n2);
            }
                break;
            case 4:
            {

                string mensagem2;
                cout << "Insira a mensagem: ";
                cin.ignore();
                getline(cin, mensagem2);
                rsa_algorithm(mensagem2, e, d, n);
            }
                break;
       }
    } while(opcao != 5);
   return 0;
}
