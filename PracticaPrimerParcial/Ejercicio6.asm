
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt




org 100h 


c dw 0
var dw 0 
svar dw 0

mov si,0
lectura:
mov ah,1
int 21h

cmp al,13
jz siguiente

mov otra[si],al
mov cad[si],al
inc si
jmp lectura  

siguiente:
mov otra[si], "$"
mov cad[si], "$"
;----------------------

mov si,0
mov di,0 
mov cx,0

buscar:
cmp cad[di],'$'
    jz continuar
;mov ch,otra[si]
cmp otra[si],'$'

jz resetSi



mov al,cad[di]
cmp al,otra[si]
jz letraIgual
inc si
jmp buscar
letraIgual:
    mov bl,al
    add bh,1
    inc si
    jmp buscar
resetSi:
    mov si,0
    mov lista[di],bh
    inc di
    inc var
    
    push bx
    mov bh,0
    jmp buscar


continuar: 
mov lista[di],"$"
    
    mov si,0
    mov di,0
    
    mov bx,0
    mov bx,var
    sub bx,1
    mov svar,bx 
    call limpiar
    call ordenar
    
    mov si,0
    mov di,0
    call limpiar
for:
    pop bx
    cmp bh,lista[si]
    je igual
    jmp noigual
    
igual:
    call saltoLinea
    mov ah,2
    add bh,30h
    mov dl,bh
    int 21h
    
    mov dx,offset cadena
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp sigu
noigual:
    jmp for
    
;--------------------------
sigu:

    mov si,svar
    mov di,0
    call limpiar
for1:
    pop bx
    cmp bh,lista[si]
    je igual1
    jmp noigual1
    
igual1:
    call saltoLinea
    mov ah,2
    add bh,30h
    mov dl,bh
    int 21h
    
    mov dx,offset cadena
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp fin
noigual1:
    jmp for1
        


    
fin:int 20h

otra db 10 dup (' '),'$'

cad  db 10 dup (' '),'$' 

lista db 10 dup (' '),'$' 

cadena db " veces la letra $"


proc ordenar
 
 mov cx, svar 
 bucle1:
 mov c, cx

 mov bx, cx
 mov cx, var

 bucle2: 
 mov si, cx
 mov ah, lista[si-1] 
 cmp ah,lista[bx-1]
 jnge seguir 
 mov dh, lista[bx-1] 
 mov dl, lista[si-1] 
 mov lista[bx-1], dl 
 mov lista[si-1], dh  
 seguir:
 loop bucle2

 mov cx, c
 loop bucle1
ret
ordenar endp

proc limpiar
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
ret
limpiar endp

proc saltoLinea
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
ret
saltoLinea endp