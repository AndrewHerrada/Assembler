
;Taller de Programacion en Bajo Nivel
;Ejercicio 2

org 100h
inicio:
    mov ah,1    ;Ingresar 4 numeros
    int 21h
    mov bh,al
    sub bh,30h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,30h
    
    mov ah,1
    int 21h  
    mov ch,al
    sub ch,30h
    
    mov ah,1
    int 21h
    mov cl,al 
    sub cl,30h
    
    mov dh,2    ;Dividendo
    
;verificar si cada dato es multiplo(2)    
    mov al,bh
    div dh
    cmp ah,0
    je igual
    jmp noigual
        igual:
            add dl,1
    
    noigual:
    mov al,bl
    div dh
    cmp ah,0 
    je igual1
    jmp noigual1
        igual1:
            add dl,1
    
    noigual1:
    mov al,ch
    div dh
    cmp ah,0 
    je igual2
    jmp noigual2
        igual2:
            add dl,1
    
    noigual2:
    mov al,cl
    div dh
    cmp ah,0
    je igual3
    jmp noigual3
        igual3:
            add dl,1
    noigual3:
    
    
    cmp dl,2
    ja mayorMenor
    jmp otro 
    
        mayorMenor:
        ;---------------ordenar
        cmp bh,bl
        ja simayor
        jmp nomayor
        nomayor: xchg bh,bl
        
        simayor:
        cmp bh,ch
        ja simayor2
        jmp nomayor2
        nomayor2: xchg bh,ch  
        
        simayor2:
        cmp bh,cl
        ja simayor3
        jmp nomayor3
        nomayor3: xchg bh,cl  
        
        simayor3:
        ;-----------siguiente
        cmp bl,ch
        ja mayorbl
        jmp noobl
        noobl: xchg bl,ch
        
        mayorbl:
        cmp bl,cl
        ja mayorbl1
        jmp noobl1
        noobl1: xchg bl,cl
        
        mayorbl1:
        ;----------siguiente
        cmp ch,cl
        ja mayorch
        jmp nooch
        nooch: xchg ch,cl
        
        mayorch:
        ;-------imprimir
        jmp imprimir
        
       
 ;---------------------multiplo(3)           
    otro:
    mov dl,0    ;resetear
    
    mov dh,3    ;Dividendo 
    mov al,bh
    div dh
    cmp ah,0
    je iguaal
    jmp noiguaal
        iguaal:
            add dl,1
    
    noiguaal:
    mov al,bl
    div dh
    cmp ah,0 
    je iguaal1
    jmp noiguaal1
        iguaal1:
            add dl,1
    
    noiguaal1:
    mov al,ch
    div dh
    cmp ah,0 
    je iguaal2
    jmp noiguaal2
        iguaal2:
            add dl,1
    
    noiguaal2:
    mov al,cl
    div dh
    cmp ah,0
    je iguaal3
    jmp noiguaal3
        iguaal3:
            add dl,1
    noiguaal3: 
    
    cmp dl,1
    ja menorMayor
    jmp otro1
    
        menorMayor:
        ;comparar: bh,bl,ch,cl (ordenar)   
        cmp bh,bl
        jb simenor
        jmp sino
        sino: xchg bh,bl
        
        simenor:
        cmp bh,ch
        jb simenor2
        jmp sino2
        sino2: xchg bh,ch  
        
        simenor2:
        cmp bh,cl
        jb simenor3
        jmp sino3
        sino3: xchg bh,cl  
        
        simenor3:
        ;-----------siguiente
        cmp bl,ch
        jb menorbl
        jmp nobl
        nobl: xchg bl,ch
        
        menorbl:
        cmp bl,cl
        jb menorbl1
        jmp nobl1
        nobl1: xchg bl,cl
        
        menorbl1:
        ;----------siguiente
        cmp ch,cl
        jb menorch
        jmp noch
        noch: xchg ch,cl
        
        menorch:
        ;-------imprimir
        jmp imprimir
        
        otro1:
        jmp imprimir
 
    
    
imprimir:
;------bh,bl,ch,cl
mov dl,bh
add dl,30h
mov ah,2
int 21h

mov dl,bl
add dl,30h
mov ah,2
int 21h

mov dl,ch
add dl,30h
mov ah,2
int 21h

mov dl,cl
add dl,30h
mov ah,2
int 21h
    
fin:int 20h     

lista dw 0


; org 100h
; mov bx,0
; mov cx,6
; 
; repeticion:
;   mov ax,lista[bx]
;   cmp ax,mayor
;   jg cambiar
;   jmp continuar
;   cambiar:
;     mov mayor,ax   
;   
;   continuar:
;   add suma,ax
;   add bx,2     
;   
; loop repeticion
;ret
;n dw 5 
;lista dw 4,3,8,5,7,1,9
;suma dw 0   
;mayor dw 0
