# int sum(int vector[], int n) {
#     if (n == 0) {
#         return 0;
#     }
#     return vector[n - 1] + sum(vector, n - 1);
# }

# int main() {
#     int n = 5;
#     int vector[n] = {11, 2, 3, 14, 15};
#     cout << sum(vector, n) << endl;
#     return 0;
# }

.data 
   
    vector: .word 13, 2, 33, 14, 142
    n: .word 5
    result: .asciiz "a soma é: "

.text

.globl main

    main:

        la $a1, vector
        lw $a0, n
        
        jal sum

        move $t0, $v0

        li $v0, 4
        la $a0, result
        syscall
        
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

    sum:

        addi $sp, $sp, -8   # aloca espaço na pilha
        sw $ra, 4($sp)      # salva o endereço de retorno
        sw $a1, 0($sp)      # salva o endereço de vector

        beq $a0, $zero, base_case # verifica se n == 0

        lw $t1, 0($a1)      # t1 = vector[i]
        addi $a1, $a1, 4    # a1 = &vector[i+1]
        addi $a0, $a0, -1   # n -= 1

        jal sum             # chama sum(vector, n - 1)

        lw $a1, 0($sp)      # endereço de vector
        lw $t1, 0($a1)      # vector[n - 1]
        add $v0, $t1, $v0   # arr[n - 1] + sum(arr, n - 1)
        add $t0, $t0, $v0  # t0 = &vector[n - 1] - 4


        lw $ra, 4($sp)      # pega o endereço de retorno
        addi $sp, $sp, 8    # ajusta o ponteiro da pilha
        jr $ra              # retorna

    base_case:

        # caso base (n == 0)
        lw $ra, 4($sp)    # pega o endereço de retorno
        addi $sp, $sp, 8  # ajusta o ponteiro da pilha
        jr $ra            # retorna

    end:

        li $v0, 0
        syscall
