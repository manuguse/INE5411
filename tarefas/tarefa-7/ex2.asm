# Similar ao exercício anterior, implemente um programa no MARS que percorrerá uma matriz inteira de
# 16 por 16 elementos, coluna após coluna, atribuindo aos elementos os valores de 0 a 255 na ordem. Para
# isso, seu programa deverá incluir o seguinte algoritmo:

# value = 0;
# for (col = 0; col < 16; col++) {
#     for (row = 0; row < 16; row++) {
#         data[row][col] = value++;
#     }
# }

.data
matrix: .space 1024  # (16*16*4 bytes)

.text

main:
    li $t0, 0          # inicializa com 0
    li $t1, 16         # numero pra multiplicacao (16)
    li $t2, 0          # inicializa col com 0

loop_col:
    beq $t2, $t1, end  # se col == 16, termina
    li $t3, 0          # inicializa row com 0

loop_row:
    beq $t3, $t1, next_col # se row == 16, vai pra proxima coluna
    mul $t4, $t3, $t1   # row * 16
    add $t4, $t4, $t2   # row * 16 + col
    sll $t4, $t4, 2     # (row * 16 + col) * 4
    la $t5, matrix      # endereco da matriz
    add $t5, $t5, $t4   # endereco da posicao atual
    sw $t0, 0($t5)      # armazena o valor atual
    addi $t0, $t0, 1    # incrementa o valor
    addi $t3, $t3, 1    # incrementa a row

    j loop_row

next_col:
    addi $t2, $t2, 1    # incrementa a col
    j loop_col

end:
    li $v0, 10
    syscall