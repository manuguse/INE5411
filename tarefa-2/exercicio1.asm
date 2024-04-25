.data
  bytes_array: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F  # c�digos do 0 ao 9

.text

main:
  li $s0, 0xFFFF0011  # endereco do display esquerdo
  li $s1, 0xFFFF0010  # endereco do display direito

  li $t6, 0x3F   # passamos o valor que mostra 0 para o reg $t6
  sb $t6, 0($s0) # fazemos o display esquerdo sempre ser 0
  li $t0, 0x3F # escreve o c�digo no display direito
    
loop:

  li $a0, 0  # reinicia o �ndice do d�gito
  li $t0, 0x3F # escreve o c�digo no display direito
  sb $t0, 0($s1)

inner_loop:

  beq $a0, 9, loop
  addi $a0, $a0, 1    # incrementa o �ndice do d�gito
  lb $t0, bytes_array($a0) # carrega os valor na posi��o atual
  sb $t0, 0($s1)           # escreve o c�digo no display direito
  
  li $t1, 0           # carrega o valor inicial a ser utilizado no delay
  blt $a0, 9, delay  # loop de 0 a 9

delay:
  addi $t1, $t1, 1      # adiciona 1
  blt $t1, 0, delay  # blt at� chegar a 4096 it 
  j inner_loop
