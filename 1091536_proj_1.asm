.globl main
.data
	endl:	.string"\n"
	Input:	.string"Input a number:\n"
	Output:	.string"The damage:\n"
.text
         # s5 for input N, s11 for output answer, s2=1, s3=10, s4=20
         # t0 as temp
main:
	addi s2, x0, 1      # s2 as 1
	addi s3, x0,10      # s3 as 10 
	addi s4, x0,20      # s3 as 20 
	addi s11,x0, 0      # answer s11 = 0
 	la a0, Input        # load label Input to a0
	li a7, 4            # PrintString at a0, "Input a number:\n
	ecall
	li a7,5             # ReadInt to a0
	ecall
	mv s5,a0            # s5 = input number N
	jal ra, function
	la a0, Output       # load label Output to a0
	li a7, 4            # PrintString at a0, "The damage:\n"
	ecall
	mv a0,s11           # move s11 to a0, s11 is answer
	li a7, 1            # output  Int
	ecall
	li a7, 10           # end program
	ecall

function:
	blt s4,s5, X_20     # 20 < N
	blt s3,s5, X_10_20  # 10 < N <= 20
	blt s2,s5, X_1_10   # 1 < N <= 10
	beq s2,s5, X_1      # 1=N
	beq x0,s5, X_0      # 0=N
	j Other             # otherwise
	
X_20:                       # 20 < N
	addi sp, sp, -8
 	sw ra, 0(sp)
 	sw s5, 4(sp)
 	addi t0,x0,5        # t0 = 5
 	div s5,s5,t0        # N /= 5
 	jal ra, function    # F(N/5)
 	lw ra, 0(sp)
 	lw s5, 4(sp)
 	addi t0, x0,  2     # t0 = 2
	mul  t0, s5, t0     # t0 = N * 2
	add  s11,s11, t0    # s11 += N * 2
 	addi sp,sp,8
 	jalr x0, 0(ra)
X_10_20:                    # 10 < N <= 20
	addi sp, sp, -8
 	sw ra, 0(sp)
 	sw s5, 4(sp)
 	addi s5,s5,-2
 	jal ra, function    # F(N-2)
 	lw s5, 4(sp)
 	addi s5,s5,-3
 	jal ra, function    # F(N-3)
 	lw ra, 0(sp)
 	lw s5, 4(sp)
 	addi sp,sp,8
 	jalr x0, 0(ra)
 	
X_1_10:                     # 1 < N <= 10, same as upper label
	addi sp, sp, -8
 	sw ra, 0(sp)
 	sw s5, 4(sp)
 	addi s5,s5,-1
 	jal ra, function    # F(N-1)
 	lw s5, 4(sp)
 	addi s5,s5,-2
 	jal ra, function    # F(N-2)
 	lw ra, 0(sp)
 	lw s5, 4(sp)
 	addi sp,sp,8
 	jalr x0, 0(ra)
X_1:                        # 1=N
	addi s11,s11,5      # return 5
	jalr x0, 0(ra)
X_0:                        # 0=N
	addi s11,s11,1      # return 1
	jalr x0, 0(ra)
Other:                       # otherwise
	addi s11,s11,-1     # return -1
	jalr x0, 0(ra)
