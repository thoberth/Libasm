segment .text
	global ft_strcpy
	extern	ft_strlen

ft_strcpy:					;(arg0 = rdi = dst, arg1 = rsi = src)
	push rdi
	mov rdi, rsi
	call ft_strlen
	pop rdi
	mov byte[rdi + rax], 0
	mov rax, 0

copy:
	cmp byte[rsi + rax], 0
	je exit
	mov cl, byte[rsi + rax]
	mov byte[rdi + rax], cl
	inc rax
	jmp copy

exit:
	mov rax, rdi
	ret