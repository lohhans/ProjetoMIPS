.data
	arquivo: .asciiz "arquivo.txt"
	lido: .asciiz ""
.text


ler:
				#abrir arquivo
	addi $v0, $zero, 13
	la $a0, arquivo 	#armazena endereco do arquivo em $a0
	add $a1, $zero, 0       #valor 0 para apenas leitura do arquivo
	add $a2, $zero, $zero
	syscall
	
	add $t0, $v0, $zero
	
				#ler
	addi $v0, $zero, 14
	add $a0, $t0, $zero
	la $a1, lido 		#endereco para onde vai o que foi lido 
	addi $a2, $zero, 280 	#numero de caracteres para ler
	syscall
	
	add $t3, $v0, $zero 
				#fechar arquivo
	addi $v0, $zero, 16
	add $a0, $zero, $t0
	syscall
	
	jr $ra			#retorna a execucao para onde o metodo foi chamado
	
	
	
	addi $v0, $zero, 4
	la $a0, lido
	syscall
	
