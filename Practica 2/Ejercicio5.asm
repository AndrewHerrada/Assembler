;Practica2 Taller de Programacion en bajo nivel. 
;Ejercicio 5

org 100h
mov si,0
mov ch,0
mov dx,offset msg3
mov ah,9
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inicio:
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente
    mov bx[si],al
    inc si
    jmp inicio
    ;loop inicio
    
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
    mov ah,0
    mov al,0
    mov si,0
    mov ch,0
    
    mov dx,offset msg
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    jmp continuar:
    ;mov dx,offset cadena
    ;mov ah,9
    ;int 21h
    ;jmp fin
imprimirNoIgual:
    cmp ch,2
    jne incrementar
        
    mov dx,offset cadena2
    mov ah,9
    int 21h
incrementar: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp inicio
    
    
continuar:
    mov ah,7
    int 21h
    
    cmp al,13
    jz siguiente1
    mov bx[si],al
    inc si
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    
    jmp continuar
    ;loop inicio
    
siguiente1:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;---------------------------
ciclo1:
    ;mov si,0
    mov si,contador1
    mov al, password[si]
    
    cmp bx[si],al
    jne imprimirNoIgual1 ;si no es igual
    cmp bx[si], "$"
    jz imprimirIgual1
    ;inc si
    inc contador1
    loop ciclo1
imprimirIgual1:
    mov dx,offset cadena
    mov ah,9
    int 21h
    jmp fin
imprimirNoIgual1:
    cmp ch,2
    jne incrementar1
        
    mov dx,offset cadena2
    mov ah,9
    int 21h
incrementar1: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp continuar    
    
    
    
    
    
    
    
    
fin:int 20h
usuario db "andrew.herrada.villarroel@gmail.com$"
password db "checho$"

cadena db "Acceso Concedido$"
cadena2 db "Cuenta Bloqueada$" 

msg3 db "Ingresar Nombre de Usuario$"
msg db "Escribir contrasena$"
msg2 db "*$"

contador dw 0 
contador1 dw 0



