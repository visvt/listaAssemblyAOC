.data
	msg1: .asciiz "\n Insira o valor de a: "
	msg2: .asciiz "\n Insira o valor de b: "
	msg3: .asciiz "\n Insira o valor de c: "
	msg4: .asciiz "\n Duas raízes reais "
	msg5: .asciiz "\n Uma raiz real "
	msg6: .asciiz "\n Não existem raízes reais "
	
.text
main:
	#Escreva "Insira o valor de a: "
	li $v0, 4
	la $a0, msg1
	syscall
	
	#leia (a)
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Escreva "Insira o valor de b: "
	li $v0, 4
	la $a0, msg2
	syscall
	
	#leia (b)
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Escreva "Insira o valor de c: "
	li $v0, 4
	la $a0, msg3
	syscall
	
	#leia (c)
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#delta = ((b*b) - 4 * a * c)
	mul $t3, $t2, $t2
	mul $t4, $t0, 4
	mul $t5, $t4, $t2 
	sub $t6, $t3, $t5
	
	#se (delta > 0) então
	bgt $t6, 0, se #Verdadeiro1
	beq $t6, 0, senaose #Verdadeiro2
	j senao
	
se:
	#Escreva "Duas raízes reais "
	li $v0, 4
	la $a0, msg4
	syscall
	
	j fimse
	
senaose:
	#Escreva "Uma raiz real "
	li $v0, 4
	la $a0, msg5
	syscall
	
	j fimse
	
senao:
	#Escreva "Não existem raízes reais "
	li $v0, 4
	la $a0, msg6
	syscall
	
	j fimse
	
fimse: