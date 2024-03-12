maxIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty # maxIncome Function
	li a0, 0
	ret

 maxIncome_fileNotEmpty:
	
	.macro print_character(%charRegister)
	li a7, 11 # print_character macro
	addi a0, %charRegister, 0
	ecall
	.end_macro
	
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
	add_loop:
		beq a7, a3, end_add
		addi a0,a0,8
		addi a7,a7,1
		j add_loop
	end_add:
		addi t0, t5, 0
		addi t1, t1, 1
		addi a3,a3,1
		j find_max_loop
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
	
	
	find_max_loop:
		bge a3, a1, end_max_all
		lbu t3, 0(t1)
		beq t3, t2, end_max_loop
		addi t1,t1,1

		j find_max_loop
	end_max_loop:
		li t4, 13
		li t5, 0
		li t6, 10
		addi t1,t1,1
		inner_loop1:
			lbu t3, 0(t1)
			
			beq t3, t4, compare
			mul t5, t5, t6
		
			addi t3, t3, -48
		
			add t5,t3,t5

			addi t1,t1,1
			j inner_loop1
		
		compare:
			beq a3, a5, store_start
			bge t5, t0, store
			addi t1,t1,1
			addi a3,a3,1
			j find_max_loop
			
		store_start:
			addi t0, t5, 0
			addi t1, t1, 1
			addi a3,a3,1
			j find_max_loop
	
		store:
			add_eight(a3)
			
			
	end_max_all:

	
		

		
			
		
	
	
	
	
	
# End your  coding  here!
	
	ret
#######################end of maxIncome###############################################
