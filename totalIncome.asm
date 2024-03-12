totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty # totalIncome function
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	
	# Start your coding from here!
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

.macro popw(%reg)
       lwu %reg, 0(sp)
       addi sp, sp, 4
.end_macro

.macro print_str(%str)
        # destroys a7 and a0
	li a7, 4  # print_str macro
	la a0, %str
	ecall
.end_macro

.macro find_income()
	
	li t2, 44
	find_income_loop:
		lbu t3, 0(t1)
		beq t3, t2, end_income_loop
		addi t1,t1,1
		j find_income_loop
	end_income_loop:
		li t4, 13
		li t5, 0
		li t6, 10
		addi t1,t1,1
		inner_loop:
			lbu t3, 0(t1)
			
			beq t3, t4, end_all
			mul t5, t5, t6
		
			addi t3, t3, -48
		
			add t5,t3,t5

			addi t1,t1,1
			j inner_loop
	end_all:
		add a2, a2, t5
		
.end_macro

	#if no student code entered, a0 just returns 0 always :(

	li t0,1
	li a2,0
	lwu t1, 0(a0)
	
	loop3:
		
		bgt t0, a1, end3
		
		find_income()
		addi t1,t1,1
		
		addi t0,t0,1
		j loop3
	end3:
		mv a0, a2
	
# End your  coding  here!
	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
