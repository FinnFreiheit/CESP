#
#  ██████╗███████╗███████╗██████╗     ██╗     ███████╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
# ██╔════╝██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
# ██║     █████╗  ███████╗██████╔╝    ██║     █████╗  ██║        ██║   ██║   ██║██████╔╝█████╗  
# ██║     ██╔══╝  ╚════██║██╔═══╝     ██║     ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗██╔══╝  
#  ██████╗███████╗███████║██║         ███████╗███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
#  ╚═════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
#
# Copyright 2020 Michael J. Klaiber
                                 

##################################
#CESP Exercise 3: Draw Rectangle #
##################################

# Function to draw rectangle from position x1,y1 to x2,y2 with fill color c
# a1: base address of frame buffer
# a2: width/height of quadratic image
# a3: unsigned integer x0 -- left boundary of rectangle
# a4: unsigned integer y0 -- top boundary of rectangle
# a5: unsigned integer x1 -- right boundary of rectangle
# a6: unsigned integer y1 -- bottom boundary of rectangle
# a7: unsigned integer c  -- fill color of rectangle as RGB value

.text
#STEP 1: Start with main function: Assign values to correct registers, so that you can use the draw_rectangle function
main:

	
	li a1,0x10010000	# a1: base address of frame buffer
	li a2,128		# a2: width/height of quadratic image
	li a3,45 		# a3: unsigned integer x0 -- left boundary of rectangle
	li a4,45		# a4: unsigned integer y0 -- top boundary of rectangle
	li a5,77		# a5: unsigned integer x1 -- right boundary of rectangle
	li a6,88
	li a7,0xFF0000		# a7: unsigned integer c  -- fill color of rectangle as RGB value
	


#STEP 2: Call draw_rectangle
	jal ra,draw_rectangle 		#Call draw_rectangle

#STEP 5: Exit 
	li a7,10 # terminate
	ecall


#STEP 3: Implement draw_rectangle with the arguments as described below
	# Hint: Don't forget the caller/callee save register conventions

draw_rectangle:
	# calle save
	addi sp, sp, -28
	sw a1,24(sp)
	sw a2,20(sp)
	sw a3,16(sp)
	sw a4,12(sp)
	sw a5,8(sp)
	sw a6,4(sp)
	sw a7,0(sp)
	
	#Adressbereiche anpassen (int = 4Bit)
	li t6,4
	mul a3,a3,t6
	mul a4,a4,t6
	mul a5,a5,t6
	mul a6,a6,t6
	
	add t1,zero,a4		#y = y0
	addi t1,t1,-4		#damit erster increment auf richtigen Wert
	
ersteSchleife:
	bge t1,a6,exit		#branch if y0 >= y1 --> Exit
	add t0,zero,a3		#x = x0
	addi t1,t1,4		#increment y
zweiteSchleife:
	bge t0,a5,ersteSchleife
	mul t3,t1,a2		#y*width
	add t3,t0,t3		#x + (y*width)
	add t3,a1,t3		#baseadresse + (x + y * width) 	/  t3 = int* crtadresse 
 
	
	
	sw a7,(t3)		#*crtadresse = fillcoller
	addi t0,t0,4		#increment x
	beq zero,zero,zweiteSchleife

exit:	
	#calle restore
	lw a7,0(sp)
	lw a6,4(sp)
	lw a5,8(sp)
	lw a4,12(sp)
	lw a3,16(sp)
	lw a2,20(sp)
	lw a1,24(sp)
	
	jr ra			# jump --> main
	
		
	


