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

MSG: .asciiz "Digite um numero: "
SPC: .byte ' '
RES: .asciiz "O resultado eh: "

.text

printStr(MSG)

readInt
add $s0, $v0, $zero

printStr(MSG)

readInt 
add $s1, $v0, $zero

mult $s0, $s1
mflo $t0

printInt($t0)
