minIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for both a0, a1
	bnez a1, minIncome_fileNotEmpty # minIncome function
	li a0, 0
	ret

 minIncome_fileNotEmpty:
	
	.macro print_Int(%IntRegister)
	li a7, 1  # print_Int macro
	addi a0, %IntRegister, 0
	ecall
	.end_macro
	
	.macro add_eight(%IntRegister)
	mul a7, s0, a6
	sub a0, a0, a7
	li a7, 0
	addi s0, a3, 0
	add_loop2:
		beq a7, a3, end_add2
		addi a0,a0,8
		addi a7,a7,1
		j add_loop2
	end_add2:
		addi t0, t5, 0
		addi t1, t1, 1
		addi a3,a3,1
		j find_min_loop
	.end_macro

	lwu t1, 0(a0)
	li t2, 44
	li t4, 13
	li t0, 0
	li a3, 0
	li a4, 0
	li a5, 0
	li a6, 8
	li s0, 0
	
	find_min_loop:
		bge a3, a1, end_min_all
		lbu t3, 0(t1)
		beq t3, t2, end_min_loop
		addi t1,t1,1

		j find_min_loop
	end_min_loop:
		li t4, 13
		li t5, 0
		li t6, 10
		addi t1,t1,1
		inner_loop2:
			lbu t3, 0(t1)
			
			beq t3, t4, compare1
			mul t5, t5, t6
		
			addi t3, t3, -48
		
			add t5,t3,t5

			addi t1,t1,1
			j inner_loop2
		
		compare1:
			beq a3, a5, store_start1
			ble t5, t0, store1
			addi t1,t1,1
			addi a3,a3,1
			j find_min_loop
			
		store_start1:
			addi t0, t5, 0
			addi t1, t1, 1
			addi a3,a3,1
			j find_min_loop
	
		store1:
			add_eight(a3)
			
	end_min_all:
			
		ret
#######################end of minIncome###############################################
