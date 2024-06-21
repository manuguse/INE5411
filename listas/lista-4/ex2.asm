.data
a: .word 4
B: .word 10
val: .word 0

.text

main:

la $s0, a
la $s1, B
la $s2, val

lw $a0, 0($s0)
lw $a1, 0($s1)

jal calcula_area_quadrado
sw $v0, 0($s2)

li $v0, 10
syscall

calcula_area_quadrado:

mul $v0, $a0, $a1
jr $ra