# hello.asm
# A "Hello World" program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables
.data
        inp: .asciiz "Enter an integer: "

#Text Area (i.e. instructions)
.text
main:
        # printing done here
        li $v0 4
        la $a0 inp
        syscall

        # get the input
        li $v0 5
        syscall
        move $t1 $v0

        # store 2 to divide by later
        li $t2 2

        # division check
        div $t1 $t2
        mfhi $t0

        li $t7 0
        beq $t0 $t7 even

odd:
        li $t5 2
        mult $t1 $t5
        mflo $t0
        li $v0 1
        move $a0 $t0
        syscall
        j exit
even:
        li $t5 3
        mult $t1 $t5
        mflo $t0
        li $v0 1
        move $a0 $t0
        syscall
        j exit
exit:
        li $v0 10
        syscall
