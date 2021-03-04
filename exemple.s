bits 64

section .data
    message db 'Hello World !', 10

section .text
    global _start
    _start:
        mov rax, 1 //numero du sycall
        mov rdi, 1 // le fd
        mov rsi, message // *buf
        mov rdx, 13+1 // taille
        syscall

        mov rax, 60 //sys_exit
        mov rdi, 0 // parametre de sys_exit
        syscall