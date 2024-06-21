.data
A: .word 1
B: .word 2

.text

la $s0, A
la $s1, B

lw $s3, A
lw $s4, B

li $t0, 0
li $t1, 5

loop:
bge $t0, $t1, end
addi $s3, $s4, 1
addi $s4, $s4, 3
addi $t0, $t0, 1
j loop

end:
sw $s3, 0($s0)
sw $s4, 0($s1)
li $v0, 10
syscall
