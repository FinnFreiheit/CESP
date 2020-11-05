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
.include "circle_float.asm"
.include "unittest_intfloat.asm"


main_test:

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


############################
#   SIN
############################
# sin(17)=0.275637
li a1, 17
jal sin
li t0, 0x3e95b1be
fmv.s.x fa1, t0
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float

# sin(8.000000)=0.139173
li a1, 8
jal sin
li t0, 0x3e0e8365
fmv.s.x fa1, t0
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float

# sin(88.000000)=0.999391
li a1, 88
jal sin
li t0, 0x3f7fd814
fmv.s.x fa1, t0
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float

############################
#   COS
############################


# cos(60.000000)=0.500000
li a1, 73
jal cos
li a1, 0x3e95b1be
fmv.s.x fa1, a1
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float

# cos(82.000000)=0.139173
li a1, 82
jal cos
li a1, 0x3e0e8365
fmv.s.x fa1, a1
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float


# cos(2.000000)=0.999391
li a1, 2
jal cos
li a1, 0x3f7fd814
fmv.s.x fa1, a1
fmv.s.x fa2, zero
fadd.s fa2, fa2, fa0
jal unittest_float



############################
#   DRAW CIRCLE FLOAT
############################


#Test if the following addresses are set as circumference of the circle


li a1, 30
li a2, 30
li, a4, 19
li a3, 0x00ff00
jal circle_float

li a1, 30
li a2, 30
li, a4, 20
li a3, 0x00ff00
jal circle_float

li a1, 30
li a2, 30
li, a4, 21
li a3, 0x00ff00
jal circle_float


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
