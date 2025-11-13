.data
	msg1: .asciiz "\n Insira o valor em dólar: "
	msg2: .asciiz "\n Essa é a conversão em real: "
	
.text
main:
	#Escreva "Insira o valor em dólar: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (dolar)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Cota = 5
	add, $t1, $t1, 5
	
	#real = dolar * cota
	mul $t2, $t0, $t1
	
	#Escreva "Essa é a conversão em real: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Mostra (real)
	li $v0, 1
	add $a0, $t2, 0
	syscall