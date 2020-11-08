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


.globl unittest_int
.globl unittest_float

.data

test_passed:
	.string "Test passed    \n"
test_not_passed:
	.string "Test NOT passed\n"


.text

unittest_int:
# Input
# -----------------------
#   a1 : actual result
#   a2 : expected result

# Output
# -----------------------
#   None

	beq  a1,a2, _passed
	la a1, test_not_passed # use string stored @ label test_not_passed
	j _print
	_passed:
	la a1, test_passed

	_print:
	li  a0, 1      # 1 = StdOut
        li  a2, 16     # length of  string
        li  a7, 64     # linux write system call
        ecall          # Call linux to output the string



	ret



unittest_float:
# Input
# -----------------------
#   fa1 : actual result
#   fa2 : expected result

# Output
# -----------------------
#   None
	feq.s t0, fa1, fa2
	bne  t0, zero, _passed_float
	la a1, test_not_passed # use string stored @ label test_not_passed
	j _print_float
	_passed_float:
	la a1, test_passed

	_print_float:
	li  a0, 1      # 1 = StdOut
        li  a2, 16     # length of  string
        li  a7, 64     # linux write system call
        ecall          # Call linux to output the string

	ret
