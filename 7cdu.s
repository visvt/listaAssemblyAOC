.data
	msg1: .asciiz "\n Digite um número de 100 a 999: "
	msg2: .asciiz "\n Centena = "
	msg3: .asciiz "\n Dezena = "
	msg4: .asciiz "\n Unidade = "
	
.text
main:
	#Escreva "Digite um número de 100 a 999: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (num)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	
	blt $t0, 100, main #Menor que 100
	bgt $t0, 999, main #Maior que 999
	
	#a = num / 100 (centena)
	div $t1, $t0, 100
	
	#b = a * 100
	mul $t2, $t1, 100
	
	#c = num - b
	sub $t3, $t0, $t2
	
	#d = c / 10 (dezena)
	div $t4, $t3, 10
	
	#e = c % 10 (unidade)
	rem $t5, $t3, 10
	
	#Escreva "Centena = "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Mostra (a)
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	#Escreva "Dezena = "
	li $v0, 4
	la $a0, msg3
	syscall
	
	#Mostra (d)
	li $v0, 1
	add $a0, $t4, 0
	syscall
	
	#Escreva "Unidade = "
	li $v0, 4
	la $a0, msg3
	syscall
	
	#Mostra (e)
	li $v0, 1
	add $a0, $t5, 0
	syscall