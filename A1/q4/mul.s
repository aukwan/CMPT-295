	.globl times
times:
	movl $0, %eax	#set the result to be 0
loop:
	addl %edi, %eax	#add %edi to %eax	
	decl %esi	#decrement %esi each time %edi is added to %eax
	cmpl $0, %esi	#compares esi with 0
	je endl		#stops when %esi is equal to 0
	jmp loop	
endl:
	ret

