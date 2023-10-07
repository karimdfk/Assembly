.include "macros.asm"

.data

STR1: .asciiz "Digite o proximo numero: "
ADD: .asciiz "Add = "
MULT: .asciiz "\nMult = "
DIV: .asciiz "\nDiv = "

.text

#la $a0, STR1
#li $v0, 4
#syscall
printStr(STR1)

#la $v0, 5
#syscall
readInt
add $t0, $zero, $v0

#la $a0, STR1
#li $v0, 4
#syscall
printStr(STR1)

#la $v0, 5
#syscall
readInt
add $t1, $zero, $v0

add $s0, $t0, $t1

mult $t0, $t1
mflo $s1

div $t0, $t1
mflo $s2

#la $a0, ADD
#li $v0, 4
#syscall
printStr(ADD)

#add $a0, $zero, $s0
#li $v0, 1
#syscall
printInt($s0)

#la $a0, MULT
#li $v0, 4
#syscall
printStr(MULT)

#add $a0, $zero, $s1
#li $v0, 1
#syscall
printInt($s1)

#la $a0, DIV
#li $v0, 4
#syscall
printStr(DIV)

#add $a0, $zero, $s2
#li $v0, 1
#syscall
printInt($s2)

#la $v0, 10
#syscall
return0