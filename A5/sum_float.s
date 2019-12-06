	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr
	#   %rdx:   i
	#   %rsp:   Q tailptr
	#   %rcx:   Q headptr
	#   %xmm1:  x
	#   %xmm2:  y
	#   %r8:    original rsp
sum_float:
	push	%rbp			# save rbp on stack		
	mov	%rsp, %r8		# r8=rsp
	xorps	%xmm0, %xmm0            # total <- 0.0
	leaq	(%rdi, %rsi, 4), %rbp   # endptr <- F + n		
	mov	$1, %rdx		# i=1
	mov	%rsp, %rcx		# rcx=rsp
loop:
	cmpq	%rdx, %rsi		
	jl	endloop			# if n<i 
	cmpq	%rdi, %rbp		
	jle	deq_Q_x			# if endptr<=base pointer 
	movss	(%rdi), %xmm1		# x=head(F)
	cmpq	%rsp, %rcx		
	jl	deq_F_x			# if headptr<tailptr
	ucomiss	(%rcx), %xmm1		
	jle	deq_F_x		# if head(F)<=head(Q)
deq_Q_x:
	movss	(%rcx), %xmm1		# x=head(Q)
	leaq	-4(%rcx), %rcx		
	jmp	comp_x_y
deq_F_x:
	leaq	4(%rdi), %rdi		# F++
comp_x_y:
	cmpq	%rdi, %rbp
	jle	deq_Q_y			# if endptr<=base pointer 
	movss	(%rdi), %xmm2		# y=head(F)
	cmpq	%rsp, %rcx
	jl	deq_F_y			# if rsp>rcx
	ucomiss	(%rcx), %xmm2
	jge	deq_F_y			# if head(F)>=head(Q)
deq_Q_y:
	movss	(%rcx), %xmm2		# y=head(Q)
	leaq	-4(%rcx), %rcx		
	jmp	enqueue_x_y
deq_F_y:
	leaq	4(%rdi), %rdi		# F++
enqueue_x_y:
	addss	%xmm2, %xmm1		# x=x+y
	leaq	-4(%rsp), %rsp		# rsp=rsp-4
	movss	%xmm1, (%rsp)		# enqueue x to rsp
	incq	%rdx			# i++
	jmp	loop
endloop:
	movss	(%rsp), %xmm0		# dequeue rsp to total
	movq	%r8, %rsp		# restore original rsp
endtotal:
	pop	%rbp			# restore rbp
	ret
