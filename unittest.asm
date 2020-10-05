#
#  ██████╗███████╗███████╗██████╗     ██╗     ███████╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
# ██╔════╝██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
# ██║     █████╗  ███████╗██████╔╝    ██║     █████╗  ██║        ██║   ██║   ██║██████╔╝█████╗  
# ██║     ██╔══╝  ╚════██║██╔═══╝     ██║     ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗██╔══╝  
#  ██████╗███████╗███████║██║         ███████╗███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
#  ╚═════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
#
# Copyright 2020 Michael J. Klaiber                                                                                

.globl unittest

.data

test_passed:
	.string "Test passed    \n"
test_not_passed:
	.string "Test NOT passed\n"


.text

unittest:
# Input
# -----------------------
#   a1 : actual result
#   a2 : expected result

# Output
# -----------------------
#   None

	beq  a1,a2, .passed
	la a1, test_not_passed # use string stored @ label test_not_passed
	j _print
	.passed:
	la a1, test_passed
	
	_print:
	li  a0, 1      # 1 = StdOut
        li  a2, 16     # length of  string
        li  a7, 64     # linux write system call
        ecall          # Call linux to output the string
	
	ret
