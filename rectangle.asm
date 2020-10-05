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

.text
#STEP 1: Start with main function: Assign values to correct registers, so that you can use the draw_rectangle function
main:
	# ADD YOUR STEP 1 CODE HERE


#STEP 2: Call draw_rectangle
	# ADD YOUR STEP 2 CODE HERE

#STEP 5: Exit 
	# ADD YOUR STEP  CODE HERE


#STEP 3: Implement draw_rectangle with the arguments as described below
	# Hint: Don't forget the caller/callee save register conventions

# Function to draw rectangle from position x1,y1 to x2,y2 with fill color c
# a1: base address of frame buffer
# a2: width/height of quadratic image
# a3: unsigned integer x1 -- left boundary of rectangle
# a4: unsigned integer y1 -- top boundary of rectangle
# a5: unsigned integer x2 -- right boundary of rectangle
# a6: unsigned integer y2 -- bottom boundary of rectangle
# a7: unsigned integer c  -- fill color of rectangle as RGB value

draw_rectangle:
	# ADD YOUR STEP 4 CODE HERE


