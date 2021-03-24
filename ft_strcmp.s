segment .text
    global ft_strcmp

ft_strcmp:      ;rdi = str1 , rsi = str2
    mov rax, 0
    mov r8, 0

compare :
    mov bl, [rdi + rax]
    mov cl, [rsi + rax]
    cmp bl, cl
    jne exit
    cmp bl, 0
    je exit
    cmp cl, 0
    je exit
    inc rax
    jmp compare

exit :
    movsx rax, bl
    movsx r8, cl
    sub rax, r8
    ret