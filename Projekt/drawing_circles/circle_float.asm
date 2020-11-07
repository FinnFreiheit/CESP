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




main_float:

li a1, 30
li a2, 30
li, a4, 19
li a3, 0x0000ff
jal circle_float

li a1, 128
li a2, 128
li, a4, 25
li a3, 0x00ff00
jal circle_float

li a1, 128
li a2, 128
li, a4, 30
li a3, 0xffffff
jal circle_float

	
	# Exit
	li a0, 0
	li a7, 93
	ecall

circle_float:
# Inputs
#------------------
# a1: xc coordinate
# a2: yc coordinate
# a3: color
# a4: radius in pixels
	#TODO Task 1.4
	add s7,zero,ra
	jal ra,calleSave
	
	li s6,90	#t2 = 90
	li t1,0 	#Alpha = 0

	#for(int α=0; α≤90;α++)
	Circle_float_loop:
		bgt t1,s6,endCircle
		
		#float x = radius × cos(α)
		#a1 zwischenspeichern in s11
		add s11,zero,a1
		#a1 = t1, für den cos aufruf.
		add a1,zero,t1
		jal ra,cos	#nach aufruf von cos, Wert in ao.	
		#Radius in float.
		fcvt.s.w fa4,a4
		#cos in float
		fmv.s.x fa0,a0
		fmul.s fs1,fa4,fa0	#s1 = float x = radius * cos(alpha)
	
		#float y = radius × sin(α)
		jal ra,sin	#nach aufruf von sin, Wert in ao.
		fmv.s.x fa0,a0	
		fmul.s fs2,fa4,fa0	#s2 = float x = radius * sin(alpha)
		#a1 wider herstellen aus s11
		add a1,zero,s11
		
		
		fcvt.s.w fa1,a1
		# t3 = xc + x
		fadd.s ft3,fa1,fs1	# a1 = xc, s1 = float x
		# t4 = xc - x
		fsub.s ft4,fa1,fs1	# a1 = xc, s1 = float x
		
		fcvt.s.w fa2,a2
		# t5 = yc + y
		fadd.s ft5,fa2,fs2	#a2 = yc, s2 = float y
		# t6 = yc - y
		fsub.s ft6,fa2,fs2	#a2 = yc, s2 = float y
		
		#callerSave a1,a2
		addi sp,sp,-16	#stackspeicher bereitstellen
		sw a1,8(sp)	#a1 im Stack speichern
		sw a2,0(sp)	#a2 im Stack speichern
		
		#draw_pixel(xc + x, yc + y, color);
		
		fcvt.w.s a1,ft3
		
		#add a2,zero,ft5	#a2 = yc + y = t5	
		fcvt.w.s a2,ft5
		#Funktionsaufruf draw_pixel
		jal ra,draw_pixel 
		
		#draw_pixel(xc − x, yc + y, color);
		#add a1,zero,t4	#a1 = xc - x = t4
		fcvt.w.s a1,ft4
		#Wert von a2 stimmt bereits überein
		#Funktionsaufruf draw_pixel
		jal ra,draw_pixel 
		
		#draw_pixel(xc + x, yc − y, color);
		#add a1,zero,t3	#a1 = xc + x = t3
		fcvt.w.s a1,ft3
		#add a2,zero,t6 	#a2 = yc - y = t6
		fcvt.w.s a2,ft6
		#Funktionsaufruf draw_pixel
		jal ra,draw_pixel 
		
		#draw_pixel(xc − x, yc − y, color);
		#add a1,zero,t4	#a1 = xc - x = t4
		fcvt.w.s a1,ft4
		#add a2,zero,t6 	#a2 = yc - y = t6
		fcvt.w.s a2,ft6
		#Funktionsaufruf draw_pixel
		jal ra,draw_pixel 
		
		#callerRestore a1,a2
		lw a2,0(sp)	#a1 im Stack speichern
		lw a1,8(sp)	#a2 im Stack speichern
		addi sp,sp,16	#stackspeicher freistellen
		
		#Alpha Inkrement
		addi t1,t1,1	#alpha++
		
		beq zero,zero,Circle_float_loop
		
endCircle:
add ra,zero,s7
jr ra	
	
sin:
#Beim Aufrufen dieser Funktion werden alle temp und save Register in den Stack gespeichert. In den Test Dateien findet kein caller save 
#statt, somit muss ein callee save ausgeführt werden. 

## Preserve saved registers: t0-t6 und s0-s11 -> 19 Register -> 19 * 8 =  152
#ra speichern
add s10,zero,ra
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
	slli t1,a1,2	#a1 << 2 -> a1 * 4, Speichern in t1 (Optimierung)
	#Der Wert an der Adresse wird ins Register a0 gespeichert. 
	
	#erzeugen der richtigen Adresse
	add t2,t0,t1
	lw a0,(t2)

#Funktion ist abgeschlossen, somit muss das Register wider aus dem Stack restort werden.
jal ra,calleRestore

add ra,zero,s10
jr ra


cos:
#Siehe Kommentar calleeSave sin: 

# Preserve saved registers: t0-t6 und s0-s11 -> 19 Register -> 19 * 8 =  152
#Zwischenspeichern ra
add s10,zero,ra
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
		li t3,90	#t0 = 90
		sub t1,t3,a1	#t1 = 90 - α
	 
	slli t1,t1,2	#a1 << 2 -> a1 * 4, Speichern in t1
	#Der Wert an der Adresse wird ins Register a0 gespeichert. 
	add t2,t0,t1
	lw a0,(t2)
jal ra,calleRestore

add ra,zero,s10
jr ra #Zurück zurück circle-Float

#############################################
# Do not remove the include below
.include "draw_pixel.asm" # Copies content of draw_pixel.asm here
jr ra
#############################################
calleSave:
	addi sp,sp, -160
	
	sw t0, 144(sp)
	sw t1, 136(sp)
	sw t2, 128(sp)
	sw t3, 120(sp)
	sw t4, 112(sp)
	sw t5, 104(sp)
	sw t6, 96(sp)
	sw s0, 88(sp)
	sw s1, 80(sp)
	sw s2, 72(sp)
	sw s3, 64(sp)
	sw s4, 56(sp)
	sw s5, 48(sp)
	sw s6, 40(sp)
	sw s7, 32(sp)
	sw s8, 24(sp)
	sw s9, 16(sp)
	sw s10, 8(sp)
	sw s11, 0(sp)

	jr ra

calleRestore:
	
	lw s11, 0(sp)
	lw s10, 8(sp)
	lw s9, 16(sp)
	lw s8, 24(sp)
	lw s7, 32(sp)
	lw s6, 40(sp)
	lw s5, 48(sp)
	lw s4, 56(sp)
	lw s3, 64(sp)
	lw s2, 72(sp)
	lw s1, 80(sp)
	lw s0, 88(sp)
	lw t6, 96(sp)
	lw t5, 104(sp)
	lw t4, 112(sp)
	lw t3, 120(sp)
	lw t2, 128(sp)
	lw t1, 136(sp)
	lw t0, 144(sp)
	
	addi sp,sp,160
	
	jr ra
	
	
	
