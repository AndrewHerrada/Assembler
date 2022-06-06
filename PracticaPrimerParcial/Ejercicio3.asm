

esPrimo macro pa
local esNumPrimo 
local noNumPrimo   
local fin    
    mov ax,0
    mov al,pa
    mov ch,2
    div ch
    
    cmp ah,0
    ja esNumPrimo
    jz noNumPrimo
    
    mov ax,0
    mov al,pa
    mov ch,3
    div ch
    
    cmp ah,0
    ja esNumPrimo
    jz noNumPrimo
    
    mov ax,0
    mov al,pa
    mov ch,5
    div ch
    
    cmp ah,0
    ja esNumPrimo
    jz noNumPrimo
    
    mov ax,0
    mov al,pa
    mov ch,7
    div ch
    
    cmp ah,0
    ja esNumPrimo
    jz noNumPrimo
esNumPrimo:
    mov primo[si],pa
    inc si
    add contador,1
    jmp fin
noNumPrimo:
    
    add noprimo,pa
    add contador,1
fin:

endm


primo db 9 dup (' '),'$'
noprimo db dup (' '),'$'
contador dw 0

org 100h
  mov si,0   ; posiciones de la cadena primos
    
inicio: 
    call limpiar
    mov ah,1
    int 21h
    
    cmp al,09
    je continuar:
    
    mov bh,al
    int 21h
    
    cmp al,09
    je continuar:
    
    cmp al,13
    je unDigito
    
    jmp dosDigitos 
    

unDigito:
call saltoLinea
mov ah,0
sub bh,30h
mov bl,bh  ; n en bl
mov bh,0
esPrimo bl

jmp inicio



dosDigitos:
mov bl,al   ;decena = bh,  unidad = bl

call saltoLinea

sub bx,3030h

mov ch,10
mov ax,0
mov al,bh
mul ch
add bl,al   ;composicion n en bl
mov bh,0

esPrimo bl
jmp inicio

    
continuar:
    call saltoLinea 
    push contador
    mov primo[si], "$"
     
    mov si, 0
comienzo:
    call limpiar
    
    cmp primo[si],'$'
    je finPrimos
    cmp primo[si],10 
    jb comUn
    cmp primo[si],9
    ja comDos 
    ;mov al, primo[si]
    ;cmp al,9 
    ;jne fin:
comUn: 
    call limpiar
    mov al,primo[si]
    add noprimo,al
    mov dl,al
    add dl,30h
    mov ax,0
    mov ah,2
    int 21h
    call saltoLinea
    jmp incre

comDos:
    call limpiar
    mov al,primo[si]
    add noprimo,al
    mov ch,10
    div ch
    
    add ax,3030h
    mov bh,ah
    
    mov dl,al
    mov ax,0
    mov ah,2
    int 21h
    mov dl,bh
    int 21h
    
    call saltoLinea
    
    jmp incre
    
incre:    
    inc si
loop comienzo

finPrimos:
    call limpiar
    mov al,noprimo
    pop cx
    ;sub ch,30h
    div cl 
    mov cl,10
    div cl
    
    add ax,3030h
    mov bh,ah
    
    mov dl,al
    mov ax,0
    mov ah,2
    int 21h
    mov dl,bh
    int 21h


fin:int 20h

proc saltoLinea
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
ret
saltoLinea endp


proc limpiar
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
ret
limpiar endp


;x dw 0


