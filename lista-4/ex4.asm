.data
n0: .word 0
n1: .word 0

tn0: .asciiz "\n Digite o valor do primeiro numero: "
tn1: .asciiz "\n Digite o valor do segundo numero: "
rs: .asciiz "\n O resultado da soma é: "

.text
main:
    la $s0, n0
    la $s1, n1

    jal soma

    li $v0, 4
    la $a0, rs
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall

read_input:

    li $v0, 4
    la $a0, tn0
    syscall

    # n0
    li $v0, 5
    syscall
    sw $v0, 0($s0)

    li $v0, 4
    la $a0, tn1
    syscall

    # n1
    li $v0, 5
    syscall
    sw $v0, 0($s1)
    
    jr $ra  # Retorna para a função chamadora

soma:
    addi $sp, $sp, -4   # ajusta o ponteiro da pilha
    sw $ra, 0($sp)      # salva o endereço de retorno

    jal read_input

    lw $a0, 0($s0)
    lw $a1, 0($s1)

    add $t0, $a0, $a1

    lw $ra, 0($sp)      # pega o endereço de retorno
    addi $sp, $sp, 4    # ajusta o ponteiro da pilha
    jr $ra              # retorna
