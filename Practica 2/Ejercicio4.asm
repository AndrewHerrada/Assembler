
;Practica2 Taller de Programacion en bajo nivel. 
;Ejercicio 4

org 100h
mov si,0
inicio:
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente
    mov bx[si],al
    inc si
jmp inicio
siguiente:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;---------------------------
ciclo:
    ;mov si,0
    mov si,contador
    mov al, usuario[si]
    
    cmp bx[si],al
    jne imprimirNoIgual ;si no es igual
    cmp bx[si], "$"
    jz imprimirIgual
    ;inc si
    inc contador
    loop ciclo
imprimirIgual:
    mov dx,offset cadena
    mov ah,9
    int 21h
    jmp fin
imprimirNoIgual:
    mov dx,offset cadena2
    mov ah,9
    int 21h
fin:int 20h
usuario db "andrew.herrada.villarroel@gmail.com$"
cadena db "Correcto$"
cadena2 db "Incorrecto$"
contador dw 0