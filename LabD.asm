not_really_fac:
addi sp, sp, -16
sd x1, 8(sp)	//save the return address
sd x10, 0(sp) //save argument i

addi x5, x10, -3
bge x5, x0, L1

addi x10, x0, 1
addi sp, sp, 16
jalr x0,0(x1)

L1: addi x10, x10,-2	// n >= 3: argument gets (n ? 2)
jal x1, not_really_fac //call not_really_fac with (n-2)

addi x6, x10, 0	// return from jal: move result of fact (n - 2) to x6:
addi x10, x0, 2    //ld x10, 0(sp) (ignore this, add 2 to register 10)
addi x8, x0, 1
ld x1, 8(sp)
addi sp, sp, 16

mul x10, x10, x6	// return 2 * not_really_fac (n ? 2)
add x8, x8, x10	// return 2 * not_really_fac (n ? 2) +1

jalr x0, 0(x1)
