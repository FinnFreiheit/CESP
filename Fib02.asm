##################################
#CESP Exercise 2
##################################


main:
	#STEP 1: define argument n and call function fib 
	# ADD YOUR STEP 1 CODE HERE
	li a0,10		#n = 10
	jal ra ,fib		#jump and link to fib
	
	#STEP 8: Print result value	
	# ADD YOUR STEP 8 CODE HERE
	
	#STEP 9: OS Call to exit program
	# ADD YOUR STEP 9 CODE HERE
	

# The function fib expects the following arguments	
# a0: integer with return value
#      -- in C Code: return n
# a1: integer number that indicates number of Fibonacci number to be calculated
#      -- in C Code: argument (int n) in function head

# Used register
# s2: fib(n-1)
# s3: fib(n-2)
fib:
	#STEP 2: Push return address and Regsiter S2 and S3 to Stack and decrease stack pointer
	# ADD YOUR STEP 2 CODE HERE
	addi sp,sp,-12
	sw ra,0(sp)		#save returnaddress
	
	# STEP 3: Check if argument n == 1. If it is: branch to _fib_retn
	# ADD YOUR STEP 3 CODE HERE
	li t1,1			#temporary 1
	beq a0,t1,_fib_retn	#if(n == 1) --> fib_retn
	
	# STEP 5: Call fib with argument n-1. Keep in mind that a1 needs to be preserved
	#         We store the return value from fib(n-1) in register s2
	# ADD YOUR STEP 5 CODE HERE
	sw a0,-4(sp)		#save n
	addi a0,a0,-1		#n-1
	jal fib			#method call
	lw a0,-4(sp)		#restore n 
	sw a1,-8(sp)		#save return value fin(n-1)
	
	# STEP 6: Call fib with argument n-2. Keep in mind that a1 needs to be preserved
	#         We store the return value from fib(n-2) in register s3
	# ADD YOUR STEP 6 CODE HERE
	addi a0,a0,-2		#n-2
	jal fib			#--> fib(n-2)
	
	
	# STEP 7 return sum of fib(n-1) + fib(n-2)
	lw t0,-8(sp)		#temporary return value from fib(n-1)
	add a1,t0,a1		#fib(n-1) + fib(n-2)
	# ADD YOUR STEP 7 CODE HERE
_fib_retn:
	# Value of a1 is store in a0. In C: return n
	add a0, zero, a1
	
_fib_end:
	#STEP 4: pop return address, s2, s3 from Stack and jump back to caller function
	#        Make sure that correct value is placed in register a0
	# ADD YOUR STEP 4 CODE HERE
	lw ra,0(sp)		#restore address
	jr ra			#jump ra
	
