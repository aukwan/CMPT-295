	# var map:
	#	%rdi - int* A
	#	%esi - int n
	#	%edx - int target
	#	%ecx, %r8d - int i
	#	%r9d - int tmp
	#	%eax - int target_location
	.globl	lsearch_2
lsearch_2:
	testl	%esi, %esi
	jle	not_found		#if n<=0
	movslq	%esi, %rax
	leaq	-4(%rdi,%rax,4), %rax	
	movl	(%rax), %r9d		#tmp <- A[n-1]
	movl	%edx, (%rax)		#A[n-1] <- target
	cmpl	(%rdi), %edx		
	je	first_value_equal	#A[0]==target
	movl	$1, %ecx		#i <- 1
loop:
	movl	%ecx, %r8d
	addq	$1, %rcx		#i <- i+1
	cmpl	%edx, -4(%rdi,%rcx,4)
	jne	loop			#while A[i] != target do
return_call:
	movl	%r9d, (%rax)		#A[n-1] <- tmp
	leal	-1(%rsi), %eax
	cmpl	%r8d, %eax
	jg	target_found
	cmpl	%edx, %r9d		#A[n-1]==target or i<n-1 
	jne	not_found
	rep ret
target_found:
	movl	%r8d, %eax
	ret				#return i or n-1
first_value_equal:
	xorl	%r8d, %r8d
	jmp	return_call
not_found:
	movl	$-1, %eax
	ret				#return -1

