segment .text
    global ft_strcmp

ft_strcmp:      ;rdi = str1 , rsi = str2
    mov rax, 0
    jmp compare

compare :
    mov bl, [rdi + rax]
    mov cl, [rsi + rax]
    cmp bl, 0
    jne exit
    cmp cl, 0
    jne exit
    cmp bl, cl
    jne exit
    inc rax
    jmp compare

exit :
    mov rax, 0
    ret