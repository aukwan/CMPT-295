	.globl sqrt
sqrt:
	movl $0, %eax
	movq $0x8000, %rdx	# Creating bit mask (1000 0000 0000 0000)
	movq $15, %rcx		# Loop counter 
loop:
	cmpq $0, %rcx		# rcx-0=?0
	jb endl			# jump to end when rcx=0
	xorq %rdx, %rax		# Setting specific bit to 1
	movq %rax, %r8		# moving result to r8
	imulq %r8, %r8		# r8^2
	cmpq %r8, %rdi		# rdi-r8^2=?0
	jae bitshift		# jump to bitshift is rdi>=r8^2
	xorq %rdx, %rax		# unset bit 
	decq %rcx		# Decrement loop counter
bitshift:
	shrq $1, %rdx		# shifts to next bit
	jnz loop		# jump back to loop
	
endl:
	ret
