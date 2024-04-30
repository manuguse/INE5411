.data

f: .word 0
g: .word 0
h: .word 0
i: .word 0
jj: .word 0

.text

main:

la $s0, g
la $s1, h
la $s2, i
la $s3, jj
la $s4, f

# lê valores

# g
li $v0, 5
syscall
sw $v0, 0($s0)

# h
li $v0, 5
syscall
sw $v0, 0($s1)

# i
li $v0, 5
syscall
sw $v0, 0($s2)

# i
li $v0, 5
syscall
sw $v0, 0($s3)

lw $a0, 0($s0)
lw $a1, 0($s1)
lw $a2, 0($s2)
lw $a3, 0($s3)

jal calcula

sw $v0, 0($s4)

li $v0, 10
syscall

calcula:

sw $ra, 0($sp)

add $t0, $a0, $a1
add $t1, $a2, $a3
sub $v0, $t0, $t1

lw $ra, 0($sp)

jr $ra
