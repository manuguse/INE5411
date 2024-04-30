.data

base: .word 0
expoent: .word 0

.text

main:

la $s0, base
la $s1, expoent
# lê valores

# a
li $v0, 5
syscall
sw $v0, 0($s0)

# b
li $v0, 5
syscall
sw $v0, 0($s1)

lw $a0, 0($s0)
lw $a1, 0($s1)

jal pow

move $v0, $a0

li $v0, 1
syscall

li $v0, 10
syscall

pow:

    li $t1, 1        # Inicializa o resultado como 1
    li $t0, 0        # Inicializa o contador como 0

pow_loop:

    addi $sp, $sp, -4   # Ajusta o ponteiro da pilha
    sw $ra, 0($sp)      # Salva o endereço de retorno

    blt $t0, $a1, loop_continue  # Verifica se o contador é menor que o expoente
    j end_loop

loop_continue:

    mul $t1, $t1, $a0   # Multiplica o resultado pelo valor da base
    addi $t0, $t0, 1    # Incrementa o contador

    j pow_loop

end_loop:

    move $a0, $t1       # Move o resultado para $a0, que é usado para retornar valores

    lw $ra, 0($sp)      # Pega o endereço de retorno
    addi $sp, $sp, 4    # Ajusta o ponteiro da pilha
    jr $ra              # Retorna