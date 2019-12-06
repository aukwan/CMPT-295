	.file	"mul.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Incompatible multiplication: %d x %d times a %d x %d\n"
	.text
	.p2align 4,,15
	.globl	mul
	.type	mul, @function
mul:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	movl	%edx, %r12d
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	%r8d, %edx
	jne	.L29
	movq	%rdi, %rbx
	movl	%r9d, %esi
	movl	%ebp, %edi
	movq	%rcx, %r15
	call	newMatrix@PLT
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L3
	movl	%r12d, %esi
	movl	%r13d, %edi
	call	newMatrix@PLT
	testq	%rax, %rax
	je	.L3
	testl	%r12d, %r12d
	jle	.L4
	leal	-1(%r12), %edx
	leal	-1(%r13), %r8d
	xorl	%ecx, %ecx
	leaq	4(,%rdx,4), %r9
	addq	$1, %r8
	.p2align 4,,10
	.p2align 3
.L5:
	testl	%r13d, %r13d
	jle	.L8
	movq	(%rax,%rcx,2), %rdi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	(%r15,%rdx,8), %rsi
	movl	(%rsi,%rcx), %esi
	movl	%esi, (%rdi,%rdx,4)
	addq	$1, %rdx
	cmpq	%rdx, %r8
	jne	.L6
.L8:
	addq	$4, %rcx
	cmpq	%rcx, %r9
	jne	.L5
.L4:
	testl	%ebp, %ebp
	jle	.L1
	leal	-1(%rbp), %ecx
	leal	-1(%r13), %r15d
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movq	%r14, 8(%rsp)
	leaq	8(%rbx,%rcx,8), %rsi
	leal	-1(%r12), %ecx
	addq	$1, %r15
	leaq	4(,%rcx,4), %rbx
	movq	%rsi, %r14
	.p2align 4,,10
	.p2align 3
.L10:
	testl	%r13d, %r13d
	jle	.L12
	movq	(%rdx), %rbp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%r8d, %r8d
	testl	%r12d, %r12d
	jle	.L14
	movq	(%rdi), %r10
	movq	(%rax,%r11,8), %r9
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%r10,%rcx), %esi
	imull	(%r9,%rcx), %esi
	addq	$4, %rcx
	addl	%esi, %r8d
	cmpq	%rcx, %rbx
	jne	.L11
.L14:
	movl	%r8d, 0(%rbp,%r11,4)
	addq	$1, %r11
	cmpq	%r11, %r15
	jne	.L15
.L12:
	addq	$8, %rdi
	addq	$8, %rdx
	cmpq	%r14, %rdi
	jne	.L10
	movq	8(%rsp), %r14
	jmp	.L1
.L3:
	xorl	%r14d, %r14d
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r14, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	movl	%edx, %ecx
	movl	%esi, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	mul, .-mul
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
