.data

input_array:
    .byte 0x11, 0x21, 0x41, 0x81, 0x12, 0x22, 0x42, 0x82, 0x14, 0x24, 0x44, 0x84, 0x18, 0x28, 0x48, 0x88
display_array: 
    .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71   # c�digos do 0 ao 9

.text
  li $s0, 0xFFFF0011  # endereco do display esquerdo
  li $s1, 0xffff0010  # endereco do display direito
  li $s2, 0xffff0012  # endere�o do selecionador
  li $s3, 0xffff0014  # endere�o da leitura do teclado
	
  li $t0, 0x3F   # passamos o valor que mostra 0 para o reg $t5
  sb $t0, 0($s0) # fazemos o display esquerdo sempre ser 0

loop: 

  li $t0, 1 # t0 armazena a contagem da linha, agora sendo 1
	
row:

  sb   $t0, 0($s2) 	       # armazena no selecionador a linha atual
  lb   $t1, 0($s3) 	       # armazena o valor recebido pelo teclado
  bne  $t1, $zero, key_pressed # se o valor n�o for 0, vai para o evento
  beq  $t0, 8, loop	       # se a linha estiver em 8 (ultima possivel) reinicia
  add  $t0, $t0, $t0 	       # t0 = 2^(2n)
  j    row
	
key_pressed: # tecla foi pressionada

  li $t2, 0 # contador para descobrir a tecla
	
key_search: # procura a tecla pressionada

  lb	$t3, input_array($t2)     # tecla atual
  beq	$t3, $t1, change_display  # se a tecla for a mesma pressionada, muda o display
  beq	$t2, 16, key_pressed	  # se o contador atingir o valor m�ximo, ele retorna para o inicio da contagem
  addi	$t2, $t2, 1		  # aumenta o contador
  j 	key_search		  # volta para o loop para verificar a proxima tecla

change_display:

  lb $t4, display_array($t2)	# $t4 recebe o valor o valor na posicao da tecla apertada
  sb $t4, 0($s1)		# muda o valor do display para a tela
  li $t5, 0 			# (re)inicia contador do delay

delay:				
  addi $t5, $t5, 1
  bne  $t5, 2000, delay # enquanto nao acaba o tmepo, continua no delay
  j loop		# continua o loop
