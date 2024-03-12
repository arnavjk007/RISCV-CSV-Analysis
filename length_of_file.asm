length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here


.macro print_str(%str)
        # destroys a7 and a0
	li a7, 4  # print_str macro
	la a0, %str
	ecall
.end_macro

li a0, 0

loop:
	lbu t1, 0(a1)
	beqz t1, end
	addi a0,a0,1
	addi a1,a1,1
	
	j loop

end:
#if no student code provided, this function just returns 0 in a0

#End your coding here
	
	ret
#######################end of length_of_file###############################################	
