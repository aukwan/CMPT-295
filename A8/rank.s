	.file	"rank.c"
	.text
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L62
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm9, %xmm9
	leal	-4(%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%r12d, %r12d
	cvtsi2ss	%esi, %xmm9
	jle	.L66
	leal	-2(%rsi), %eax
	pxor	%xmm8, %xmm8
	pxor	%xmm7, %xmm7
	movq	%rdi, %r10
	shrl	%eax
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	leaq	8(%rdi,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L37:
	cmpl	$1, %esi
	movl	$1, (%rdx)
	movl	$1, 4(%rdx)
	movl	$1, 8(%rdx)
	movl	$1, 12(%rdx)
	movl	$1, 16(%rdx)
	movss	(%r10), %xmm6
	movss	4(%r10), %xmm5
	movss	8(%r10), %xmm4
	movss	12(%r10), %xmm3
	movss	16(%r10), %xmm2
	je	.L5
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L26:
	movss	(%rax), %xmm1
	ucomiss	%xmm6, %xmm1
	jbe	.L6
	addl	$1, (%rdx)
.L6:
	movss	4(%rax), %xmm0
	ucomiss	%xmm6, %xmm0
	jbe	.L8
	addl	$1, (%rdx)
.L8:
	ucomiss	%xmm5, %xmm1
	jbe	.L10
	addl	$1, 4(%rdx)
.L10:
	ucomiss	%xmm5, %xmm0
	jbe	.L12
	addl	$1, 4(%rdx)
.L12:
	ucomiss	%xmm4, %xmm1
	jbe	.L14
	addl	$1, 8(%rdx)
.L14:
	ucomiss	%xmm4, %xmm0
	jbe	.L16
	addl	$1, 8(%rdx)
.L16:
	ucomiss	%xmm3, %xmm1
	jbe	.L18
	addl	$1, 12(%rdx)
.L18:
	ucomiss	%xmm3, %xmm0
	jbe	.L20
	addl	$1, 12(%rdx)
.L20:
	ucomiss	%xmm2, %xmm1
	jbe	.L22
	addl	$1, 16(%rdx)
.L22:
	ucomiss	%xmm2, %xmm0
	jbe	.L24
	addl	$1, 16(%rdx)
.L24:
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L26
.L5:
	addss	%xmm6, %xmm7
	ucomiss	.LC1(%rip), %xmm6
	addss	%xmm5, %xmm7
	addss	%xmm4, %xmm7
	addss	%xmm3, %xmm7
	addss	%xmm2, %xmm7
	jb	.L27
	addss	%xmm6, %xmm8
	addl	$1, %ebx
.L27:
	ucomiss	.LC1(%rip), %xmm5
	jb	.L29
	addss	%xmm5, %xmm8
	addl	$1, %ebx
.L29:
	ucomiss	.LC1(%rip), %xmm4
	jb	.L31
	addss	%xmm4, %xmm8
	addl	$1, %ebx
.L31:
	ucomiss	.LC1(%rip), %xmm3
	jb	.L33
	addss	%xmm3, %xmm8
	addl	$1, %ebx
.L33:
	ucomiss	.LC1(%rip), %xmm2
	jb	.L35
	addss	%xmm2, %xmm8
	addl	$1, %ebx
.L35:
	addl	$5, %ebp
	addq	$20, %rdx
	addq	$20, %r10
	cmpl	%ebp, %r12d
	jg	.L37
	testl	%ebx, %ebx
	divss	%xmm9, %xmm7
	je	.L4
	pxor	%xmm0, %xmm0
	cvtsi2ss	%ebx, %xmm0
	divss	%xmm0, %xmm8
.L4:
	movl	%ebx, (%r9)
	movss	%xmm7, (%rcx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	movss	%xmm8, (%r8)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
.L66:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	pxor	%xmm8, %xmm8
	xorl	%ebx, %ebx
	movaps	%xmm8, %xmm7
	divss	%xmm9, %xmm7
	jmp	.L4
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1112014848
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~16.04~ppa1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
