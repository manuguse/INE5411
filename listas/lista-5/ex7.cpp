/* 
Considere que o processador MIPS está sendo utilizado para controlar um conjunto de 32
dispositivos externos. Cada dispositivo recebe um bit indicando se ele deve ser ligado (=1) ou
desligado (=0). Estes bits estão armazenados no endereço de dados 0x10010020. Implemente um
programa que faça as seguintes operações:
• O usuário deve informar pelo teclado se quer ligar ou desligar um bit. Exemplo: se digitar 1, é para
ligar algum bit. Se digitar 0, é para desligar algum bit;
• O usuário deve informar, na sequência, qual bit deve ser ligado/desligado. Por exemplo, ao digitar
2, então o bit 2 do endereço 0x10010020 deve ser ligado ou desligado (conforme instrução
anterior).
• Os estados anteriores dos outros bits devem ser preservados obrigatoriamente
*/
#include <stdio.h>
#include <stdlib.h>
#include <random>

class Bits {
    private:
        int bits[32];
    public:
        Bits() {
            for (int i = 0; i < 32; i++) {
                bits[i] = rand() % 2;
            }
        }

        void shift_left() {
            for (int i = 0; i < 31; i++) {
                bits[i] = bits[i + 1];
            }
            bits[31] = 0;
        }

        void shift_right() {
            for (int i = 31; i > 0; i--) {
                bits[i] = bits[i - 1];
            }
            bits[0] = 0;
        }
};

Bits bits = Bits();

void loop (int &bit) {
    int i;
    for (i = 0; i < bit; i++) {
        bits.shift_left();
    }
}

void ligarBit() {

}

void desligarBit() {

}

int main() {
    printf("Digite 1 para ligar ou 0 para desligar um bit: ");
    int op;
    scanf("%d", &op);
    printf("Digite o bit que deseja ligar/desligar: ");
    int bit;
    scanf("%d", &bit);

    loop(bit);

    if (op == 1) {
        ligarBit();
    } else {
        desligarBit();
    }

    return 0;
}