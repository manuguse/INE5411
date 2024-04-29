.data 

ENTRADA: .space 8

.text

main:

la $s0, ENTRADA

li $v0, 8
la $a0, ENTRADA
li $a1, 8
syscall
