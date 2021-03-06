.data

#Menu-tela
	labelInicial: .asciiz "Seja bem vindo!\nEscolha uma das opções abaixo:\n1 - Aluno\n2 - Funcionário\n3 - Modalidade\n4 - Avaliação\n\n"
	labelAluno: .asciiz "Aluno\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelFuncionario: .asciiz "Funcionário\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelModalidade: .asciiz "Modalidade\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelAvaliacao: .asciiz "Avaliação\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	mensagemDeErro: .asciiz "Operação inválida!"
	mensagemDeSucesso: .asciiz "Operação realizada com sucesso!"

#Aluno-tela
	labelCadastrarAluno: .asciiz "Cadatrar aluno\n"
	labelEditarAluno: .asciiz "Editar aluno\n"
	labelBuscarAluno: .asciiz "Buscar aluno\n"
	labelRemoverAluno: .asciiz "Remover aluno\n"
	
#Funcionario-tela
	labelCadastrarFuncionario: .asciiz "Cadatrar funcionario\n"
	labelEditarFuncionario: .asciiz "Editar funcionario\n"
	labelBuscarFuncionario: .asciiz "Buscar funcionario\n"
	labelRemoverFuncionario: .asciiz "Remover funcionario\n"
	
#Modalidade-tela
	labelCadastrarModalidade: .asciiz "Cadatrar modalidade\n"
	labelEditarModalidade: .asciiz "Editar modalidade\n"
	labelBuscarModalidade: .asciiz "Buscar modalidade\n"
	labelRemoverModalidade: .asciiz "Remover modalidade\n"
	
#Avaliacao-tela
	labelCadastrarAvaliacao: .asciiz "Cadatrar avaliação\n"
	labelEditarAvaliacao: .asciiz "Editar avaliação\n"
	labelBuscarAvaliacao: .asciiz "Buscar avaliação\n"
	labelRemoverAvaliacao: .asciiz "Remover avaliação\n"
	
#Informacao aluno
	labelNome: .asciiz "Digite o nome abaixo:\n"
	labelCpf: .asciiz "Digite o CPF corretamente abaixo:\n"
	labelIdade: .asciiz "Digite a idade abaixo:\n"
	labelEndereco: .asciiz "Digite o endereço completo abaixo:\n"
	
#Informacao funcionario (extende alguns de aluno)
	labelCargoFunc: .asciiz "Digite o cargo do funcionário abaixo:\n" 
	
#Informacao modalidade (extende alguns de aluno)
	labelOrientador: .asciiz "Digite o nome do orientador abaixo:\n"
	labelTurno: .asciiz "Digite o turno da modalidade:\n"
	labelValor: .asciiz "Digite o valor referente a modalidade abaixo:\n"

#Informacao avaliacao
	labelNomeAluno: .asciiz "Digite o nome do aluno:\n"
	labelCircunferenciaAbdominal: .asciiz "Digite a circunferência abdominal do aluno:\n" 
	labelTorax: .asciiz "Digite a medida do tórax do aluno:\n"
	labelCintura: .asciiz "Digite a medida da cintura do aluno:\n"
	labelQuadril: .asciiz "Digite a medida do quadril do aluno:\n"
	labelBracoDireito: .asciiz "Digite a medida do braço direito do aluno:\n"
        labelBracoEsquerdo: .asciiz "Digite a medida do braço esquerdo do aluno:\n"
	labelCoxaDireita: .asciiz "Digite a medida da coxa direita do aluno:\n"
        labelCoxaEsquerda: .asciiz "Digite a medida da coxa esquerda do aluno:\n"

#Criando arquivos
	arquivoAluno: .asciiz "arquivo_aluno.txt"	
	arquivoFuncionario: .asciiz "arquivo_funcionario.txt"
	arquivoModalidade: .asciiz "arquivo_modalidade.txt"
	arquivoAvaliacao: .asciiz "arquivo_avaliacao.txt"

#Auxiliares	
        labelVazia: .asciiz "                              "
	
#Campos Aluno
	nomeAluno: .space 30
	cpfAluno: .space 30
	idadeAluno: .space 30
	enderecoAluno: .space 30
		
#Campos Funcionario
	nomeFuncionario: .space 30
	cpfFuncionario: .space 30
	enderecoFuncionario: .space 30
	cargoFuncionario: .space 30

#Campos Modalidade
	nomeModalidade: .space 30
	nomeOrientador: .space 30
	turnoModalidade: .space 30
	valorModalidade: .space 30	

#Campos Avaliacao
	nomeAlunoAvaliacao: .space 30
	abdomen: .space 30
	torax: .space 30
	cintura: .space 30
	quadril: .space 30
	bracoDir: .space 30
	bracoEsq: .space 30
	coxaDir: .space 30
	coxaEsq: .space 30
	
.text

######################################## Tela inicial #####################################################################

index:

	la $t0, labelInicial 	#Carrega texto labelInicial
	la $t3, index		#Grava endereço da label em que esta
	jal opcao		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 5	#Parâmetro pra saber se a opção escolhida é menor que 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionar

	j sair			#Fim da execução

############################################## Auxiliares ##########################################################

opcao:
	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
	la $a0, ($t0)		#Carregando o "texto" da tela de escolha
	syscall			#Syscall da tela
	jr $ra			#Fim da função

printf:
	add $v0, $zero, $t0	#Escolha do tipo de tela do printf
	syscall			#Chamada da tela
	jr $ra			#Fim da função
	

opcaoString:
	
	addi $v0, $zero, 54	#syscal que recebe string
	addi $t5, $zero, 0	# zero t5		
	#la $a1, dadoRecebido	#salva o dado recebido na label dadoRecebido
	addi $a2, $zero, 30	#tamanho da string
	syscall	
	jr $ra

operacaoBemSucedida:

	addi $v0, $zero, 55		#Configurando a syscall para lançar tela de escolha
	la $a0, mensagemDeSucesso	#Carregando o "texto" da tela de escolha
	syscall				#Syscall da tela
	j index				#Fim da função

######################################## Vericações #######################################################################

verifica:
	
	beq $a1, -1, dadosInvalidos	#Caso dado seja inválido redireciona
	beq $a1, -2, sair		#Clicou em cancelar e sai do programa
	beq $a1, -3, dadosInvalidos	#Caso dado seja inválido redireciona
	
	ble $a0, $t1, dadosInvalidos	#Caso o que recebi($a0) é menor ou igual ao $t1
	bge $a0, $t2, dadosInvalidos	#Caso o que recebi($a0) é maior ou igual ao $t2
	
	addi  $t1, $zero, 0		#Zerar $t1
	addi  $t2, $zero, 0		#Zerar $t2
	
	jr $ra				#Se não houver erro, o programa continua executando

dadosInvalidos:

	addi $a1, $zero, 2	#Escolhendo tela de erro
	la $a0, mensagemDeErro	#Carregando a label que diz o erro
	addi $t0, $zero, 55	#Escolhendo a tela de mensagens
	addi  $t1, $zero, 0	#Zerar $t1
	addi  $t2, $zero, 0	#Zerar $t2
	jal printf		#Chamando o print [ printf( error) ]
	jr $t3			#Fim do tratamento da exceção, retorna a tela que estava

######################################## Redirecionamento #################################################################

redirecionar:

	beq $a0, 1, opcoesAluno		#Menu do aluno
	beq $a0, 2, opcoesFuncionario	#Menu do funcionário
	beq $a0, 3, opcoesModalidade	#Menu da modalidade
	beq $a0, 4, opcoesAvaliacao	#Menu da menslidade

redirecionarAluno:

	beq $a0, 1, cadastrarAluno	# tela de cadastrar aluno
	beq $a0, 2, editarAluno		# tela de editar aluno
	beq $a0, 3, buscarAluno		# tela de buscar aluno
	beq $a0, 4, removerAluno	# tela de remover aluno

redirecionarFuncionario:

	beq $a0, 1, cadastrarFuncionario	# tela de cadastrar funcionário
	beq $a0, 2, editarFuncionario		# tela de editar funcionário
	beq $a0, 3, buscarFuncionario		# tela de buscar funcionário
	beq $a0, 4, removerFuncionario		# tela de remover funcionário

redirecionarModalidade:

	beq $a0, 1, cadastrarModalidade		# tela de cadastrar Modalidade
	beq $a0, 2, editarModalidade		# tela de editar Modalidade
	beq $a0, 3, buscarModalidade		# tela de buscar Modalidade
	beq $a0, 4, removerModalidade		# tela de remover Modalidade

redirecionarAvaliacao:

	beq $a0, 1, cadastrarAvaliacao		# tela de cadastrar Avaliacao
	beq $a0, 2, editarAvaliacao		# tela de editar Avaliacao
	beq $a0, 3, buscarAvaliacao		# tela de buscar Avaliacao
	beq $a0, 4, removerAvaliacao		# tela de remover Avaliacao

######################################## Telas referentes a Aluno #####################################################

opcoesAluno:

	la $t0, labelAluno	#Carrega a label do aluno
	la $t3, opcoesAluno	#Grava endereço da label em que esta
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionarAluno
	

cadastrarAluno:
	
	la $a0, arquivoAluno	#Coloca em a0 o endereço do arquivo
	jal abrirArquivo	#Abre o arquivo
		 
				#PARA NOME
	la $a0, labelNome	#Guarda o endereço da label em t0
	la $a1, nomeAluno
	jal opcaoString		#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, nomeAluno
	jal escrever		#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
				#PARA CPF
	la  $a0, labelCpf	#Guarda o endereço da label em t0
	la $a1, cpfAluno
	jal opcaoString		#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, cpfAluno
	jal escrever		#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
				#PARA IDADE
	la $a0, labelIdade	#Guarda o endereço da label em t0
	la $a1, idadeAluno
	jal opcaoString		#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, idadeAluno
	jal escrever		#Chama a label de salvar em arquivo
	jal esvaziarLabel

				#PARA ENDEREÇO
	la $a0, labelEndereco	#Guarda o endereço da label em t0
	la $a1, enderecoAluno
	jal opcaoString		#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, enderecoAluno
	jal escrever		#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
	la $a0, arquivoAluno	#Coloca em a0 o endereço do arquivo
	jal fecharArquivo

	j operacaoBemSucedida
	
editarAluno: #Não foi possivel implementar, não conseguimos ler o arquivo e editar
	
	la $t0, labelEditarAluno # Carrega a label
	la $t3, editarAluno	 #Grava endereço da label em que esta
	jal opcao
	
buscarAluno: #Não foi possivel implementar, não conseguimos ler o arquivo e printar

	la $t0, labelBuscarAluno # Carrega a label
	la $t3, buscarAluno	 #Grava endereço da label em que esta
	jal opcao

removerAluno: #Não foi possivel implementar, não conseguimos ler o arquivo e remover
	
	la $t0, labelRemoverAluno # Carrega a label
	la $t3, removerAluno	  #Grava endereço da label em que esta
	jal opcao

######################################## Telas referentes a Funcionario #####################################################

opcoesFuncionario:

	la $t0, labelFuncionario	#Carrega o menu do funcionário
	la $t3, opcoesFuncionario	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4		#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionarFuncionario

cadastrarFuncionario:

	la $a0, arquivoFuncionario	#Coloca em a0 o endereço do arquivo
	jal abrirArquivo		#Abre o arquivo
		 
					#PARA NOME
	la $a0, labelNome		#Guarda o endereço da label em t0
	la $a1, nomeFuncionario
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, nomeFuncionario
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
				
					#PARA CPF
	la  $a0, labelCpf		#Guarda o endereço da label em t0
	la $a1, cpfFuncionario
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, cpfFuncionario
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
					#PARA ENDEREÇO
	la $a0, labelEndereco		#Guarda o endereço da label em t0
	la $a1, enderecoFuncionario
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, enderecoFuncionario
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
								
					#PARA CARGO
	la $a0, labelCargoFunc		#Guarda o endereço da label em t0
	la $a1, cargoFuncionario
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, cargoFuncionario
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
	la $a0, arquivoFuncionario	#Coloca em a0 o endereço do arquivo
	jal fecharArquivo

	j operacaoBemSucedida

editarFuncionario:  #Não foi possivel implementar, não conseguimos ler o arquivo e editar

	la $t0, labelEditarFuncionario 	# Carrega a label
	la $t3, editarFuncionario	#Grava endereço da label em que esta
	jal opcao

buscarFuncionario:  #Não foi possivel implementar, não conseguimos ler o arquivo e printar

	la $t0, labelBuscarFuncionario 	# Carrega a label
	la $t3, buscarFuncionario	#Grava endereço da label em que esta
	jal opcao

removerFuncionario:  #Não foi possivel implementar, não conseguimos ler o arquivo e remover

	la $t0, labelRemoverFuncionario # Carrega a label
	la $t3, removerFuncionario	#Grava endereço da label em que esta
	jal opcao

######################################## Telas referentes a Modalidade #####################################################

opcoesModalidade:

	la $t0, labelModalidade		#Carrega o menu da modalidade
	la $t3, opcoesModalidade	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4		#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionarModalidade

cadastrarModalidade:
		
	la $a0, arquivoModalidade	#Coloca em a0 o endereço do arquivo
	jal abrirArquivo		#Abre o arquivo
		 
					#PARA NOME
	la $a0, labelNome		#Guarda o endereço da label em t0
	la $a1, nomeModalidade
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, nomeModalidade
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
				
					#PARA ORIENTADOR
	la  $a0, labelOrientador	#Guarda o endereço da label em t0
	la $a1, nomeOrientador
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, nomeOrientador
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
					
					#PARA TURNO
	la  $a0, labelTurno		#Guarda o endereço da label em t0
	la $a1, turnoModalidade
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, turnoModalidade
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
					#PARA VALOR
	la $a0, labelValor		#Guarda o endereço da label em t0
	la $a1, valorModalidade
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, valorModalidade
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
	la $a0, arquivoModalidade	#Coloca em a0 o endereço do arquivo
	jal fecharArquivo

	j operacaoBemSucedida

editarModalidade: #Não foi possivel implementar, não conseguimos ler o arquivo e editar

	la $t0, labelEditarModalidade 	# Carrega a label
	la $t3, editarModalidade	#Grava endereço da label em que esta
	jal opcao
	
buscarModalidade: #Não foi possivel implementar, não conseguimos ler o arquivo e printar

	la $t0, labelBuscarModalidade 	# Carrega a label
	la $t3, buscarModalidade	#Grava endereço da label em que esta
	jal opcao
	
removerModalidade: #Não foi possivel implementar, não conseguimos ler o arquivo e remover

	la $t0, labelRemoverModalidade 	# Carrega a label
	la $t3, removerModalidade	#Grava endereço da label em que esta
	jal opcao

######################################## Telas referentes a Avaliacao #####################################################

opcoesAvaliacao:

	la $t0, labelAvaliacao	#Carrega o menu da avaliação
	la $t3, opcoesAvaliacao	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 2		#Parâmetro pra saber se a opção escolhida é menor ou igual a 2
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 2 [ verificacao(0, 2) ]
	j redirecionarAvaliacao


cadastrarAvaliacao:
		
	la $a0, arquivoAvaliacao	#Coloca em a0 o endereço do arquivo
	jal abrirArquivo		#Abre o arquivo
		 
					#PARA NOME
	la $a0, labelNomeAluno		#Guarda o endereço da label em t0
	la $a1, nomeAlunoAvaliacao
	jal opcaoString			#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, nomeAlunoAvaliacao
	jal escrever			#Chama a label de salvar em arquivo
	jal esvaziarLabel
				
						#PARA CIRCUNF ABDOMINAL
	la  $a0, labelCircunferenciaAbdominal	#Guarda o endereço da label em t0
	la $a1, abdomen
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, abdomen
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
						#PARA TORAX
	la  $a0, labelTorax			#Guarda o endereço da label em t0
	la $a1, torax
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, torax
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel
					
						#PARA CINTURA
	la  $a0, labelCintura			#Guarda o endereço da label em t0
	la $a1, cintura
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, cintura
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
						#PARA QUADRIL
	la  $a0, labelQuadril			#Guarda o endereço da label em t0
	la $a1, quadril
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, quadril
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel	

						#PARA BRAÇO DIREITO	
	la  $a0, labelBracoDireito		#Guarda o endereço da label em t0
	la $a1, bracoDir
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, bracoDir
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel

						#PARA BRAÇO ESQUERDO	
	la  $a0, labelBracoEsquerdo		#Guarda o endereço da label em t0
	la $a1, bracoEsq
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, bracoEsq
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
						#PARA COXA COXA DIREITA	
	la  $a0, labelCoxaDireita		#Guarda o endereço da label em t0
	la $a1, coxaDir
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, coxaDir
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel

						#PARA COXA COXA ESQUERDA	
	la  $a0, labelCoxaEsquerda		#Guarda o endereço da label em t0
	la $a1, coxaEsq
	jal opcaoString				#Chama a tela de inserir string
	add $a0, $zero, $s0
	la $a1, coxaEsq
	jal escrever				#Chama a label de salvar em arquivo
	jal esvaziarLabel
	
	la $a0, arquivoAvaliacao	#Coloca em a0 o endereço do arquivo
	jal fecharArquivo

	j operacaoBemSucedida
	

editarAvaliacao: #Não foi possivel implementar, não conseguimos ler o arquivo e editar

	la $t0, labelEditarAvaliacao 	# Carrega a label
	la $t3, editarAvaliacao		#Grava endereço da label em que esta
	jal opcao
	
buscarAvaliacao: #Não foi possivel implementar, não conseguimos ler o arquivo e printar

	la $t0, labelBuscarAvaliacao 	# Carrega a label
	la $t3, buscarAvaliacao		#Grava endereço da label em que esta
	jal opcao
	
removerAvaliacao: #Não foi possivel implementar, não conseguimos ler o arquivo e remover

	la $t0, labelRemoverAvaliacao 	# Carrega a label
	la $t3, removerAvaliacao	#Grava endereço da label em que esta
	jal opcao

#######################################################################################################################

esvaziarLabel:
	
	la $t1, ($a1)		#Label por parametro 
	addi $t2, $zero, 0 	#valor nulo
	sb $t2, 0($a1)
	sb $t2, 1($a1)
	sb $t2, 2($a1)
	sb $t2, 3($a1)
	sb $t2, 4($a1)
	sb $t2, 5($a1)
	sb $t2, 6($a1)
	sb $t2, 7($a1)
	sb $t2, 8($a1)
	sb $t2, 9($a1)
	sb $t2, 10($a1)
	sb $t2, 11($a1)
	sb $t2, 12($a1)
	sb $t2, 13($a1)
	sb $t2, 14($a1)
	sb $t2, 15($a1)
	sb $t2, 16($a1)
	sb $t2, 17($a1)
	sb $t2, 18($a1)
	sb $t2, 19($a1)
	sb $t2, 20($a1)
	sb $t2, 21($a1)
	sb $t2, 22($a1)
	sb $t2, 23($a1)
	sb $t2, 24($a1)
	sb $t2, 25($a1)
	sb $t2, 26($a1)
	sb $t2, 27($a1)
	sb $t2, 28($a1)
	sb $t2, 29($a1)
	
	addi  $t1, $zero, 0	#Zerar $t1
	addi  $t2, $zero, 0	#Zerar $t2
	
	jr $ra
	
######################################## Arquivo ######################################################################

abrirArquivo:

					#a0 deve ter o endereço da label
	addi $a1, $zero, 9
	add $a2, $zero, $zero
	addi $v0, $zero, 13		#Abrir arquivo
	syscall				#Metodo para abrir arquivo
	
	add $s0, $zero, $v0

	jr $ra
	
escrever:

	addi $v0, $zero, 15		#Escrevendo no arquivo
	addi $a2, $zero, 30		#Numero de caracteres a serem escritos
	syscall				#Metodo para escrever no arquivo
					#Dado recebido = label vazia
	
	jr $ra
	
fecharArquivo:
	
	add $a0, $zero, $s0
	addi $v0, $zero, 16	#Fechar arquivo
	syscall
	
	jr $ra		
		
######################################### Sair #########################################################################

sair: nop