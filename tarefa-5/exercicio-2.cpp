// # Escreva um programa em linguagem Assembly do MIPS para ser executado no simulador MARS.
// # Este programa deverá calcular o fatorial de um número e deve atender às seguintes premissas:
// # • Receba via teclado o valor do número a ser calculado o fatorial;
// # • Chame uma função fatorial( ) - procedimento – para calcular, de modo recursivo, o fatorial
// # do número; e
// # • Mostre o resultado na tela do computador.

#include <iostream>
#include <string>
using namespace std;

int fatorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * fatorial(n - 1);
    }
}

int main() {
    int n;
    cout << "Digite um número: ";
    cin >> n;
    cout << "O fatorial de " << n << " é " << fatorial(n) << endl;
    return 0;
}