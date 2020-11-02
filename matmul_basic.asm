#
#  ██████╗███████╗███████╗██████╗     ██╗     ███████╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
# ██╔════╝██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
# ██║     █████╗  ███████╗██████╔╝    ██║     █████╗  ██║        ██║   ██║   ██║██████╔╝█████╗  
# ██║     ██╔══╝  ╚════██║██╔═══╝     ██║     ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗██╔══╝  
#  ██████╗███████╗███████║██║         ███████╗███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
#  ╚═════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
#
# Copyright 2020 Michael J. Klaiber
                                    

#############################################
#CESP Exercise 6: Cache-aware programming   #
#############################################


.data:
variables:
.word 16 # Size (of matrix)
.word 4 # Tile (size)

A:
.word 04 03 01 01 04 00 04 00 03 00 03 00 02 00 02 03
.word 03 01 01 04 03 00 00 02 01 00 03 02 03 00 03 00
.word 00 03 01 03 01 01 00 01 03 02 01 02 04 01 04 01
.word 04 02 02 02 02 01 04 03 04 03 03 01 03 00 01 00
.word 03 03 04 03 02 04 04 03 04 03 04 02 03 02 01 02
.word 02 04 02 01 02 02 02 01 02 03 01 00 03 02 03 03
.word 02 04 01 00 02 04 01 02 04 03 03 03 04 03 03 04
.word 03 00 04 00 03 03 02 04 03 00 03 00 01 04 03 01
.word 00 01 03 02 04 02 03 02 03 04 03 04 04 01 04 04
.word 03 04 03 03 03 01 04 04 00 03 03 04 01 03 01 00
.word 01 03 00 02 03 04 01 01 00 03 02 04 02 02 04 02
.word 03 03 00 04 01 01 02 01 02 04 03 04 01 00 02 01
.word 03 01 00 00 01 01 01 01 00 02 02 02 02 01 00 03
.word 01 04 02 04 01 04 01 02 04 03 01 02 03 04 00 01
.word 00 03 03 01 01 03 01 01 00 00 04 00 03 03 03 02
.word 03 00 03 04 03 00 02 04 02 01 00 04 01 04 01 04
B:
.word 02 01 01 04 01 04 03 03 04 01 03 00 03 02 02 03
.word 04 04 03 03 03 04 04 03 02 02 04 04 01 04 01 00
.word 04 02 02 04 04 03 01 03 00 02 00 03 04 00 03 01
.word 02 03 03 02 04 04 01 04 00 00 03 03 00 02 03 00
.word 00 04 01 01 03 01 00 02 02 00 02 01 01 01 01 02
.word 03 00 04 04 02 01 03 02 02 00 01 04 00 02 02 03
.word 04 03 04 02 01 04 03 03 02 02 04 00 00 02 03 04
.word 00 02 02 01 04 02 00 01 02 00 00 01 04 04 00 03
.word 02 00 03 00 03 00 03 01 04 01 01 00 04 04 00 02
.word 00 00 03 04 00 04 03 02 04 00 01 04 01 03 03 03
.word 01 00 03 00 04 02 01 02 03 00 01 00 00 02 02 00
.word 02 01 00 04 00 04 00 04 04 03 02 00 04 04 01 00
.word 04 00 02 00 00 00 00 01 01 00 03 02 00 01 00 04
.word 01 01 01 04 01 01 00 02 03 04 02 00 01 00 04 03
.word 03 04 01 00 02 02 03 03 00 03 03 02 00 04 00 04
.word 03 01 03 03 03 03 01 04 02 03 02 04 04 04 03 02

.align 5 # Alginment to next visible row in RARS memory viewer
C:
.space 1024

#Expected Result for A*B = C:
#[[ 74  60  71  52  71  74  59  77  67  38  75  42  47  74  48  65]
# [ 52  51  48  40  64  62  33  66  48  23  57  36  37  62  33  48]
# [ 68  49  61  48  59  61  48  68  52  36  62  58  39  77  35  58]
# [ 75  53  85  67  76  87  66  79  84  30  71  49  59  86  54  79]
# [107  68 117 106 108 114  82 113 105  52  89  82  79 110  85  97]
# [ 81  58  79  74  69  79  65  81  68  46  73  72  49  82  57  78]
# [ 97  57  98  94  86  92  75 101 104  60  85  81  74 115  66  95]
# [ 68  54  72  70  86  65  50  74  72  46  54  43  64  70  58  84]
# [ 96  70  98  87  92 102  64 110  92  57  84  81  74 112  71  96]
# [ 80  77  85 101  87 116  61 104  91  52  83  61  66  93  76  75]
# [ 72  60  72  81  64  85  57  90  74  47  74  70  42  90  56  71]
# [ 65  52  73  74  64  97  62  88  80  36  72  56  49  92  55  55]
# [ 41  22  43  52  34  54  30  52  55  26  42  34  38  51  38  44]
# [ 82  51  91  92  80  84  63  87  84  44  72  75  59  87  68  72]
# [ 73  47  67  57  70  58  43  68  46  41  56  58  31  58  51  58]
# [ 69  63  68  91  82  94  38  98  79  58  68  52  85  85  71  73]]


.text:

	
    
main:
    la gp, variables # The global pointer (gp) register is update to the address of the constants label as the display always reads from address 0x10010000 (which is .data)

    la a1, A
    la a2, B
    la a3, C

    jal matmul

    # Exit
    li a0, 0
    li a7, 93
    ecall

    
matmul:

    # Push the callee save registers to the stack
    sw s0,    (sp)
    sw s1,  -4(sp)
    sw s2,  -8(sp)
    sw s3, -12(sp)
    sw s4, -16(sp)
    sw s5, -20(sp)
    sw s6, -24(sp)
    sw s7, -28(sp)
    sw s8, -32(sp)
    addi sp, sp, -40
	
    # Register to variable mapping
    # s0: A
    # s1: B
    # s2: C
    # s5: y
    # s4: x
    # s6: k
    # s7: tx (suggestion)
    # s8: ty (suggestion)
    
    # t0: size (of matrix)
    # t1: tile (size)

       
    lw t0, 0(gp) #  t0 = matrix width
    lw t1, 4(gp) # t1 = tile size
    mv s0, a1 # A
    mv s1, a2 # B
    mv s2, a3 # C

    #for(y=0;y<size;++y)
    #{
    li s5, 0
    loopy_start:
    bge s5, t0, loopy_end # break condition

        #for(x=0;x<size;++x)
        li s4, 0
        loopx_start:
    	bge s4, t0, loopx_end 
        
                #for(k=0;k<size;++k)
        	li s6, 0
        	loopk_start:

    		bge s6, t0, loopk_end 
    			# STEP 1: Add the two new inner loops for tx and ty
    			#for (int ty=0; ty<tile;ty++){
    			li s8,0
    			start_ty:
    			bge s8,t1,end_ty
                		#for (int tx=0; tx<tile;tx++){
                		li s7,0
                		start_tx:
                		bge s7,t1,end_tx
                		
                		
                		
    				# STEP 2: Update the address calculation below
    		
    				#C[x+tx][y+ty] += A[x+tx][k] * B[k][y+ty];
    				# STEP 3: Dont forget to set tile = 4 in the .data section    		   		
    			    		
    				# a[x,k]
    				# TODO a[x+tx,k]
    				#s6 = k
    				add s3 ,s4, s7  # s3 = x + tx
    				mul t2, s3, t0  #s4 = x; t0 = size of Matrix (16)
    				add t2, t2, s6  #s6 = k
    				slli t2,t2,2
    				add t2, t2, s0  #s0 = A
    				lw t2, 0(t2)
    			
    				#b[k, y]
    				#TODO b[k, y+ty]
    				add s9 ,s5, s8  #y = y + ty
    				mul t3, s6, t0
    				add t3, t3, s9
    				slli t3, t3, 2
    				add t3, t3, s1
    				lw t3, 0(t3)
    			
    				#c[x,y]
    				#TODO c[x+tx, y+ty]
    		
    				mul t4, s3, t0
    				add t4, t4, s9
    				slli t4, t4, 2
    				add t4, t4, s2
    				lw t5, 0(t4)
    				mul t6, t2, t3
    				add t5, t5, t6
    				sw t5, (t4)
    		    		 
    		    		addi s7,s7,1
    		    		j start_tx
    		    		end_tx:
    		    		
    		    	addi s8, s8, 1
    		    	j start_ty
    		    	end_ty:  		
    		    	
        	addi s6, s6, 1
        	j loopk_start
        	loopk_end:
          
        add s4, s4, t1
        j loopx_start
        loopx_end:
        #}
    add s5, s5, t1
    j loopy_start
    loopy_end:

    #Pop callee save register from stack
    addi sp, sp, 40
    lw s0,    (sp)
    lw s1,  -4(sp)
    lw s2,  -8(sp)
    lw s3, -12(sp)
    lw s4, -16(sp)
    lw s5, -20(sp)
    lw s6, -24(sp)
    lw s7, -28(sp)
    lw s8, -32(sp)

    jr ra








# Tiled Matrix
# Tile = 4
#Direct mapped	
# Number of blocks: 1	block size: 128		hit Rate 25%
# Number of blocks: 2	block size: 64		hit Rate 39%
# Number of blocks: 4	block size: 32		hit Rate 46%
# Number of blocks: 8	block size: 16		hit Rate 49%
# Number of blocks: 16	block size: 8		hit Rate 70%
# Number of blocks: 32	block size: 4		hit Rate 82%
# Number of blocks: 64	block size: 2		hit Rate 86%
# Number of blocks: 128	block size: 1		hit Rate 82%

#Fully Associative	
# Number of blocks: 1	block size: 128		hit Rate 25%
# Number of blocks: 2	block size: 64		hit Rate 25%
# Number of blocks: 4	block size: 32		hit Rate 70%
# Number of blocks: 8	block size: 16		hit Rate 49%
# Number of blocks: 16	block size: 8		hit Rate %
# Number of blocks: 32	block size: 4		hit Rate %
# Number of blocks: 64	block size: 2		hit Rate %
# Number of blocks: 128	block size: 1		hit Rate %





