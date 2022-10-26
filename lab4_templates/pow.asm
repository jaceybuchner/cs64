
.data
	input_number: .asciiz "Enter a number x:"
	input_exp: .asciiz "Enter the exponent n:"
	power_is: .asciiz "Power(x,n) is:"
	addL: .asciiz "\n"
	
.text
main:
	# print input_number
    li $v0 4
    la $a0 input_number
    syscall
	la $a0 addL
    syscall
	
	li $v0 5
	syscall
	move $t0 $v0

	# enter exponent
    li $v0 4
    la $a0 input_exp
    syscall
	la $a0 addL
    syscall

	li $v0 5
	syscall
	move $t1 $v0

	li $t2 1
	li $t3 1

	#t0 = x = 5 
	#t1 = n = 3
	#t2 = pow = 1
	#t3 = i = 1
	add $t1 $t1 1

loop: 
	# i < n. continue
	slt $t7 $t3 $t1
	beq $t7 $zero end
	
	# li $v0 1
	# move $a0 $t3
	# syscall

	mult $t2 $t0
	mflo $t2					
	
	#increment i
	add $t3 $t3 1

	j loop	
end:

	#print ending
	li $v0 4
	la $a0 power_is
	syscall
	la $a0 addL
    syscall

	li $v0 1
	move $a0 $t2
	syscall

exit:

	li $v0 10
	syscall


