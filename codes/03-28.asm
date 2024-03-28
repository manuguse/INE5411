# int a = 0, b = 5, c = 3;
# a = b + c

.data

	A: .word 0 # int a
	B: .word 5 # int b = 5
	C: .word 3 # int c = 3

.text

	# colocamos o end de A em $s0
	# la: load address; pseudo instrução (lui + ori)
	la $s0, A 
	la $s1, B
	la $s2, C 

	lw $t0, 0($s1) 
	lw $t1, 0($s2) 

	add $t2, $t0, $t1 # t2 = t0 + t1
 	sw  $t2, 0($s0)   # a = t2
 
 	# v0 = input() 	
	li   $v0, 5 # comando para ler inteiro
	syscall
	move $t0, $v0 # resultado é salvo em $t0

	# print(v0)
	li   $v0, 1      # carregamos o código de serviço 1 para imprimir inteiro
	addi $a0, $t0, 0 # carregamos o valor que está em $t0 em $a0
	syscall          # chamamos o sistema para imprimir o valor inteiro em $a0

	# print(12)
	li   $v0, 1 # sobrescrevemos 1 no v0
	addi $a0, $a0, 12 # valor a ser escrito
	syscall	
