.data 

ENTRADA: .space 8

.text

main:

la $s0, ENTRADA

li $v0, 8
la $a0, ENTRADA
li $a1, 8
syscall

li $t0, 0 # i
li $t1, 7 # max

li $s1, 0 # count

loop:

beq $t0, $t1, end
lb $t3, ENTRADA($t0)
li $t2, 'a'
beq $t3, $t2, sum
addi $t0, $t0, 1
j loop

sum: 
addi $s1, $s1, 1
addi $t0, $t0, 1
j loop

end:

li $v0, 1
move $a0, $s1
syscall

li $v0, 10
syscall