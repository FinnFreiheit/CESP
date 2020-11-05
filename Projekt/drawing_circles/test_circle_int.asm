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



j main_test
.include "circle_int.asm"
.include "unittest_intfloat.asm"


main_test:

#####################################
#   DRAW Markers in each corner
#####################################

li a1, 1
li a2, 1
li a3, 0xffff00
jal draw_pixel

li a1, 254
li a2, 1
li a3, 0xffff00
jal draw_pixel

li a1, 1
li a2, 254
li a3, 0xffff00
jal draw_pixel

li a1, 254
li a2, 254
li a3, 0xffff00
jal draw_pixel


############################
#   DRAW CIRCLE INT
############################


#Test if the following addresses are set as circumference of the circle


li a1, 30
li a2, 30
li, a4, 19
li a3, 0x00ff00
jal circle_int

li a1, 30
li a2, 30
li, a4, 20
li a3, 0x00ff00
jal circle_int

li a1, 30
li a2, 30
li, a4, 21
li a3, 0x00ff00
jal circle_int


# Values for Circle at 20,20 radius=20 color: 0x00ff00
li t1, 0x10012870
lw a2, (t1)
mv a1, a3
jal unittest_int
li t1, 0x100158c0
lw a2, (t1)
mv a1, a3
jal unittest_int
li t1, 0x1001AC3C
lw a2, (t1)
mv a1, a3
jal unittest_int
li t1, 0x1001ACB4
lw a2, (t1)
mv a1, a3
jal unittest_int
li t1, 0x1001C464
lw a2, (t1)
mv a1, a3
jal unittest_int
li t1, 0x1001C490
lw a2, (t1)
mv a1, a3
jal unittest_int


# Exit
li a0, 0
li a7, 93
ecall

# Exit
li a0, 0
li a7, 93
ecall
