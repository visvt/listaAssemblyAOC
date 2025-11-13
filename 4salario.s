.data
	msg1: .asciiz "\n Digite o salário: "
	msg2: .asciiz "\n O novo salário é: "
	
.text
main:
	#Escreva "Digite o salário: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (sal)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#porc = sal * 25
	mul $t1, $t0, 25
	
	#porc = porc / 100
	div $t1, $t1, 100
	
	#nsal = sal + porc
	add $t2, $t0, $t1
	
	#Escreva "O novo salário é: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Mostra (nsal)
	li $v0, 1
	add $a0, $t2, 0
	syscall