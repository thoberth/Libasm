global _ft_strlen

_ft_strlen:
    mov rax, 0          ;rax = 0
    jmp counter         ;counter()

counter:
    cmp BYTE[rdi + rax], 0  ;if rdi[rax] = 0
    je exit                 ;{exit()} <- si condition valide
    inc rax                 ;rax++
    jmp counter             ;counter()

exit:
    ret                 ;return automatiquement rax