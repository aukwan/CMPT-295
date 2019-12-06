	.globl conv_arr
conv_arr:
	movq $0, %r15		# set r15=0, the loop counter i
	movq %rsi, %r14		# move n to r14
	addq %rcx, %r14		# r14=n+m
	subq $2, %r14		# r14= m+n-2
	jmp loop
loop:
	cmp %r14, %r15		# for i from 0 to n+m-2
	jg endl			# jump if i is greater than n+m-2
	jmp firstmin		
firstmin:
	push %rdi		# save char* x
	push %rsi		# save n 
	movq $1, %rdi		# set 1st arg to 1
	addq %r15, %rdi		# rdi=i+1
	movq %rcx, %rsi		# move m to 2nd arg
	call min		# min(i+1, m)
	movq %rax, %r12		# move result to r12 (ladj)
	jmp secondmin
secondmin:
	pop %rsi		# pop n to rsi	
	movq %rsi, %rdi		# move n to 1st arg
	addq %rcx, %rdi		# rdi=n+m
	subq $1, %rdi		# rdi=n+m-1
	subq %r15, %rdi		# rdi=n+m-1-i
	push %rsi		# save n
	movq %rcx, %rsi		# move m to 2nd arg
	call min		# min(m+n-(i+1), m)
	movq %rcx, %r13		# move m to r13
	subq %rax, %r13		# r13 (radj) = m-min(m+n-(i+1),m) 
	jmp convcall
convcall:
	pop %rsi		# pop n to rsi
	pop %rdi		# pop x to rdi
	push %rdi		# save x
	addq $1, %rdi		# rdi=x+1
	addq %r15, %rdi		# rdi=x+1+i
	subq %r12, %rdi		# rdi=x+1+i-ladj
	push %rsi		# save n
	movq %rdx, %rsi		# move char*h to 2nd arg
	addq %r13, %rsi		# rsi=h+radj
	push %rdx		# save h
	movq %r12, %rdx		# move ladj to 3rd arg
	subq %r13, %rdx		# rdx= ladj-radj
	push %rcx		# save m
	push %r8		# save char* result
	call conv		# conv(x+(i+1-ladj), h+radj, ladj-radj)
	jmp res
res:
	pop %r8			# pop result to r8
	pop %rcx		# pop m to rcx
	pop %rdx		# pop h to rdx
	pop %rsi		# pop n to rsi
	pop %rdi		# pop x to rdi
	push %r8		# save result
	addq %r15, %r8		# r8= result+i
	movb %al, (%r8)		# move conv value to result[i]
	pop %r8			# pop result to r8
	inc %r15		# i=i+1
	jmp loop
endl:
	ret
