##################################
#CESP Exercise 2 -- Task 1
##################################

.data
#STEP 1: Register an integer array length 20 (or logner ... it is your choice) as global variabel and initialize it to zero.
#        Hint: Use an assembler directive and a label (use the name fibonacci for the label).
.align 2
# ADD YOUR STEP 1 CODE HERE
.globl fibonacci

fibonacci: 
	.space 80		#dem Lable fibonacci 20 * 4 Byte speicher bereit gestellt

.text

main:
	#STEP 2: Implement the call of the fib function
	#        Hints: 
	#              1) Pass the address of the global variable called "fibonacci" and the constant "n" that defines the length via the correct registers to function fib
	#              2) Use 
	
	# ADD YOUR STEP 2 CODE HERE
	la a1,fibonacci		#die Adresse von fibonacci[0] in a1 speichern
	li a2, 20		#a1 = n = 20, Argument bei Funktionsaufruf
	jal ra,fib		#jump and link, gehe zum Unterprogramm fib und speicher Ruecksprungadresse in ra.
	
	
	#STEP 6: Print the results
	
	# ADD YOUR STEP 6 CODE HERE
	
	#STEP 7: OS Call to exit program

	# ADD YOUR STEP 7 CODE HERE

# The function fib expects the following arguments
# a1: address to array
#      -- in C Code: int* result 	
# a2: integer number that indicates number of Fibonacci number to be calculated
#      -- inC Code: int n
fib:
	#STEP 3: First initialize fibonacci[0] and fibonacci[1] with 1 dependent on argument n

	# ADD YOUR STEP 3 CODE HERE
	li t1,1			#den Wert 1 in t1 speichern
	
	ble a2,zero,exit	#Wenn n > 0 --> result[0] = 1 // Wnen n <= 0 --> exit
	sw t1,0(a1)		#den Wert 1 in fibonacci[0] speichern
	ble a2, t1,exit		#Wenn n > 1 --> result[1] = 1 // Wnen n <= 1 --> exit
	sw t1,4(a1)		#den Wert 1 in fibonacci[0] speichern
	
	exit: 
		add zero, zero, zero
		
	li t1,2		# t1 = j = 2	
	li t2,8 	#j = 2 = 8 Byte
	li t3,4
_fib_for_loop:
	#STEP 4: implement a for loop calculate fibonacci[2] ... fibonacci[n-1] if applicable
	#for(j = 2, j < n,j++)
	# ADD YOUR STEP 4 CODE HERE
	
	bge  t1,a1,for_loop_exit	#Exit for loop when j >= n 
	
	add s1, a1,zero
	add s1, s1, t2 
	
	addi t4, s1, -8
	addi t5, s1, -4
		
	lw a4,(t4)
	lw a5,(t5)
	
	add a6,a4,a5	#j
	
	sw a6,(s1)
	
	
	
	addi t2,t2,4 		#j++ Byte
	addi t3,t3,4		#j++ Byte
	addi t1,t1,1		#j++ dezi
	beq zero,zero,_fib_for_loop	#neuer Schleifendurchgang
	
	for_loop_exit: 
		add zero,zero,zero
		
_fib_end:
	#STEP 5: Jump back into main using the address you have saved before
