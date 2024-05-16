.data

inputX: .asciiz " \n Digite o valor de x em graus: "
outputEX: .asciiz " \n Valor estimado de x: "

pi: .double 3.14159265358979323846
divider: .double 180.0

.text

.global main

main:

    li $v0, 4
    la $a0, inputX
    syscall

    li $v0, 7
    syscall

    la $t0, pi
    l.d $f10, 0($t0)

    mul.d $f0, $f0, $f10

    la $t0, divider
    l.d $f10, 0($t0)

    div.d $f0, $f0, $f10

    # valor de x em radianos armazenado em f0

    jal calcula_seno
    mov.d $f0, $f12

    # mostramos mensagem de valor estimado de x
    li $v0, 4
    la $a0, outputEX
    syscall

    # mostramos valor estimado de x
    li $v0, 3
    syscall

    li $v0, 10
    syscall

calcula_seno:
    # result = 0 = f14
    # XN = f0 = x
    # fac = 1 = f2
    # termo = xn/fac = f18
    # i = 0 = f4
    # n = 10 = f20

    li $t0, 0
    mtc1 $t0, $f14
    cvt.d.w $f14, $f14

    # xn = x
    mov.d $f24, $f0

    # x^2
    mul.d $f28, $f0, $f0  # x^2

    # fac = 1
    li $t0, 1
    mtc1 $t0, $f2
    cvt.d.w $f2, $f2

    # i = 1
    li $t0, 1
    mtc1 $t0, $f4
    cvt.d.w $f4, $f4
    
    # n max = 40
    li $t0, 40
    mtc1 $t0, $f20
    cvt.d.w $f20, $f20

    # f6 = 1
    li $t0, 1
    mtc1 $t0, $f6
    cvt.d.w $f6, $f6

    # f22 = 2
    li $t0, 2
    mtc1 $t0, $f22
    cvt.d.w $f22, $f22

    # t30 = -1
    li $t0, -1
    mtc1 $t0, $f30
    cvt.d.w $f30, $f30

    # t18 = xn/fac
    div.d $f18, $f0, $f2 # termo = xn/fac


loop_calcula_seno:

    c.le.d $f4, $f20            # se i <= n set 1
    bc1f end_loop_calcula_seno  # vai para o final do loop se i >= n

    add.d $f14, $f14, $f18      # result += termo

    add.d $f16, $f6, $f4 # temp = i + 1
    add.d $f8, $f22, $f4 # temp2 = i + 2
    mul.d $f6, $f16, $f8 # temp3 = (i + 1) * (i + 2)
    mul.d $f2, $f2, $f6 # fac = fac * (i + 1) * (i + 2)

    mul.d $f24, $f24, $f28 # xn *= x^2

    div.d $f18, $f24, $f2 # termo = xn/fac
    mul.d $f18, $f18, $f30 # termo *= -1

    add.d $f4, $f4, $f22 # i += 2

    j loop_calcula_seno

end_loop_calcula_seno:
    
    mov.d $f12, $f14
    jr $ra