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
	#TODO Task 1.3
	
	#Callee Save
	addi sp,sp,-32 	#Stackpointer verschieben 
	sw t2,24(sp)
	sw t3,16(sp)
	sw t4,8(sp)
	sw s9,0(sp)
	
	la s9,display_base_address	#Adresse in Register speichern
	
	
	# DISBPLAY_BASE_ADDRESS + [(y * IMAGE_WIDTH) + x ] * 4
		#y*IMAGE_WIDTH
		li t2,256	#Load WITDTH
		mul t3,t2,a2	#y * WIDTH
		add t3,t3,a1	#(y * IMAGE_WIDTH) + x
		slli t3,t3,2	# * 4
		add t3,t3,s9	# t3 = DISBPLAY_BASE_ADDRESS + [(y * IMAGE_WIDTH) + x ] * 4 = Adresse,
				# an die die Farbe gespeichert werden soll 
		
		sw a3,(t3)	#Hex Wert der Farbe in Memory Speichern
		
	#Callee Restore
	lw s9,0(sp)
	lw t4,8(sp)
	lw t3,16(sp)
	lw t2,24(sp)
	addi sp,sp,32	#Stack freigeben
	
	
	

