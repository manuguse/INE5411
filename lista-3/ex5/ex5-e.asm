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

blt $s2, $s3, sum

addi $s3, $s3, 1
sw $s3, 0($s1)

j end

sum:
addi $s2, $s2, 1
sw $s2, 0($s0)

end:
li $v0, 10
syscall
