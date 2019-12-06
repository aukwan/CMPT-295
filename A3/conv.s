	.globl conv
conv:
	movb $0, %al	# set the return value al=0
	movq %rdx, %r8	# set r8 to be the length
	jmp reverse
reverse:		# move the pointer for second array to the last element
	decq %r8
	cmpq %r8, %rax
	jge loop
	incq %rsi
	jmp reverse
loop:
	movq (%rdi), %r8
	imul (%rsi), %r8
	addq %r8, %rax
	incq %rdi
	decq %rsi
	decq %rdx
	movq $0, %r8
	cmpq %r8, %rdx
	jg loop
	ret
