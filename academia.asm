.data

	labelInicial: .asciiz "Seja bem vindo!\nEscolha uma das opções abaixo:\n1 - Aluno\n2 - Funcionário\n3 - Modalidade\n4 - Mensalidades\n\n"
	labelAluno: .asciiz "Aluno\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelFuncionario: .asciiz "Funcionário\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelModalidade: .asciiz "Modalidade\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	labelMensalidade: .asciiz "Mensalidade\nEscolha uma das opções abaixo:\n1 - Efetuar pagamento\n2 - Mostrar mensalidades atrasadas\n\n"
	mensagemDeErro: .asciiz "Operação inválida!"

	labelCadastrarAluno: .asciiz "Cadatrar aluno\n"
	labelEditarAluno: .asciiz "Editar aluno\n"
	labelBuscarAluno: .asciiz "Buscar aluno\n"
	labelRemoverAluno: .asciiz "Remover aluno\n"
	
	labelCadastrarFuncionario: .asciiz "Cadatrar funcionario\n"
	labelEditarFuncionario: .asciiz "Editar funcionario\n"
	labelBuscarFuncionario: .asciiz "Buscar funcionario\n"
	labelRemoverFuncionario: .asciiz "Remover funcionario\n"
	
	labelCadastrarModalidade: .asciiz "Cadatrar modalidade\n"
	labelEditarModalidade: .asciiz "Editar modalidade\n"
	labelBuscarModalidade: .asciiz "Buscar modalidade\n"
	labelRemoverModalidade: .asciiz "Remover modalidade\n"
	
.text

######################################## Tela inicial #####################################################################
index:

	la $t0, labelInicial 	#Carrega texto labelInicial
	jal opcao		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor que 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionar

	j sair			#Fim da execução

##########################################################################################################################

opcao:
	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
	la $a0, ($t0)		#Carregando o "texto" da tela de escolha
	syscall			#Syscall da tela
	jr $ra			#Fim da função

printf:
	add $v0, $zero, $t0	#Escolha do tipo de tela do printf
	syscall			#Chamada da tela
	jr $ra			#Fim da função

######################################## Vericações #######################################################################

verifica:

	bgt $t1, $a1, dadosInvalidos 	#Verifica a opção do usuário (Campo vazio, clicou cancelar, não foi inteiro)
	bgt $a0, $t2, dadosInvalidos	#Verifica se a opção escolhida está dentro do número máximo de escolhas possivel (a0 > t2? se sim erro)
	bgt $t1, $a0 dadosInvalidos	#Verifica se a opção escolida está dentro do número minimo de escolhas possivel (t1 > a0? se sim então erro)
	sub $t2, $t2, $t2		#Colocando t2 para ter o valor 0 novamente
	jr $ra				#Caso tudo esteja ok, o programa continua funcionando


dadosInvalidos:

	addi $a1, $zero, 2	#Escolhendo tela de erro
	la $a0, mensagemDeErro	#Carregando a label que diz o erro
	addi $t0, $zero, 55	#Escolhendo a tela de mensagens
	sub $t2, $t2, $t2	#Colocando t2 para ter o valor 0 novamente
	jal printf		#Chamando o print [ printf( error) ]
	j sair			#Fim do tratamento da exceção

###########################################################################################################################

######################################## Redirecionamento #################################################################

redirecionar:

	beq $a0, 1, opcoesAluno		#Menu do aluno
	beq $a0, 2, opcoesFuncionario	#Menu do funcionário
	beq $a0, 3, opcoesModalidade	#Menu da modalidade
	beq $a0, 4, opcoesMensalidade	#Menu da menslidade


redircionarAluno:

	beq $a0, 1, cadastrarAluno	# tela de cadastrar aluno
	beq $a0, 2, editarAluno		# tela de editar aluno
	beq $a0, 3, buscarAluno		# tela de buscar aluno
	beq $a0, 4, removerAluno	# tela de remover aluno


redircionarFuncionario:

	beq $a0, 1, cadastrarFuncionario	# tela de cadastrar funcionário
	beq $a0, 2, editarFuncionario		# tela de editar funcionário
	beq $a0, 3, buscarFuncionario		# tela de buscar funcionário
	beq $a0, 4, removerFuncionario		# tela de remover funcionário


redircionarModalidade:

	beq $a0, 1, cadastrarModalidade		# tela de cadastrar Modalidade
	beq $a0, 2, editarModalidade		# tela de editar Modalidade
	beq $a0, 3, buscarModalidade		# tela de buscar Modalidade
	beq $a0, 4, removerModalidade		# tela de remover Modalidade

redircionarMensalidade:

	beq $a0, 1, efetuarPagamento		 # tela de efetuar pagamento de mensalidades
	beq $a0, 2, mostrarMensalidadesAtrasadas # tela de mostrar mensalidades atrasadas

#######################################################################################################################

######################################## Telas referentes a Aluno #####################################################
opcoesAluno:

	la $t0, labelAluno	#Carrega a label do aluno
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index

cadastrarAluno:

	la $t0, labelCadastrarAluno # Carrega a label
	jal opcao

editarAluno:
	
	la $t0, labelEditarAluno # Carrega a label
	jal opcao
	
buscarAluno:

	la $t0, labelBuscarAluno # Carrega a label
	jal opcao

removerAluno:
	
	la $t0, labelRemoverAluno # Carrega a label
	jal opcao

#######################################################################################################################

######################################## Telas referentes a Funcionario #####################################################

opcoesFuncionario:

	la $t0, labelFuncionario	#Carrega o menu do funcionário
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index

cadastrarFuncionario:

	la $t0, labelCadastrarFuncionario # Carrega a label
	jal opcao

editarFuncionario:

	la $t0, labelEditarFuncionario # Carrega a label
	jal opcao

buscarFuncionario:

	la $t0, labelBuscarFuncionario # Carrega a label
	jal opcao

removerFuncionario:

	la $t0, labelRemoverFuncionario # Carrega a label
	jal opcao

#######################################################################################################################

######################################## Telas referentes a Modalidade #####################################################


opcoesModalidade:

	la $t0, labelModalidade	#Carrega o menu da modalidade
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index

cadastrarModalidade:

	la $t0, labelCadastrarModalidade # Carrega a label
	jal opcao

editarModalidade:

	la $t0, labelEditarModalidade # Carrega a label
	jal opcao
	
buscarModalidade:

	la $t0, labelBuscarModalidade # Carrega a label
	jal opcao
	
removerModalidade:

	la $t0, labelRemoverModalidade # Carrega a label
	jal opcao
	
#######################################################################################################################

######################################## Telas referentes a Mensalidade #####################################################


opcoesMensalidade:

	la $t0, labelMensalidade#Carrega o menu da mensalidade
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 2	#Parâmetro pra saber se a opção escolhida é menor ou igual a 2
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 2 [ verificacao(0, 2) ]
	j index

sair: nop
