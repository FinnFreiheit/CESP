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

###########################

li a1, 128
li a2, 128
li, a4, 15
li a3, 0x00ff00
jal circle_int

li a1, 128
li a2, 128
li, a4, 20
li a3, 0x00ffff
jal circle_int

li a1, 128
li a2, 128
li, a4, 25
li a3, 0xffff00
jal circle_int

li a1, 128
li a2, 128
li, a4, 30
li a3, 0xffffff
jal circle_int
