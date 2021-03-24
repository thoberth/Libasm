segment .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy
    extern __errno_location

ft_strdup:  ;rdi = s1
    push rdi        ; on push la valeur de rdi sur la stack pour pouvoir s'en servir
    call ft_strlen  ; rax = ft_strlen(rdi)
    inc rax         ; rax++ pour le '\0'
    mov rdi, rax    ; rdi = rax = taille a malloc
    call malloc WRT ..plt    ; rax = adresse renvoyer par malloc ou nul en cas d'erreur
    pop rdi         ; on recupere notre chaine de caractere s1
    or rax, rax     ; <- or donne 0 si rax = 0 =~ cmp ax, 0 mais utilise moins d'octets
    jz errno        ; si le dernier calcul a renvoyer 0 
    mov rsi, rdi    ; prepare ft_strcpy source = rsi = rdi 
    mov rdi, rax    ;  & dest = rdi = rax car on renvoie rax
    call ft_strcpy
    jmp exit

errno:    ; si erreur de malloc on set la var errno
    neg rax                             ; code erreur a mettre en positif
    mov rdi, rax                        ; stockez code erreur dans rdi car rax va prendre l'addresse de errno 
    call __errno_location WRT ..plt     ; rax = &errno
    mov [rax], rdi                      ; errno = code erreur
    mov rax, -1                         ; on ret -1 car erreur
    ret

exit:
    ret