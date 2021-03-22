segment	.text
	global ft_write
    extern __errno_location

ft_write:
    mov rax, 1
    syscall
    cmp rax, 0
    jl ret_err
    ret

ret_err:
    neg rax                             ; code erreur a mettre en positif
    mov rdi, rax                        ; stockez code erreur dans rdi car rax va prendre l'addresse de errno 
    call __errno_location WRt ..plt     ; rax = &errno
    mov [rax], rdi                      ; errno = code erreur
    mov rax, -1                         ; on ret -1 car erreur
    ret