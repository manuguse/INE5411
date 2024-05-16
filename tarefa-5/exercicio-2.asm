# Escreva um programa em linguagem Assembly do MIPS para ser executado no simulador MARS.
# Este programa dever? calcular o fatorial de um n?mero e deve atender ?s seguintes premissas:
# ? Receba via teclado o valor do n?mero a ser calculado o fatorial;
# ? Chame uma fun??o fatorial( ) - procedimento ? para calcular, de modo recursivo, o fatorial
# do n?mero; e
# ? Mostre o resultado na tela do computador.

# int fatorial(int n) {
#     if (n == 0) {
#         return 1;
#     } else {
#         return n * fatorial(n - 1);
#     }
# }

# int main() {
#     int n;
#     cout << "Digite um n?mero: ";
#     cin >> n;
#     cout << "O fatorial de " << n << " ? " << fatorial(n) << endl;
#     return 0;
# }

.data

    mensagem_input: .asciiz "Digite um numero: "
    mensagem_output: .asciiz "O fatorial do numero é: "

.text

main:

    # pede o valor do n?mero a ser calculado o fatorial
    # li $v0, 4
    # la $a0, mensagem_input
    # syscall

    # recebe o valor do n?mero a ser calculado o fatorial e armazena em $a0, que ? o primeiro argumento
    # li $v0, 5
    # syscall
    # move $a0, $v0

    li $a0, 12

    # chama a fun??o fatorial
    jal fatorial
    move $s0, $v0

    # mostra a mensagem com o resultado
    li $v0, 4
    la $a0, mensagem_output
    syscall

    # mostra o resultado
    move $a0, $s0
    li $v0, 1
    syscall

    # encerra o programa
    li $v0, 10
    syscall

fatorial:

    addi $sp, $sp, -8  # decrementa o ponteiro de pilha
    sw $ra, 0($sp)  # salva o endere?o de retorno
    sw $s0, 4($sp)  # salva o argumento n
    addi $v0, $zero, 1  # retorna 1
    bne $a0, $zero, fatorial_else  # se n != 0, ent?o vai para fatorial_else
    j fatorial_end

fatorial_else:

    move $s0, $a0  # salva o argumento n em $s0
    addi $a0, $a0, -1  # decrementa n
    jal fatorial  # chama a fun??o fatorial
    mul $v0, $s0, $v0  # retorna n * fatorial(n - 1)        

fatorial_end:
    
    lw $ra, 0($sp)  # restaura o endere?o de retorno
    lw $s0, 4($sp)  # restaura o argumento n
    addi $sp, $sp, 8  # incrementa o ponteiro de pilha
    jr $ra  # retorna para o endere?o de retorno
