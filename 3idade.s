.data
	msg1: .asciiz "\n Insira o mês de nascimento (em números): "
	msg2: .asciiz "\n Insira o ano de nascimento: "
	msg3: .asciiz "\n Insira o mês atual (em números): "
	msg4: .asciiz "\n Insira o ano atual: "
	msg5: .asciiz "\n A idade em meses é: "
	
.text
main:
	#Escreva "Insira o mês de nascimento (em números): "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (mesn)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Escreva "Insira o ano de nascimento: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#leia (anon)
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Escreva "Insira o mês atual (em números): "
	li $v0, 4
	la $a0, msg3
	syscall
	
	#leia (mesa)
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#Escreva "Insira o ano atual: "
	li $v0, 4
	la $a0, msg4
	syscall
	
	#leia (anoa)
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	#idade = anoa - anon
	sub $t4, $t3, $t1
	
	#anos = idade * 12
	mul $t5, $t4, 12
	
	#se (mesa > mesn) então
	bgt $t2, $t0, se #Verdadeiro
	bgt $t0, $t2, senao #Falso
	
se:
	#meses = mesa - mesn
	sub $t6, $t2, $t0
	
	#mes = anos + meses
	add $t7, $t5, $t6
	
	#Escreva "A idade em meses é: "
	li $v0, 4
	la $a0, msg5
	syscall
	
	#Mostra (mes)
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	j fimse
	
senao:
	#meses = mesn - mesa
	sub $t6, $t0, $t2
	
	#mes = anos - meses
	sub $t7, $t5, $t6
	
	#Escreva "A idade em meses é: "
	li $v0, 4
	la $a0, msg5
	syscall
	
	#Mostra (mes)
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	j fimse
	
fimse: