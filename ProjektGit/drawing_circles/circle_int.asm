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

.data
.include "display_base_address.asm" # Copies the content of display_base_address.asm here

.text
main_int:

	

	# Exit
	li a0, 0
	li a7, 93
	ecall


circle_int:
# Inputs
#------------------
# a1: x coordinate
add s11,zero,a1
# a2: y coordinate
add s10,zero,a2
# a3: color
# a4: radius in pixels
add t6,zero,ra
#d = -radius;
sub s1,zero,a4
#x = radius;
add s2,zero,a4
#y = 0;
add s3,zero,zero
#while(y < x)
loopYX:
bge   s3,s2,endXY

	#d = d + 2×y + 1; 
		slli t1,s3,1	#t1 = 2*y 
		addi t1,t1,1	#(2*y) + 1
		add s1,s1,t1	#(2*y +1) + d = d
	
	#y = y + 1;
	addi s3,s3,1	
	
	#if(d > 0)
	ble  s1,zero,endIF #if(d > 0)
		#d = d - 2×x + 2;
			slli t2,s2,1	#t2 = 2*x
			addi t2,t2,2	#(2*x) + 2
			sub s1,s1,t2	#d - (2*x + 2) = d
		#x = x - 1;
		addi s2,s2,-1
	endIF:
	
	#draw_pixel(xc + x, yc + y, color);
	#xc + x = 
	add a1,s11,s2
	#yc + y = s10
	add a2,s10,s3
	jal ra,draw_pixel
	
	#draw_pixel(xc − x, yc + y, color);
	#add a1,zero,s9
	#add a2,zero,s10 #UN
	#xc -x = s9
	sub a1,s11,s2
	jal ra,draw_pixel
	
	#draw_pixel(xc − x, yc − y, color); 
	#add a1,zero,s9 #UN
	#add a2,zero,s8
	#yc - y = s8
	sub a2,s10,s3
	jal ra,draw_pixel
	
	#draw_pixel(xc + x, yc − y, color);
	#add a1,zero,s11
	#add a2,zero,s8 #UN
	#xc + x = s11
	add a1,s11,s2
	jal ra,draw_pixel
	
	#draw_pixel(xc + y, yc + x, color);
	#add a1,zero,s7
	#add a2,zero,s6
	#xc + y = s7
	add a1,s11,s3
	#yc + x = s6
	add a2,s10,s2
	jal ra,draw_pixel
	
	#draw_pixel(xc − y, yc + x, color);
	#add a1,zero,s5
	#add a2,zero,s6 #UN
	#xc - y = s5
	sub a1,s11,s3
	jal ra,draw_pixel
	
	#draw_pixel(xc − y, yc − x, color);
	#add a1,zero,s5 #UN
	#add a2,zero,s4
	#yc - x = s4
	sub a2,s10,s2
	jal ra,draw_pixel
	
	#draw_pixel(xc + y, yc − x, color);
	#add a1,zero,s7
	#add a2,zero,s4 #UN
	#xc + y = s7
	add a1,s11,s3
	jal ra,draw_pixel
	
	#callerRestore a1,a2
		#lw a2,0(sp)	#a1 im Stack speichern
		#lw a1,8(sp)	#a2 im Stack speichern
		#addi sp,sp,16	#stackspeicher freistellen
	
beq zero,zero,loopYX

endXY:jr t6
#############################################
# Do not remove the include below
.include "draw_pixel.asm" # Copies content of draw_pixel.asm here
jr ra
