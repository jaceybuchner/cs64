# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#


.text
main:
        li $v0 5
        syscall
        move $t0 $v0

        li $v0 5
        syscall
        add $t1 $v0 0 # diff way 

        sub $t3 $t0 $t1

        sll $t1 $t3 4
        add $t1 $t1 8

        li $v0 1
        move $a0, $t1
        syscall

        j exit
exit:
        li $v0 10
        syscall
        # Exit SPIM: Write your code here!
