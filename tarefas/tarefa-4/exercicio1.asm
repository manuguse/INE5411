.data 
     fp1: .float 1
     fp2: .float 2

    inputX: .asciiz " Digite o valor de x: "
    inputN: .asciiz " Digite o valor de n: "
    outputEstimativa: .asciiz " Estimativa final: "
    outputReal: .asciiz "\n Valor real: "
    outputErro: .asciiz "\n Erro: "

.text

    # pede o valor de x
    li $v0, 4
    la $a0, inputX
    syscall

    # recebe o valor de x em $f0 e mudamos para $f1
    li $v0, 6
    syscall
    mov.s $f1, $f0

    # pede o valor de n
    li $v0, 4
    la $a0, inputN
    syscall

    # recebe o valor de n em $v0 e mudamos para $s0
    li $v0, 5
    syscall
    move $s0, $v0

    jal raiz_quadrada

    # imprime o texto da estimativa final
    li $v0, 4
    la $a0, outputEstimativa
    syscall

    # imprime o valor da estimativa final
    li $v0, 2
    mov.s $f3 $f12
    syscall


    # imprime o texto do valor real
    li $v0, 4
    la $a0, outputReal
    syscall

    # imprime o valor real
    li $v0, 2
    sqrt.s $f12, $f1
    syscall
    mov.s $f4 $f12

    # imprime o texto do erro
    li $v0, 4
    la $a0, outputErro
    syscall
    
    # imprime o erro
    li $v0, 2
    sub.s $f12, $f3, $f4
    syscall

    # encerra o programa
    li $v0, 10
    syscall


raiz_quadrada:

    # inicializa i com 1
    li $t2, 1

    l.s $f3, fp1 # estimativa
    l.s $f4, fp2
    
    # inicia o loop
    j loop_raiz_quadrada

loop_raiz_quadrada:

    # verifica se i é igual a n
    beq $t2, $s0, fim_raiz_quadrada

    # div = x / estimativa
    div.s  $f5, $f1, $f3

    # soma = div + estimativa
    add.s $f3, $f3, $f5

    # estimativa = soma / 2
    div.s $f3, $f3, $f4

    # incrementa i
    addi $t2, $t2, 1

    j loop_raiz_quadrada

fim_raiz_quadrada:
    
    mov.s $f12, $f3
    jr $ra
