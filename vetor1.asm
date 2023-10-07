.macro readInt
li $v0, 5
syscall
.end_macro

.macro printInt(%r)
add $a0, $zero, %r
li $v0, 1
syscall
.end_macro

.macro printStr(%s)
la $a0, %s
li $v0, 4
syscall
.end_macro

.macro return0
li $v0, 10
syscall
.end_macro

.data

arr: .word 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0 ,0
FR: .asciiz "Digite o proximo num: "
RES: .asciiz "A sequencia de numeros eh: "
SP: .byte ' '

.text

la $s0, arr
add $s1, $zero, $s0

add $t0, $zero, $zero

addi $t1, $zero, 10

FOR:
	beq $t0, $t1, SAIFOR
	
	printStr(FR)
	readInt
	sw $v0, 0($s0)
	
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	
	j FOR

SAIFOR:

	add $a1, $s1, $zero
	jal CUBOS

	return0

CUBOS:
	sw $ra, 0($sp)
	sw $a1, -4($sp)
	
	add $t0, $zero, $zero
	addi $t1, $zero, 10
	
	printStr(RES)
	
	jal FORCUB
	
	lw $ra, 0($sp)
	lw $a1, -4($sp)
	
	jr $ra
	
FORCUB:
	beq $t0, $t1, SAIFORCUB
	
	lw $t3, 0($a1)
	add $t7, $zero, $t3
	mult $t3, $t3
	mflo $t3
	mul $t3, $t3, $t7
	sw $s0, 0($a1)
	
	printInt($t3)
	printStr(SP)
	
	addi $a1, $a1, 4
	addi $t0, $t0, 1
	
	j FORCUB
	
SAIFORCUB:
	jr $ra
	

