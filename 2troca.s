.data
	msg1: .asciiz "\n Insira o primeiro número: "
	msg2: .asciiz "\n Insira o segundo número: "
	msg3: .asciiz "\n Valores iguais"
	msg4: .asciiz "\n O primeiro valor é: "
	msg5: .asciiz " O segundo valor é: "
	
.text
main:
	#Escreva "Insira o primeiro número: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (num1)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Escreva "Insira o segundo número: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#leia (num2)
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#se (num1 == num2) então
	beq $t0, $t1, se #verdadeiro
	j senao #falso
	
se:
	#Escreva "Valores iguais"
	li $v0, 4
	la $a0, msg3
	syscall
	
	j fimse
	
senao:
	#trc = num1
	move $t2, $t0
	
	#num1 = num2
	move $t0, $t1
	
	#num2 = trc
	move $t1, $t2
	
	#Escreva "O primeiro valor é: "
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Mostra (num1)
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
	#Escreva "O segundo valor é: "
	li $v0, 4
	la $a0, msg5
	syscall
	
	#Mostra (num2)
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	j fimse
	
fimse: