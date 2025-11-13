.data
	msg1: .asciiz "\n Insira o valor do produto: "
	msg2: .asciiz "\n Valor inválido"
	msg3: .asciiz "\n Insira o valor da parcela: "
	msg4: .asciiz "\n O valor da parcela é inválido"
	msg5: .asciiz "\n O número de parcelas é: "
	
.text
main:
	#Escreva "Insira o valor do produto: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (prod)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#enquanto (prod < 1000 e prod >=10000) então
	blt $t0, 1000, errado
	bge $t0, 10000, errado
	
	j parcela
	
	
errado:
	#Escreva "Insira o valor do produto: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	j main
	
parcela:

	#Escreva "Insira o valor da parcela: "
	li $v0, 4
	la $a0, msg3
	syscall
	
	#leia (parc)
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#se (parc < 100 ou parc > 500) então
	blt $t1, 100, se 
	bgt $t1, 500, se
	
	j senao
	
se:
	#Escreva "O valor da parcela é inválido"
	li $v0, 4
	la $a0, msg4
	syscall
	
	j parcela

senao:
	#divpar = prod / parc
	div $t2, $t0, $t1
	
	#resto = prod % parc
	rem $t3, $t0, $t1
	
	#se (resto > 0) então
	bgtz $t3, se1 #verdadeiro
	j senao1 #falso
	
se1:
	#nparc = divpar + 1
	add $t4, $t2, 1
	
	j fimse

senao1:
	#nparc = divpar
	add $t4, $t2, 0
	
	j fimse
	
fimse:
	#Mostra ("O número de parcelas é: ")
	li $v0, 4
	la $a0, msg5
	syscall
	
	#mostra (nparc)
	li $v0, 1
	add $a0, $t4, 0
	syscall
