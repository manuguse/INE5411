.data
.align 4
    .eqv MAX 8
    .eqv DATA_SIZE 4
    .eqv LENGTH 64
    matrix_a: .word 1:LENGTH
    matrix_b: .word 1:LENGTH

.text

main:
    li $t0, 0          # inicializa com 0
    li $t2, 0          # inicializa row com 0

    la $s0, matrix_a
    la $s1, matrix_b

fill_matrix:

    loop_row:
        beq $t2, MAX, end_fill_matrix  # se row == 16, termina
        li $t3, 0          # inicializa col com 0

    loop_col:
        beq $t3, MAX, next_row  # se col == 16, vai pra pr�xima linha
        mul $t4, $t2, MAX       # row * 16
        add $t4, $t4, $t3       # (row * 16) + col
        sll $t4, $t4, 2         # (row * 16 + col) * 4 (tamanho do int)

        add $t5, $s0, $t4       # endere�o de matrix[row][col]
        sw $t0, 0($t5)          # matrix[row][col] = value

        add $t5, $s1, $t4       # endere�o de matrix[row][col]
        sw $t0, 0($t5)          # matrix[row][col] = value

        addi $t3, $t3, 1        # col++
        addi $t0, $t0, 1        # value++

        j loop_col              # proxima coluna

    next_row:
        addi $t2, $t2, 1        # row++
        j loop_row              # proxima linha

end_fill_matrix:
    j make_operations

make_operations:
    li $t0, 0 # i = 0
    li $t1, 0 # j = 0

    loop_row_op:

        bge $t0, MAX, end_loop_row_op
        li $t1, 0 # j = 0

        loop_col_op:
            bge $t1, MAX, end_loop_col_op

            mul $t2, $t0, MAX
            add $t2, $t2, $t1
            mul $t2, $t2, DATA_SIZE
            add $t2, $s0, $t2

            mul $t3, $t1, MAX
            add $t3, $t3, $t0
            mul $t3, $t3, DATA_SIZE
            add $t3, $s1, $t3

            lw $t4, 0($t2)
            lw $t5, 0($t3)
            add $t6, $t4, $t5
            sw $t6, 0($t2)

            addi $t1, $t1, 1 # j++
            j loop_col_op    # proxima coluna

    end_loop_col_op:
            addi $t0, $t0, 1 # j++
            j loop_row_op    # proxima coluna

end_loop_row_op:
    j end_make_operations

end_make_operations:
    j end

end:
    li $v0, 10
    syscall