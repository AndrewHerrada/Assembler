
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al,77
mov bl,16
div bl
mov ch,ah
cmp ch,10
jb mostrar
cmp ch,10
je m10
cmp ch,11
je m11
cmp ch,12
je m12
cmp ch,13
je m13
cmp ch,14
je m14
cmp ch,15
je m15

mostrar:
    mov bh,ah
    mov bl,al
    
    add bx,30h
    mov ax,0
    mov ah,2
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h

m10:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'A'
    int 21h
    jmp fin
m11:
    mov bh,al
    add bh,30h
    mov ax,0
    mov dl,bh
    int 21h
    mov dl,'B'
    int 21h
    jmp fin
m12:
    mov bh,al
    add bh,30h
    mov ax,0 
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'C'
    int 21h
    jmp fin
m13:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'D'
    int 21h
    jmp fin 
m14:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'E'
    int 21h
    jmp fin
m15:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'F'
    int 21h
    jmp fin
    
fin:int 20h