#include <iostream>
#include "primes.h"
using namespace std;

class Rsa {
    int p, q;
  public:
    Rsa (void);
    int getModulus () {return (p * q);}
};

Rsa::Rsa () {
  p = get_prime();
  q = get_prime();
}

int main () {
  Rsa rsa;
  cout << "prime number: " << rsa.getModulus() << endl;
  return 0;
}