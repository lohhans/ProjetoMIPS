.data

	menuInicial: .asciiz "Seja bem vindo!\nEscolha uma das opções abaixo:\n1 - Aluno\n2 - Funcionário\n3 - Modalidade\n4 - Mensalidades\n\n"
	menuCliente: .asciiz "Cliente\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	menuFuncionario: .asciiz "Funcionário\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	menuModalidade: .asciiz "Modalidade\nEscolha uma das opções abaixo:\n1 - Cadastrar\n2 - Editar\n3 - Buscar\n4 - Remover\n\n"
	menuMensalidades: .asciiz "Mensalidade\nEscolha uma das opções abaixo:\n1 - Efetuar pagamento\n2 - Mostrar mensalidades atrasadas\n\n"
	mensagemDeErro: .asciiz "Operação inválida!"
.text

index:

	la $t0, menuInicial 	#Carrega texto menuInicial
	jal opcao		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor que 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j redirecionar

	j sair			#Fim da execução
	
	
opcao: 	
	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
	la $a0, ($t0)		#Carregando o "texto" da tela de escolha
	syscall			#Syscall da tela
	jr $ra			#Fim da função

printf:
	add $v0, $zero, $t0	#Escolha do tipo de tela do printf	
	syscall			#Chamada da tela
	jr $ra			#Fim da função

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
	
	
redirecionar:	
	
	beq $a0, 1, opcoesCliente	#Menu do cliente
	beq $a0, 2, opcoesFuncionario	#Menu do funcionário
	beq $a0, 3, opcoesModalidade	#Menu da modalidade
	beq $a0, 4, opcoesMensalidade	#Menu da menslidade
	
	
opcoesCliente: 	

	la $t0, menuCliente	#Carrega o menu do cliente
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(menuCliente) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index	
	

	
opcoesFuncionario: 	

	la $t0, menuFuncionario	#Carrega o menu do funcionário
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(menuCliente) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index	

		
opcoesModalidade: 	

	la $t0, menuModalidade	#Carrega o menu da modalidade
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(menuCliente) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 4
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 4 [ verificacao(0, 4) ]
	j index	

	
opcoesMensalidade: 	

	la $t0, menuMensalidades#Carrega o menu da mensalidade
	jal opcao		#Função para mostrar o menu e escolher a opções [ escolha(menuCliente) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 2	#Parâmetro pra saber se a opção escolhida é menor ou igual a 2
	jal verifica		#Função que verifica se a opção escolhida é um número entre 1 e 2 [ verificacao(0, 2) ]
	j index	

sair: nop
