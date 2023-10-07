.data
	str1: .asciiz "Digite o proximo numero "
	str2: .asciiz "A soma dos impares eh: "
	
.text

	addi $v0, $zero, 4

	li $v0, 4 #impprimir uma string
	la $a0, str1
	syscall
	
	li $v0, 5 #leitura de inteiros
	syscall
	
	li $t0, 2 #coloca o numero 2 no registrador t0
	div $v0, $t0 #divide o número lido pelo numero colocado no t0(2)
	
	mfhi $t1 #move o valor do registrador hi (vai ser o resto da div) para t1
	
	beq $t1, $zero, nsoma1
	
	add $s0, $s0, $v0
	
	nsoma1:
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	
	div $v0, $t0
	
	mfhi $t1
	
	beq $t1, $zero, nsoma2
	
	add $s0, $s0, $v0
	
	nsoma2:
	
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	
	div $v0, $t0
	
	mfhi $t1
	
	beq $t1, $zero, nsoma3
	
	add $s0, $s0, $v0
	
	nsoma3:
	
	li $v0, 4 #impprimir uma string
	la $a0, str2
	syscall
	
	jal NO
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	NO:
	
