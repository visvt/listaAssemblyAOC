.data
	msg1: .asciiz "\n Digite o primeiro número: "
	msg2: .asciiz "\n Digite o segundo número: "
	msg3: .asciiz "\n Números iguais"
	msg4: .asciiz " É o maior "
	msg5: .asciiz " É o menor "
	
.text
main:
	#Escreva "Digite o primeiro número: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (num1)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Escreva "Digite o segundo número: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#leia (num2)
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#se (num1 == num2) então
	beq $t0, $t1, se #Verdadeiro1
	bgt $t0, $t1, senaose #Verdadeiro2
	j senao
	
se:
	#Escreva "Números iguais"
	li $v0, 4
	la $a0, msg3
	syscall
	
	j fimse

senaose:
	#Mostra (num1) 
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	#É o maior
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Mostra (num2) 
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	#É o menor
	li $v0, 4
	la $a0, msg5
	syscall
	
	j fimse
	
senao:
	#Mostra (num2) 
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	#É o maior
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Mostra (num1) 
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	#É o menor
	li $v0, 4
	la $a0, msg5
	syscall
	
	j fimse
fimse: