;Taller de Programacion en Bajo Nivel
;Ejericio 4

org 100h

incio:
    mov ah,7
    int 21h
    ;sub al,30h
    
    mov bl,al
    ;comparar
    cmp bl,2Fh
    ja mayor
    jmp otro
        mayor:
            cmp bl,3Ah
            jb menor
            jmp otro2
            menor:
            jmp continue
            otro2:
            jmp fin
        otro:
            jmp fin
                   
    ;si es numero devuelve el mismo. 
    continue:
    mov dl,bl
    ;add dl,30h
    mov ah,2
    int 21h
    

fin:int 20h




