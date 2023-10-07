.data
TEXT: .asciiz "Digite um numero: "
RET: .asciiz "Sua sequencia de numeros eh: "
ESPACO: .byte ' '

.text

addi $t0, $zero, 0

la $a0, TEXT
li $v0, 4
syscall

li $v0, 5
syscall

addi $s0, $v0, 1

addi $s1, $zero, 0

la $a0, RET
li $v0, 4
syscall

WHILE:
	beq $s1, $s0, SAIDA
	
	add $a0, $zero, $s1
	li $v0, 1
	syscall
	
	la $a0, ESPACO
	li $v0, 4
	syscall
	
	addi $s1, $s1, 1
	j WHILE
	
SAIDA:
	
	li $v0, 10
	syscall