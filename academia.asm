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
	la $t3, index		#Grava endereço da label em que esta
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
	
	
	
	beq $a1, -1, dadosInvalidos	#Caso dado seja inválido redireciona
	beq $a1, -2, voltar		#Clicou em cancelar e volta a pagina inicial
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
	
voltar: 

	j sair	#pegar endereço da label e redirecionar

###########################################################################################################################

######################################## Redirecionamento #################################################################

redirecionar:

	beq $a0, 1, opcoesAluno		#Menu do aluno
	beq $a0, 2, opcoesFuncionario	#Menu do funcionário
	beq $a0, 3, opcoesModalidade	#Menu da modalidade
	beq $a0, 4, opcoesMensalidade	#Menu da menslidade


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

redirecionarMensalidade: nop

	#beq $a0, 1, efetuarPagamento		 # tela de efetuar pagamento de mensalidades
	#beq $a0, 2, mostrarMensalidadesAtrasadas # tela de mostrar mensalidades atrasadas

#######################################################################################################################

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

	la $t0, cadastrarAluno	 # Carrega a label
	la $t3, opcoesAluno	 #Grava endereço da label em que esta
	jal opcao
	addi $t1, $t1, 0
	addi $t2, $zero, 4
	jal verifica
	

editarAluno:
	
	la $t0, labelEditarAluno # Carrega a label
	la $t3, editarAluno	 #Grava endereço da label em que esta
	jal opcao
	
buscarAluno:

	la $t0, labelBuscarAluno # Carrega a label
	la $t3, buscarAluno	 #Grava endereço da label em que esta
	jal opcao

removerAluno:
	
	la $t0, labelRemoverAluno # Carrega a label
	la $t3, removerAluno	  #Grava endereço da label em que esta
	jal opcao

#######################################################################################################################

######################################## Telas referentes a Funcionario #####################################################

opcoesFuncionario:

	la $t0, labelFuncionario	#Carrega o menu do funcionário
	la $t3, opcoesFuncionario	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4		#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index

cadastrarFuncionario:

	la $t0, labelCadastrarFuncionario # Carrega a label
	la $t3, cadastrarFuncionario	  #Grava endereço da label em que esta
	jal opcao

editarFuncionario:

	la $t0, labelEditarFuncionario 	# Carrega a label
	la $t3, editarFuncionario	#Grava endereço da label em que esta
	jal opcao

buscarFuncionario:

	la $t0, labelBuscarFuncionario 	# Carrega a label
	la $t3, buscarFuncionario	#Grava endereço da label em que esta
	jal opcao

removerFuncionario:

	la $t0, labelRemoverFuncionario # Carrega a label
	la $t3, removerFuncionario	#Grava endereço da label em que esta
	jal opcao

#######################################################################################################################

######################################## Telas referentes a Modalidade #####################################################


opcoesModalidade:

	la $t0, labelModalidade		#Carrega o menu da modalidade
	la $t3, opcoesModalidade	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4		#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index

cadastrarModalidade:

	la $t0, labelCadastrarModalidade # Carrega a label
	la $t3, cadastrarModalidade	 #Grava endereço da label em que esta
	jal opcao

editarModalidade:

	la $t0, labelEditarModalidade 	# Carrega a label
	la $t3, editarModalidade	#Grava endereço da label em que esta
	jal opcao
	
buscarModalidade:

	la $t0, labelBuscarModalidade 	# Carrega a label
	la $t3, buscarModalidade	#Grava endereço da label em que esta
	jal opcao
	
removerModalidade:

	la $t0, labelRemoverModalidade 	# Carrega a label
	la $t3, removerModalidade	#Grava endereço da label em que esta
	jal opcao
	
#######################################################################################################################

######################################## Telas referentes a Mensalidade #####################################################


opcoesMensalidade:

	la $t0, labelMensalidade	#Carrega o menu da mensalidade
	la $t3, opcoesMensalidade	#Grava endereço da label em que esta
	jal opcao			#Função para mostrar o menu e escolher a opções [ escolha(labelAluno) ]
	addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 2		#Parâmetro pra saber se a opção escolhida é menor ou igual a 2
	jal verifica			#Função que verifica se a opção escolhida é um número entre 1 e 2 [ verificacao(0, 2) ]
	j index

sair: nop
