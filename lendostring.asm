.include "macros.asm"

.data

P: .asciiz "Qual eh seu nome?\n"
R: .asciiz "Ola, "
NOME: .space 30

.text

la $a0, P #Imprime 1o texto
li $v0, 4
syscall

la $a0, NOME #Leitura de String
addi $a1, $zero, 30
li $v0, 8
syscall

la $a0, R #Imprime 2o texto
li $v0, 4
syscall

la $a0, NOME #Imprime o Nome
li $v0, 4
syscall

li $v0, 10 #return 0
syscall