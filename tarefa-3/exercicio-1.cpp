/* Implementar a multiplicação de inteiros utilizando somas sucessivas. Você deverá criar um procedimento
e chamá-lo recursivamente.*/

#include <iostream>
using namespace std;

int product(int a, int b) {
    if (b == 0) {
        return 0;
    }
    return a + product(a, b - 1);
}

int main() {
    int a, b;
    cin >> a >> b;
    cout << product(a, b) << endl;
    return 0;
}