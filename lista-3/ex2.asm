.text

main:

li $t0, 1
li $t1, 5
add $t2, $t0, $t1
li $s0, 0

loop:

add $s0, $s0, $t0
addi $t0, $t0, 1
bne $t0, $t2, loop
