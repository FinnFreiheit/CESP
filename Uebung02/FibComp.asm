.text
	li a0,10
fib: 
	li t6,1
	bgt a0,t6,fib_recurse
	add t1,a0,zero
	
	jr ra
	
fib_recurse:
	addi sp,sp,-12
	sw ra,0(sp)
	
	sw a0,4(sp)
	addi a0,a0,-1
	
	jal fib
	lw a0,4(sp)
	sw t1,8(sp)
	
	addi a0,a0,-2
	jal fib
	
	lw t0,8(sp)
	add t1,t0,t1
	
	lw ra,0(sp)
	addi sp,sp,12
	
	jr ra
	