##################################
#CESP Exercise 4: Mandelbrot     #
##################################

# STEP 1: Familize with constants
.eqv DISPLAY_BASE_ADDRESS 0x10010000
.eqv Q_INTEGER 24
.eqv Q_FRACTION 8
.eqv MAX_ITERATIONS 50  #    int max_iterations = 50;
.eqv LIMIT2 0x400 # limit*limit = 2*2

#int w = h = 128
.eqv IMAGE_WIDTH 128
.eqv IMAGE_HEIGHT 128
.eqv WIDTH_LOG2 7 # You can use these constants for the division by image_width in line 19 (use a shift right there)
.eqv HEIGHT_LOG2 7

# Step 2: initialize constant using the fixed point notation defined above
#         Hint: either provide values as negative hexadecimal OR as two's complement value, e.g. -1.0 is either -0x100 or 0xff,,ffeff+1=0xff..fff00
.eqv X_START -0x00000180		#X_START = -1,5
.eqv Y_START -0x00000100		#Y_START = -1.0
.eqv X_STRETCH 0x00000200		#X_STRETCH = 2.0
.eqv Y_STRETCH 0x00000200		#Y_STRETCH = 2.0
    
main:
    # STEP 3: Here  a1 to a4 are initialized with X_START to Y_STRETCH 
    li a1, X_START
    li a2, Y_START
    li a3, X_STRETCH
    li a4, Y_STRETCH
    
    # STEP 4: jump to function "mandelbrot"
    jal mandelbrot

    # STEP 9: Exit
    li a0, 0
    li a7, 93
    ecall

    
mandelbrot:
# Input:
#   a1: x_start
#   a2: y_start
#   a3: x_stretch
#   a4: y_stretch
# Output: None

    # STEP 5: push the callee save registers to the stack
    addi sp,sp,-16
    sw a1,12(sp)
    sw a2,8(sp)
    sw a3,4(sp)
    sw a4,0(sp)
    
    # STEP 6: implement the code inside y for loop here
    
    
    # Use the following register-to-variable mapping (this is just a suggestion)
    # s0: Zr
    # s1: Zi 
    # s2: Tr
    # s3: Ti
    # s4: x
    # s5: y
    # s6: i
    # s7: Cr
    # s8: Ci
    
 	#t1
    li t2,IMAGE_WIDTH
    	#t3
    	#t4
    li t6,MAX_ITERATIONS
    
    
    
    
    #for(y=0;y<h;++y)
    #{
    li s5,0 		#y = 0
yloop:
	bge s5,t2,exit
	
	li s4,0 	#x = 0
	xloop:
		bge s4,t2,incrementyloop
		li s0,0
		li s1,0
		li s2,0
		li s3,0
		
		#Cr = (X_STRETCH * x / IMAGE_WIDTH - x_START)
		mul s7,a3,s4		# X_STRETCH * X
		div s7,s7,t2		# / IMAGE_WIDTH
		sub s7,s7,a1		# - x_START
		
		#Ci = (Y_STRETCH * y / IMAGE_HIGHT - y_START
		mul s8,a4,s5		#Y_STRETCH * y
		div s8,s8,t2		# / IMAGE_HIGHT
		sub s8,s8,a2		#-Y_START
		
		li s6,0		#iteration = 0
		iterationLoop:
			#iteration < MAX_ITERATIONS && (Tr + Ti <= limit * limit)

			#(Tr + Ti <= limit * limit)
			add t1,s2,s3
			li t3,LIMIT2	
			bgt t1,t3,plot
			
			#iteration < MAX_ITERATIONS
			bge s6,t6,plot
			
			#zi = two * zr * zi + ci
			mul t4,s0,s1
			slli s1,t4,1
			add s1,s1,s8
			
			#zr = tr - ti + cr
			sub s0,s2,s3
			add s0,s0,s7
		
			mul s2,s0,s0 #tr = zr * zr
			mul s3,s1,s1 #ti = zi * zi
			
			addi s6,s6,1
			beq zero,zero,iterationLoop
		plotExit:	
		addi s4,s4,1	#++x
		beq zero,zero,xloop
		
		incrementyloop:
		addi s5,s5,1 	#++y
		beq zero,zero,yloop
  
    
    #}

exit:

    #STEP 8: pop callee save register from stack
    lw a4,0(sp)
    lw a3,4(sp)
    lw a2,8(sp)
    lw a1,12(sp)
   jr ra


plot:
# Creates colored pixel at position (x,y)  
# DISPLAY_BASE_ADDRESS = 0x10010000
# Inputs
#    s6: iterations
#    s4: x
#    s5: y
# Outputs: None

# STEP 7: 
	
	li t5,DISPLAY_BASE_ADDRESS
#callee Save
	addi sp,sp,-12
	sw,s6,8(sp) 
	sw s4,4(sp)
	sw s5,0(sp)
	
	# * 4 (Bit)
	slli s4,s4,2
	slli s5,s5,2
	
	# DISBPLAY_BASE_ADDRESS + (y * IMAGE_WIDTH) + x
	mul s5,s5,t2
	add t5,t5,s5
	add t5,t5,s4
	
	#Farbe
	slli s6,s6,3
	addi t0,t0,0xFF
	sub t0,t0,s6
	
	#Farbe speichern
	sw t0,(t5)
	
#callee restore	
	lw s5,0(sp)
	lw s4,4(sp)
	lw s6,8(sp)
	
beq zero,zero,plotExit
