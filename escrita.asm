.data 
	file: .asciiz "escrita.txt"	#Nome do arquivo que vai ser criado caso não exista
	write: .asciiz "nao salva no diretorio certo"		#O que vai ser escrito dentro do arquivo

.text 

	addi $v0, $zero, 13		#Abrir arquivo
	la $a0, file			#Carregando o arquivo
	addi $a1, $zero, 1		#Flag 1 == modo escrita
	add $a2, $zero, $zero		#Modo ignorado
	syscall				#Metodo para abrir arquivo
			
	add $t0, $v0, $zero		#Armazenando v0 no registrador t0
	
	addi $v0, $zero, 15		#Escrevendo no arquivo
	add $a0, $t0, $zero		#Carregando o arquivo
	la $a1, write			#O que vai ser escrito
	addi $a2, $zero, 280		#Numero de caracteres a serem escritos
	syscall				#Metodo para escrever no arquivo
	
	add $t1, $v0, $zero		#Armazenando v0 no registrador t0
	
	addi $v0, $zero, 16		#Fechando arquivo
	la $a0, file			#Carregando o arquivo
	syscall				#Metodo para fechar arquivo
