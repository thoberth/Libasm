segment .text
	global	ft_read
	extern	__errno_location

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl ret_err
	ret

ret_err:
	neg rax
	mov rdi, rax
	call __errno_location WRT ..plt
	mov [rax], rdi
	mov rax, -1
	ret