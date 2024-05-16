# Escreva um programa em linguagem Assembly do MIPS para ser executado no simulador MARS.
# Este programa dever� calcular o fatorial de um n�mero e deve atender �s seguintes premissas:
# � Receba via teclado o valor do n�mero a ser calculado o fatorial;
# � Efetue o c�lculo do fatorial sem o uso de procedimentos; e
# � Mostre o resultado na tela do computador.

.data

    mensagem_input: .asciiz "Digite um numero: "
    mensagem_output: .asciiz "O fatorial do numero �: "

.text

main:

    # pede o valor do n�mero a ser calculado o fatorial
    # li $v0, 4
    # la $a0, mensagem_input
    # syscall

    # recebe o valor do n�mero a ser calculado o fatorial e armazena em $t0
    # li $v0, 5
    # syscall
    # move $t0, $v0
    
    li $t0, 12

    # inicializa o registrador $t1 com o valor 1
    li $t1, 0  # isso ser� o contador do loop

    # inicializa o registrador $t2 com o valor 1
    li $t2, 1  # isso ser� o fatorial do n�mero

    # calcula o fatorial do n�mero
    loop:
        addi $t1, $t1, 1    # i += 1
        mul $t2, $t2, $t1   # fatorial *= i
        bne $t1, $t0, loop  # se i != n, ent�o repete o loop

    # mostra a mensagem do resultado
    li $v0, 4
    la $a0, mensagem_output
    syscall

    # mostra o valor do resultado
    li $v0, 1
    move $a0, $t2
    syscall
