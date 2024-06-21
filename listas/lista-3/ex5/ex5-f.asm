.data
A: .word 0
B: .word 0
C: .word 5

.text

la $s0, A
la $s1, B

lw $s3, A
lw $s4, B
lw $s5, C

loop:
bge $s3, $s5, end
addi $s3, $s3, 1
addi $s4, $s4, 2
j loop

end:
sw $s3, 0($s0)
sw $s4, 0($s1)
li $v0, 10
syscall
