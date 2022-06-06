;Taller de Programacion en Bajo Nivel
;Ejercicio 5

org 100h
incio:
;solo el ingreso de "solo" numeros.
    mov ah,1
    int 21h
    mov bl, al
    ;sub bl,30h
    
    mov ah,1
    int 21h
    mov bh,al 
    ;sub bh,30h
    
    mov ah,1
    int 21h
    mov cl,al  
    ;sub cl,30h
    
    cmp bl,2Fh
    ja mayorbl
    jmp menorbl
    menorbl: jmp fin
    mayorbl: cmp bl,3Ah
           jb menorbl1
           jmp fin
           menorbl1: jmp continue
    continue:
    cmp bh,2Fh
    ja mayorbh
    jmp menorbh
    menorbh: jmp fin
    mayorbh: cmp bh,3Ah
           jb menorbh1
           jmp fin 
           menorbh1: jmp continue1
    continue1:
    cmp cl,2Fh
    ja mayorcl
    jmp menorcl
    menorcl: jmp fin
    mayorcl: cmp cl,3Ah
           jb menorcl1
           jmp fin
           menorcl1: jmp continue2       
;-------------------------    
    continue2:
    sub bl,30h
    sub bh,30h
    sub cl,30h
    
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
            caso1:
                add bh,cl
                mov dl,bh
                add dl,30h
                mov ah,2
                int 21h
                
                sub bl,cl
                mov dl,bl
                add dl,30h
                mov ah,2
                int 21h
                jmp fin
            caso2:
                add bl,cl
                mov dl,bl
                add dl,30h
                mov ah,2
                int 21h
                
                sub bh,cl
                mov dl,bh
                add dl,30h
                mov ah,2
                int 21h
                jmp fin
        menor1:
            add cl,bh
            mov dl,cl
            add dl,30h
            mov ah,2
            int 21h
            
            sub bl,bh
            mov dl,bl
            add dl,30h
            mov ah,2
            int 21h
            jmp fin
    menor: 
        cmp bh,cl
        ja mayor2
        jmp menor2
        mayor2:
            add cl,bl
            mov dl,cl
            add dl,30h
            mov ah,2
            int 21h  
            
            sub bh,bl
            mov dl,bh
            add dl,30h
            mov ah,2
            int 21h
            jmp fin
        menor2:
            cmp bl,bh
            ja caso3
            jmp caso4
            caso3:
                add bl,bh
                mov dl,bl
                add dl,30h
                mov ah,2
                int 21h
                
                sub cl,bh
                mov dl,cl
                add dl,30h
                mov ah,2
                int 21h
                jmp fin
            caso4:
                add bh,bl
                mov dl,bh
                add dl,30h
                mov ah,2
                int 21h
                
                sub cl,bl
                mov dl,cl
                add dl,30h
                mov ah,2
                int 21h
                jmp fin
fin:int 20h
    


