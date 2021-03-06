#
#  ██████╗███████╗███████╗██████╗     ██╗     ███████╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
# ██╔════╝██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
# ██║     █████╗  ███████╗██████╔╝    ██║     █████╗  ██║        ██║   ██║   ██║██████╔╝█████╗
# ██║     ██╔══╝  ╚════██║██╔═══╝     ██║     ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗██╔══╝
#  ██████╗███████╗███████║██║         ███████╗███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
#  ╚═════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
#
# Copyright 2020 Michael J. Klaiber


###############################
#  CESP Programming Project   #
###############################

.eqv WIDTH 256

draw_pixel:
# Creates colored pixel at position (x,y)

# Inputs
#----------------------
#    a1: x
#    a2: y
#    a3: color
# Outputs: None

	la t5,display_base_address

	# DISBPLAY_BASE_ADDRESS + (y * IMAGE_WIDTH) + x
		#y*IMAGE_WIDTH
		li t2,256	    #Load WITDTH
		mul t3,t2,a2	#y * WIDTH
		slli t3,t3,2	# * 4 Aufgrund der Adressen
		slli t4,a1,2	# x * 4
		add t3,t3,t4	#(y * IMAGE_WIDTH) + x
		add t3,t3,t5

		sw a3,(t3)
