.data   
    input: .asciiz "Enter the next number:"
    mini: .asciiz "Minimum:"
    addL: .asciiz "\n"
.text  
main:
    # "enter the next number, set v0 to 5 and a0 to input so it can print the string"
    li $v0 4
    la $a0 input
    syscall
    la $a0 addL
    syscall

    # set to input
    li $v0 5
    syscall
    move $t0 $v0 #move he value taken into input into the temp 0 spot

    # 2nd "enter the next number"
    li $v0 4
    la $a0 input
    syscall
    la $a0 addL
    syscall
    

    # set to input
    li $v0 5
    syscall
    move $t1 $v0

    # 3rd "enter the next number"
    li $v0 4
    la $a0 input
    syscall
    la $a0 addL
    syscall

    # set to input
    li $v0 5
    syscall
    move $t2 $v0

    # compare first two, get min
    # get min of min and third number 
    # stored in $t0, $t1, $t2 

    # set first argument to 1 or 0, if first register is less than second register

    slt $t7 $t0 $t1
    beq $t7 $zero isGreater #is false t1>t0
    move $t7 $t0
    j isSmaller
isGreater:
    move $t7 $t1

isSmaller: 

    #t7<t6 == 1 if true = 0 if false
    slt $t6 $t7 $t2
    beq $t6 $zero isG #false
    move $t6 $t7
    j isS
isG:
    move $t6 $t2
isS:

    li $v0 4
    la $a0 mini
    syscall

    li $v0 1
    move $a0 $t6
    syscall

    
exit:

    li $v0 10
    syscall 
