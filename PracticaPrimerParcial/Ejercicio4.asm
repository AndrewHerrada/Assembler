org 100h

inicio:
    mov cx,2
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
   
    mov ah,1
    int 21h
    mov bh,al
    cmp al,09h
    je cont
    
    mov ah,1
    int 21h
    cmp al,0Dh
    je unDigito
    ;je inicio
    cmp al,09h
    je cont
    
    mov bl,al
    int 21h
    cmp al,0Dh
    je dosDigitos
    ;je inicio
    cmp al,09h
    je cont
    
    mov ch,al
    int 21h
    cmp al,0Dh
    je tresDigitos
    ;je inicio
    cmp al,09h
    je cont
    
unDigito:
   sub bh,30h
   
   ;mov ah,2
   ;mov dl,10
   ;int 21h
   ;mov dl,13
   ;int 21h
   
   mov dl,bh
   ;add dl,30h
   push dx
   
   jmp inicio    
dosDigitos:
   sub bx,3030h
   mov ax,0
   mov cl,10   ;mult/divisor
   mov al,bh
   mul cl
   
   add bl,al
   push bx
   ;add bl,30h
   ;mov cl,10
   ;div cl
   
   ;mov bx,ax
   
   ;mov ah,2
   ;mov dl,10
   ;int 21h
   ;mov dl,13
   ;int 21h
   
   ;mov ah,2
   ;mov dl,bl
   ;add dl,30h
   ;int 21h
   ;mov dl,bh
   ;add dl,30h
   ;int 21h
   
   ;mov ah,2
   ;mov dl,bl
   ;int 21h
   
   
   jmp inicio
tresDigitos:  
   sub bx,3030h
   sub ch,30h
   mov ax,0
   mov cl,10
   mov al,bh
   mul cl
   
   add al,bl
   mul cl
   add al,ch
   
   push ax
   ;mov cl,2
   ;div cl
   
   ;mov bl,al
   ;mov ax,0
   ;mov cl,10
   ;mov al,bl
   ;div cl
   
   ;mov bh,ah
   ;mov ah,0
   ;div cl
   
   ;mov bl,ah
   ;mov ch,al
   
   ;mov ah,2
   ;mov dl,10
   ;int 21h
   ;mov dl,13
   ;int 21h
   
   
   ;mov dl,ch
   ;add dl,30h
   ;int 21h
   ;mov dl,bl
   ;add dl,30h
   ;int 21h
   ;mov dl,bh
   ;add dl,30h
   ;int 21h
   jmp inicio  
   
cont: 
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
mov ax,0
mov bx,0
mov cx,0
mov dx,0

pop dx
mov bh,dl
pop dx
mov bl,dl
pop dx
mov cl,dl 

call mayorDeTres
add bl,cl
sub bh,cl
push bx
;jmp sas    
    mov cx,0 ;limpiar
    mov cl,10
salto:
    mov ax,0
    mov dx,0
    mov dl,10  ;divisor
    
    add dh,bl
    add dh,cl
    
    mov al,bl  ;mover a 'al' el dividendo
    div dl
    push ax
    mov bh,ah
    ;mov dl,al
    
    mov ah,2
    mov dl,al
    add dl,30h
    int 21h
    
    mov dl,bh
    add dl,30h
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    mov dl,43 ; (+)
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    
    cmp cl,10
    jne contin
    mov ax,0
    mov ah,2
    mov dl,1
    add dl,30h
    int 21h
    mov dl,0
    add dl,30h
    int 21h
    jmp contin2
contin:
    mov dl,cl
    add dl,30h ; numero cx 
    int 21h
contin2:    
    mov dl,32 ; espacio
    int 21h
    
    mov dl,61 ; (=)
    int 21h 
    
    mov dl,32 ; espacio
    int 21h
    
    
    mov ax,0
    mov dl,10  ;divisor
    mov al,dh  ;mover a 'al' el dividendo
    div dl
    mov bh,ah
    
    mov ah,2
    mov dl,al
    add dl,30h
    int 21h
    
    mov dl,bh
    add dl,30h
    int 21h
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    pop ax
    ;cmp cl,10
    ;je igual
    ;igual: mov bl,10
    
    
    ;mov bl,bh
    ;add bl,cl
    ;mov dl,bl
    ;int 21h
    
    
    
    loop salto
    
pop bx
;sas:
    mov cx,0 ;limpiar
    mov cl,10
;salto1:
    mov ax,0
    mov dx,0
    mov dl,10  ;divisor
    
    add dh,bh
    ;add dh,cl
    
    mov al,bh  ;mover a 'al' el dividendo
    div dl
    
    
    mov bh,ah
    ;push bx
    ;mov dl,al
    mov ah,0
    div dl     ;volver a didivir
    ;push ax                          
salto1:
    push bx
    push ax
        
    mov ah,2
    mov dl,al
    add dl,30h
    int 21h
    
    mov dl,ah
    add dl,30h
    int 21h
    
    mov dl,bh
    add dl,30h
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    mov dl,43 ; (+)
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    
    cmp cl,10
    jne contin1
    mov ax,0
    mov ah,2
    mov dl,1
    add dl,30h
    int 21h
    mov dl,0
    add dl,30h
    int 21h
    jmp contin3
contin1:
    mov dl,cl
    add dl,30h ; numero cx 
    int 21h
contin3:    
    mov dl,32 ; espacio
    int 21h
    
    mov dl,61 ; (=)
    int 21h 
    
    mov dl,32 ; espacio
    int 21h
    
    
    mov ax,0
    mov al,dh  ;mover a 'al' el dividendo
    mov dx,0
    mov dl,cl  ;divisor
    mul dl
    
    mov dl,10
    
    div dl
    mov bh,al
    div dl
    
    
    mov ah,2
    mov dl,al
    add dl,30h
    int 21h
    
    mov dl,ah
    add dl,30h
    int 21h
    
    mov dl,bh
    add dl,30h
    int 21h
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    pop ax
    pop bx
    ;cmp cl,10
    ;je igual
    ;igual: mov bl,10
    
    
    ;mov bl,bh
    ;add bl,cl
    ;mov dl,bl
    ;int 21h
    
    
    
    loop salto1    
    
    
fin: int 20h

proc mayorDeTres
    cmp bl,cl
    ja mayor
    jmp menor

    mayor:
        cmp bh,cl
        ja mayor1
        jmp menor1
        mayor1:
            cmp bl,bh
            ja caso1 
            jmp caso2 
            caso1:      ; bl mayor,cl menor
                xchg bh,bl
                jmp mover
            caso2:      ; bh mayor cl menor
                jmp mover
        menor1:         ; bl mayor bh menor
            xchg bh,bl
            xchg bl,cl 
            jmp mover
    menor: 
        cmp bh,cl
        ja mayor2
        jmp menor2
        mayor2:     ; bh mayor bl menor
            xchg bl,cl 
            jmp mover
        menor2:
            cmp bl,bh
            ja caso3
            jmp caso4
            caso3:      ; cl mayor, bh menor
                xchg bh,cl
                jmp mover
            caso4:      ; cl mayor bl menor 
                xchg bh,cl
                xchg bl,cl   
                jmp mover
            
    mover:
ret    
mayorDeTres endp
 
 
macro tabla  
    mov ah,7
    int 21h
    mov bh,al
    sub al,30h
    
    mov cx,0 ;limpiar
    mov cl,10
salto:
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov dl,bh  ;numero ingresado
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    mov dl,43 ; (+)
    int 21h
    
    mov dl,32 ; espacio
    int 21h  
    
    mov dl,cl
    add dl,30h ; numero cx 
    int 21h
    
    mov dl,32 ; espacio
    int 21h
    
    mov dl,61 ; (=)
    int 21h 
    
    cmp cl,10
    je igual
    igual: mov bl,10
    
    
    mov bl,bh
    add bl,cl
    mov dl,bl
    int 21h
    
    
    
    loop salto 
endm    

