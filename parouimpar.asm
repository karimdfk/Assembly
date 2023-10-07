.data

MPAR: .asciiz "O numero eh par"
MIMPAR: .asciiz "O numero eh impar"
TEXT: .asciiz "Digite um numero: "

.text

la $a0, TEXT
li $v0, 4
syscall 

li $v0, 5
syscall

add $a0, $zero, $v0

jal VERIFICA

beq $v0, $zero, MENSP

la $a0, MIMPAR
li $v0, 4
syscall

li $v0, 10
syscall
	
MENSP:
	la $a0, MPAR
	li $v0, 4
	syscall	

li $v0, 10
syscall


VERIFICA:
	addi $t0, $zero, 2
	div $a0, $t0
	mfhi $t0
	
	beq $t0, 0, PAR
	
	addi $v0, $zero, 1
	
	jr $ra
	
	
PAR: 
	addi $v0, $zero, 0
	
	jr $ra