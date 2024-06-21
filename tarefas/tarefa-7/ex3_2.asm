.data
matrix: .space 262144  # (16*16*4 bytes)

.text

main:
    li $t0, 0
    li $t1, 256
    li $t2, 0

loop_col:
    beq $t2, $t1, end
    li $t3, 0

loop_row:
    beq $t3, $t1, next_col
    mul $t4, $t3, $t1
    add $t4, $t4, $t2
    sll $t4, $t4, 2
    la $t5, matrix
    add $t5, $t5, $t4
    sw $t0, 0($t5)
    addi $t0, $t0, 1
    addi $t3, $t3, 1

    j loop_row

next_col:
    addi $t2, $t2, 1
    j loop_col

end:
    li $v0, 10
    syscall