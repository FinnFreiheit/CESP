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

.include "display_base_address.asm"  # Copies the content of display_base_address.asm here
.include "sinlut.asm"                # Copies the content of sinlut.asm here
.globl sin
.globl cos

.text


li a1, 1
li a2, 1
li a3, 0x00ff00
jal draw_pixel

li a1, 254
li a2, 1
li a3, 0x00ff00
jal draw_pixel

li a1, 1
li a2, 254
li a3, 0x00ff00
jal draw_pixel

li a1, 254
li a2, 254
li a3, 0x00ff00
jal draw_pixel

main_float:

	
	
	# Exit
	li a0, 0
	li a7, 93
	ecall

circle_float:
# Inputs
#------------------
# a1: x coordinate
# a2: y coordinate
# a3: color
# a4: radius in pixels


	#TODO Task 1.4

sin:
#Beim Aufrufen dieser Funktion werden alle temp und save Register in den Stack gespeichert. In den Test Dateien findet kein caller save 
#statt, somit muss ein callee save ausgeführt werden. 

## Preserve saved registers: t0-t6 und s0-s11 -> 19 Register -> 19 * 8 =  152
jal ra,calleSave

# Input
#-------------------
# a1: angle in degree (values between 0 and 90 degree are possible)
#
# Ouput:
# la0: sin(a1)

	#TODO Task 1.1
	#Die ergebnisse der Sinusberechnungen sind in der asm Datei "sinlut" hinterlegt. Durch .include sinlut.asm im .Data bereich,
	#werden alle sinusergebniss geladen. Um auf die werte zuzugreifen, wird die Adresse von dem Label .sin_lookup in das Register 
	#gespeichert. 
	la t0,.sin_lookup 	#Adresse von .sin_lookup in t0 speichern 
	#Alle 4 Bit liegt ein neuer Sin() wert im Datasegment. Somit muss der Wert im Register a1 mit 4 multipliziert werden.
	#Multiplikation mit 4 ist das selbe wie ein Bitshift um 2 nach links. 
	slli t1,a1,2	#a1 << 2 -> a1 * 4, Speichern in t1
	#Der Wert an der Adresse wird ins Register a0 gespeichert. 
	
	#erzeugen der richtigen Adresse
	add t2,t0,t1
	lw a0,(t2)

#Funktion ist abgeschlossen, somit muss das Register wider aus dem Stack restort werden.
jal ra,calleRestore

cos:
#Siehe Kommentar calleeSave sin: 

# Preserve saved registers: t0-t6 und s0-s11 -> 19 Register -> 19 * 8 =  152
jal ra,calleSave

# Input
#-------------------
# a1: angle in degree (values between 0 and 90 degree are possible)
#
# Ouput:
# la0: cos(a1)

	#TODO Task 1.2
	
	la t0,.sin_lookup 	#Adresse von .sin_lookup in t0 speichern 
	
	#cos(α) = sin(90 − α)
		li t0,90	#t0 = 90
		sub t1,t0,a1	#t1 = 90 - α
	 
	slli t1,t1,2	#a1 << 2 -> a1 * 4, Speichern in t1
	#Der Wert an der Adresse wird ins Register a0 gespeichert. 
	add t2,t0,t1
	lw a0,(t2)


#############################################
# Do not remove the include below
.include "draw_pixel.asm" # Copies content of draw_pixel.asm here

#############################################
calleSave:
	addi sp,sp, -160
	sw, ra, 152(sp)
	sw, t0, 144(sp)
	sw, t1, 136(sp)
	sw, t2, 128(sp)
	sw, t3, 120(sp)
	sw, t4, 112(sp)
	sw, t5, 104(sp)
	sw, t6, 96(sp)
	sw, s0, 88(sp)
	sw, s1, 80(sp)
	sw, s2, 72(sp)
	sw, s3, 64(sp)
	sw, s4, 56(sp)
	sw, s5, 48(sp)
	sw, s6, 40(sp)
	sw, s7, 32(sp)
	sw, s8, 24(sp)
	sw, s9, 16(sp)
	sw, s10, 8(sp)
	sw, s11, 0(sp)
	
	jr ra

calleRestore:
	
	lw, s11, 0(sp)
	lw, s10, 8(sp)
	lw, s9, 16(sp)
	lw, s8, 24(sp)
	lw, s7, 32(sp)
	lw, s6, 40(sp)
	lw, s5, 48(sp)
	lw, s4, 46(sp)
	lw, s3, 64(sp)
	lw, s2, 72(sp)
	lw, s1, 80(sp)
	lw, s0, 88(sp)
	lw, t6, 96(sp)
	lw, t5, 104(sp)
	lw, t4, 112(sp)
	lw, t3, 120(sp)
	lw, t2, 128(sp)
	lw, t1, 136(sp)
	lw, t0, 144(sp)
	lw ra,152(sp)
	addi sp,sp,160
	
	jr ra
	
	
	
