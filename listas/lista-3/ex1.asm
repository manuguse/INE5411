.data

a: .word 10
b: .word 15
c: .word 20
d: .word 25
e: .word 30
f: .word 35

g: .word 0, 0, 0, 0
h: .word 0, 0, 0, 0

.text

lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e
lw $s5, f

la $s6, g
la $s7, h

add $t0, $s0, $s5
add $t1, $s1, $s2
sub $t2, $t0, $t1

sw  $t2, 0($s6)

sub $t0, $s0, $s1
sub $t1, $s1, $s2
mul $t2, $t0, $t1
sub $t3, $s4, $t2

sw $t3, 4($s6)

lw $t0, 4($s6)
sub $t1, $t0, $s2
sw $t1, 8($s6)

lw $t0, 0($s6)
lw $t1, 8($s6)
add $t2, $t1, $t0
sw $t2, 12($s6)

sub $t0, $s1, $s2
sw $t0, 0($s7)

add $t0, $s0, $s2
sw $t0, 4($s7)

sub $t0, $s1, $s2
lw $t1, 8($s6)
add $t2, $t0, $t1
sw $t2, 8($s7)

add $t0, $s1, $s3
lw $t1, 0($s6)
sub $t2, $t0, $t1
sw $t2, 12($s7)