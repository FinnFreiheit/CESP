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
# a2: y coordinate
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
	#xc + x = s11
	add s11,a1,s2
	#yc + y = s10
	add s10,a2,s3
	#xc -x = s9
	sub s9,a1,s2
	#yc - y = s8
	sub s8,a2,s3
	
	#xc + y = s7
	add s7,a1,s3
	#yc + x = s6
	add s6,a2,s2
	#xc - y = s5
	sub s5,a1,s3
	#yc - x = s4
	sub s4,a2,s2
	
	#callerSave a1,a2
		addi sp,sp,-16	#stackspeicher bereitstellen
		sw a1,8(sp)	#a1 im Stack speichern
		sw a2,0(sp)	#a2 im Stack speichern
	
	#draw_pixel(xc + x, yc + y, color);
	add a1,zero,s11
	add a2,zero,s10
	jal ra,draw_pixel
	#draw_pixel(xc − x, yc + y, color);
	add a1,zero,s9
	add a2,zero,s10 #UN
	jal ra,draw_pixel
	#draw_pixel(xc − x, yc − y, color); 
	add a1,zero,s9 #UN
	add a2,zero,s8
	jal ra,draw_pixel
	#draw_pixel(xc + x, yc − y, color);
	add a1,zero,s11
	add a2,zero,s8 #UN
	jal ra,draw_pixel
	#draw_pixel(xc + y, yc + x, color);
	add a1,zero,s7
	add a2,zero,s6
	jal ra,draw_pixel
	#draw_pixel(xc − y, yc + x, color);
	add a1,zero,s5
	add a2,zero,s6 #UN
	jal ra,draw_pixel
	#draw_pixel(xc − y, yc − x, color);
	add a1,zero,s5 #UN
	add a2,zero,s4
	jal ra,draw_pixel
	#draw_pixel(xc + y, yc − x, color);
	add a1,zero,s7
	add a2,zero,s4 #UN
	jal ra,draw_pixel
	
	#callerRestore a1,a2
		lw a2,0(sp)	#a1 im Stack speichern
		lw a1,8(sp)	#a2 im Stack speichern
		addi sp,sp,16	#stackspeicher freistellen
	
beq zero,zero,loopYX

endXY:jr t6
#############################################
# Do not remove the include below
.include "draw_pixel.asm" # Copies content of draw_pixel.asm here
jr ra
