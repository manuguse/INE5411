# int product(int a, int b) {
#    if (b == 0) {
#        return 0;
#    }
#    return a + product(a, b - 1);
# }

# int main() {
#     int a, b;
#     cin >> a >> b;
#     cout << product(a, b) << endl;
#     return 0;
# }

.data
    askInputA: .asciiz "insira A: "
    askInputB: .asciiz "insira B: "
    showResult: .asciiz "o produto é: "
    breakLine: .asciiz "\n"

.text

main:

    # pedimos para o usuário digitar o valor de A
    li $v0, 4
    la $a0, askInputA
    syscall

    # lemos o valor de A
    li $v0, 5
    syscall
    move $t0, $v0

    # pedimos para o usuário digitar o valor de B
    li $v0, 4
    la $a0, askInputB
    syscall

    # lemos o valor de B
    li $v0, 5
    syscall
    move $t1, $v0

    # chamamos a função product
    move $a0, $t0
    move $a1, $t1
    jal product

    # salvamos o resultado retornado em $t2
    move $t2, $v0

    # mostra texto do resultado
    li $v0, 4
    la $a0, showResult
    syscall
    
    # mostra o resultado em si
    move $a0, $t2
    li $v0, 1
    syscall

    # pulamos para o fim do programa
    j end

product:

    subi $sp, $sp, 4   # ajusta o ponteiro da pilha
    sw $ra, 0($sp)      # salva o endereço de retorno

    # verifica se b == 0
    beq $a1, $zero, base_case   # se for, pula para o caso base

    # caso recursivo (a + product(a, b - 1))
    subi $a1, $a1, 1   # decrementa b
    jal product         # chama a função recursivamente
    add $v0, $a0, $v0   # soma a com o resultado da chamada recursiva

    lw $ra, 0($sp)      # pega o endereço de retorno
    addi $sp, $sp, 4    # ajusta o ponteiro da pilha
    jr $ra              # retorna

base_case:
    
    # caso base (b == 0)
    li $v0, 0           # retorna 0
    lw $ra, 0($sp)      # pega o endereço de retorno
    addi $sp, $sp, 4    # ajusta o ponteiro da pilha
    jr $ra              # retorna

end:
    li $v0, 10
    syscall
