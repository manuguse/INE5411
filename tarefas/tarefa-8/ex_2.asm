.data
.align 4
    .eqv MAX 8
    .eqv DATA_SIZE 4
    .eqv LENGTH 64
    .eqv BLOCK_SIZE 8
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

    loop_for_1:
        bge $t0, MAX, end_loop_for_1
        li $t1, 0 # j = 0

        loop_for_2:
            bge $t1, MAX, end_loop_for_2
            addi $t2, $t0, 0 # ii = i

            loop_for_3:
                add $t9, $t0, BLOCK_SIZE # t9 = i + BLOCK_SIZE
                bge $t2, $t9, end_loop_for_3 # se ii == i + BLOCK_SIZE, termina
                addi $t3, $t1, 0 # jj = j 

                loop_for_4:
                    add $t9, $t1, BLOCK_SIZE # t9 = j + BLOCK_SIZE
                    bge $t3, $t9, end_loop_for_4 # se jj == j + BLOCK_SIZE, termina

                    # A[ii, jj] = A[ii, jj] + B[jj, ii]
                    mul $t4, $t2, MAX
                    add $t4, $t4, $t3
                    mul $t4, $t4, DATA_SIZE
                    add $t4, $s0, $t4

                    mul $t5, $t3, MAX
                    add $t5, $t5, $t2
                    mul $t5, $t5, DATA_SIZE
                    add $t5, $s1, $t5

                    lw $t6, 0($t4)
                    lw $t7, 0($t5)
                    add $t8, $t6, $t7
                    sw $t8, 0($t4)

                    addi $t3, $t3, 1 # jj++
                    j loop_for_4 # proxima coluna

                end_loop_for_4:
                    addi $t2, $t2, 1 # ii++
                    j loop_for_3 # proxima linha

            end_loop_for_3:
                addi $t1, $t1, BLOCK_SIZE # j += BLOCK_SIZE
                j loop_for_2 # proxima linha

        end_loop_for_2:
            addi $t0, $t0, BLOCK_SIZE # i += BLOCK_SIZE
            j loop_for_1 # proxima linha

    end_loop_for_1:
        j end_make_operations

end_make_operations:
    j end

end:
    li $v0, 10
    syscall
