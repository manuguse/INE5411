.data
A: .word 0
B: .word 0

.text

la $s0, A
la $s1, B

li $v0, 5
syscall
sw $v0, 0($s0)

li $v0, 5
syscall
sw $v0, 0($s1)

lw $s2, A
lw $s3, B

bge $s2, $s3, sum

sum:
addi $s3, $s3, 1
sw $s3, 0($s1)

end:
li $v0, 10
syscall
