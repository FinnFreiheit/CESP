.data 
.include "sinlut.asm"
.text
la t1,.sin_lookup
addi t2,t1,4
lw t0,(t2)
