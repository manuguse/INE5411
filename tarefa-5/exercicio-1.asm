# Escreva um programa em linguagem Assembly do MIPS para ser executado no simulador MARS.
# Este programa deverá calcular o fatorial de um número e deve atender às seguintes premissas:
# • Receba via teclado o valor do número a ser calculado o fatorial;
# • Efetue o cálculo do fatorial sem o uso de procedimentos; e
# • Mostre o resultado na tela do computador.

.data

    mensagem_input: .asciiz "Digite um numero: "
    mensagem_output: .asciiz "O fatorial do numero é: "

.text

main:

    # pede o valor do número a ser calculado o fatorial
    # li $v0, 4
    # la $a0, mensagem_input
    # syscall

    # recebe o valor do número a ser calculado o fatorial e armazena em $t0
    # li $v0, 5
    # syscall
    # move $t0, $v0
    
    li $t0, 12

    # inicializa o registrador $t1 com o valor 1
    li $t1, 0  # isso será o contador do loop

    # inicializa o registrador $t2 com o valor 1
    li $t2, 1  # isso será o fatorial do número

    # calcula o fatorial do número
    loop:
        addi $t1, $t1, 1    # i += 1
        mul $t2, $t2, $t1   # fatorial *= i
        bne $t1, $t0, loop  # se i != n, então repete o loop

    # mostra a mensagem do resultado
    li $v0, 4
    la $a0, mensagem_output
    syscall

    # mostra o valor do resultado
    li $v0, 1
    move $a0, $t2
    syscall
