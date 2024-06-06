# Implemente um programa no MARS que percorrer√° uma matriz inteira de 16 por 16 elementos, linha
# ap√≥s linha, atribuindo aos elementos os valores de 0 a 255 na ordem. Para isso, seu programa dever√°
# incluir o seguinte algoritmo:

# value = 0;
# for (row = 0; row < 16; row++) {
#     for (col = 0; col < 16; col++) {
#         data[row][col] = value++;
#     }
# }

.data
matrix: .space 1024  # (16*16*4 bytes)

.text

main:
    li $t0, 0          # inicializa com 0
    li $t1, 16         # numero pra multiplicacao (16)
    li $t2, 0          # inicializa row com 0

loop_row:
    beq $t2, $t1, end  # se row == 16, termina
    li $t3, 0          # inicializa col com 0

loop_col:
    beq $t3, $t1, next_row  # se col == 16, vai pra prÛxima linha
    mul $t4, $t2, $t1       # row * 16
    add $t4, $t4, $t3       # (row * 16) + col
    sll $t4, $t4, 2         # (row * 16 + col) * 4 (tamanho do int)
    la $t5, matrix          # endereÁo base da matriz
    add $t5, $t5, $t4       # endereÁo de matrix[row][col]
    sw $t0, 0($t5)          # matrix[row][col] = value
    addi $t3, $t3, 1        # col++
    addi $t0, $t0, 1        # value++

    j loop_col              # proxima coluna

next_row:
    addi $t2, $t2, 1        # row++
    j loop_row              # proxima linha

end:
    li $v0, 10
    syscall