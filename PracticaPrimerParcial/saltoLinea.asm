macro saltoLinea
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
endm



