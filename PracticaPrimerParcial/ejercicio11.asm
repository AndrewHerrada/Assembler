;ejercicio11
org 100h
principio: 
    mov dx,offset mensaje ;nombre,apellido
    mov ah,9
    int 21h
    
    call saltoLinea
    
    mov ah,1
repetir:
    int 21h
    
    cmp al,13
    jz siguiente
    jmp repetir
siguiente:

    call saltoLinea
    mov dx,offset mensaje1  ;ci
    mov ah,9
    int 21h
    
    call saltoLinea
    
    mov ah,1
repetir1:
    int 21h
    
    cmp al,13
    jz siguiente1
    jmp repetir1

;---------------------------------
siguiente1:
mov si,0
mov ch,0 
call saltoLinea
mov dx,offset mensaje2
mov ah,9
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
esinicio:
    mov ah,1
    int 21h
    
    cmp al,13
    jz continuacion
    mov bx[si],al
    inc si
    jmp esinicio
    ;loop inicio
    
continuacion:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;---------------------------
cicle:
    ;mov si,0
    mov si,contadorNum
    mov al, numero[si]
    
    cmp bx[si],al
    jne NoIgual ;si no es igual
    cmp bx[si], '1'
    jz Igual
    ;inc si
    inc contadorNum
    loop cicle
Igual:
    
    ;call saltoLinea
    mov dx,offset true
    mov ah,9
    int 21h
    jmp loquesigue
    ;mov dx,offset cadena
    ;mov ah,9
    ;int 21h
    ;jmp fin
    NoIgual:
    ;call saltoLinea
    mov dx,offset false
    mov ah,9
    int 21h 
    jmp fin1
incrementacion: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp inicio
    

;--------------------------
loquesigue:

mov cl,0
mov si,0
mov ch,0
call saltoLinea
mov dx,offset mensaje4
mov ah,9
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inicio:
;------------introducir barrio
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente2
    cmp cl,0
    jne cont
    cmp al,'b'
    je cont
    jmp otroCon
cont:
    mov bx[si],al
    inc si
    inc cl
    jmp inicio
    ;loop inicio
    
siguiente2:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;--------------------------- verificar barrio
    
ciclo:
    ;mov si,0
    mov si,contador
    mov al, barrio1[si]
    
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
    
    mov dx,offset true
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    jmp fin:
    ;mov dx,offset cadena
    ;mov ah,9
    ;int 21h
    ;jmp fin
imprimirNoIgual:
    cmp ch,2
    jne incrementar
        
    mov dx,offset false
    mov ah,9
    int 21h
incrementar: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp inicio
    
    
inicio2:
;------------introducir barrio
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente3
otrocon:    
    mov bx[si],al
    inc si
    jmp inicio2
    ;loop inicio
    
siguiente3:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;--------------------------- verificar barrio
    

ciclo1:
    ;mov si,0
    mov si,contador
    mov al, barrio2[si]
    
    cmp bx[si],al
    jne fin ;si no es igual
    cmp bx[si], "$"
    jz imprimirIgual1
    ;inc si
    inc contador
    loop ciclo1
imprimirIgual1:
    mov ah,0
    mov al,0
    mov si,0
    mov ch,0
    
    mov dx,offset true
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    jmp fin1:
    ;mov dx,offset cadena
    ;mov ah,9
    ;int 21h
    ;jmp fin
    
incrementar1: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp inicio2    
fin:
mov dx,offset false
mov ah,9
int 21h
fin1:int 20h

mensaje db "Ingrese su nombre y apellido:$"
mensaje1 db "Ingrese su ci:$"
mensaje2 db "Ingrese su telefono:$"
mensaje4 db "Ingrese su barrio:$"

true db "Factible$"
false db "No factible$"

contador dw 0 
contadorNum dw 0

barrio1 db "beato salomon$" 
barrio2 db "tictinorte$"
numero db "+591$"

saltoLinea proc
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
ret
saltoLinea endp
    