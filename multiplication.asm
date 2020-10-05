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
#CESP Exercise 3: Multiplication #
##################################                                 

.globl  main


.text
j main


#STEP 1: Implement multiplication function according to C Code in Task sheet

multiplication:
# Input
# ------------------
#   a1: factor_1
#   a2: factor_2

# Output
# ------------------
#   a0: factor_1 * factor_2

	# ADD YOUR STEP 1 CODE HERE


#STEP 2: Open the files unit_test.asm with RARS and select from the contect mentu: Settings -> Assemble all files currently open

main:
#STEP 3: Use the asm file unit_test.asm to verify your implementation of the multiplication function

# Unit test to see if 2*2 == 4
	li a1, 2
	li a2, 2
	jal multiplication

	mv a1, a0
	li a2, 4
	jal unittest

#STEP 4: Test if the result is correct for the following calculations
#	  2 * 2
#	 45 * 32
#	 -2 * 3
#	 -4 * 7
#	 -5 * -6

	# ADD YOUR STEP 4 CODE HERE


#STEP 5: Exit 
	# ADD YOUR STEP 5 CODE HERE
