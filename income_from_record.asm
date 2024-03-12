.macro    nextChar
    # a0 points to next char on entry.
    lbu a1, 0(a0)       # a1 = *nextChar MACRO
    # a1 returns the byte pointed to by a0.
    addi a0, a0, 1        # nextChar++; point to new nextChar
    # a0 now points to the next byte after that one.
.end_macro

.macro print_character(%charRegister)
	li a7, 11 # print_character macro
	addi a0, %charRegister, 0
	ecall
.end_macro


income_from_record:
    
	
# Start your coding from here!
	
lwu t1 0(a0)

li t2, 13 
li t3, 0

loop2:

    lbu a0, 0(t1)
    beq a0, t2, end2
    li t4, 10
    mul t3, t3, t4
    addi a0, a0 -48
    add t3, t3, a0
    addi t1, t1, 1
    j loop2

end2:

    addi a0, t3, 0
   
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
