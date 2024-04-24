# a = b + 35;
# c = d – a + e

.data
	a: .asciiz "a) "
	c: .asciiz "c) "
	
	newline: .asciiz "\n"
	ib: .asciiz "insira o valor de b: "
	
	va: .word 0 
	vb: .word 0 
	vc: .word 0
	vd: .word 12
	ve: .word 31

.text
	la $t0, va
	la $t1, vb
	la $t2, vc
	la $t3, vd
	la $t4, ve
	
	# printamos "insira o valor de b "
	li $v0, 4
	la $a0, ib
	syscall
	
	# recebemos o valor de b
	li $v0, 5
	syscall
	move $s0, $v0

	sw $s0, 0($t1) # b
	lw $s1, 0($t3) # d
	lw $s2, 0($t4) # e
	
	addi $t5, $s0, 35 # a = b + 35
	add $t6, $s1, $s2 # t = d + e
	sub $t6, $t6, $t5 # c = t - a
	
	sw $t5, 0($t0) # armazenando o valor de t5 em t0 (a)
	sw $t6, 0($t2) # armazenando o valor de t6 em t2 (c)
	
	# carregando va e vc para comprovar a funcionalidade, 
	# apesar de ser mantido o mesmo valor
	lw $t3, 0($t0)
	lw $t4, 0($t2)
	
	# printamos "a) "
	li $v0, 4
	la $a0, a
	syscall
	
	# printamos o resultado de a
	li $v0, 1 
	move $a0, $t3 
	syscall
	
	# quebramos a linha
	li $v0, 4       
	la $a0, newline
	syscall
	
	# printamos "c) "
	li $v0, 4
	la $a0, c
	syscall
	
	# printamos o resultado de c
	li $v0, 1 
	move $a0, $t4
	syscall
