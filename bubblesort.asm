#ALUNOS:
#Karim de Freitas Karam
#Gustavo Achcar Filho
#Pedro Gil Cardoso Vieira Filho

# int v = {3, 2, 1, 4, 8, 6, 5, 9, 7}
# void bubbleSort(int *v, int n){
 
#    for (int i=0; i<n-1; i++)
#        if (v[i] > v[i+1])
#            swap(&v[i], &v[i+1]);  
#    bubbleSort(v, n-1);

.macro printInt(%r)
add $a0, $zero, %r
li $v0, 1
syscall
.end_macro

.macro readInt
li $v0, 5
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
	v:.word 3, 2, 1, 4, 8, 6, 5, 9, 7
	TEXT: .asciiz "A sequencia eh: "
	SP: .byte ' '
	
.text
	#Acessar ao tosort[0]
	la $s7, v
	la $a0, v
	
	#tamanho do array - 1
	addi $s6, $zero, 8
	addi $a1, $zero, 8
	
	jal BUBBLE
	
	printStr(TEXT)
	
	lw $a0, 0($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 4($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 8($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 12($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 16($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 20($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 24($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 28($s7)
	printInt($a0)
	printStr(SP)
	
	lw $a0, 32($s7)
	printInt($a0)
	printStr(SP)
	
	return0
	
BUBBLE:
	sw $ra, 0($sp)
	sw $a0, -4($sp)

BUBBLECONT:	
	addi $t7, $zero, 2
	
	add $t0, $zero, $zero
	add $t1, $a1, $zero
	
	jal FOR1
	
	beq $a1, $t7, SAIBUBBLE
	j BUBBLECONT
	
SAIBUBBLE:
	
	lw $ra, 0($sp)
	lw $a0, -4($sp)
	
	jr $ra
	
	
	
FOR1:
	beq $t0, $t1, SAIFOR1
	
	lw $s1, 0($a0)
	lw $s2, 4($a0)
	
	bgt $s1, $s2, TROCA
	
	sw $s1, 0($a0)
	sw $s2, 4($a0)
	
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	
	j FOR1
	
TROCA:
	sw $s2, 0($a0)
	sw $s1, 4($a0)
	
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	
	j FOR1
	
SAIFOR1:
	lw $a0, -4($sp)
	
	addi $a1, $a1, -1
	
	jr $ra
