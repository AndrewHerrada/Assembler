;Taller de Programacion en Bajo Nivel
;Ejericio 3

org 100h

incio:
    mov ah,7
    int 21h
    ;sub al,40h
    
    mov bl,al
    ;comparar
    cmp bl,60
    ja mayor
    jmp otro
        mayor:
            cmp bl,7Bh
            jb menor
            jmp otro2
            menor:
            jmp continue
            otro2:
            jmp fin
        otro:
            jmp fin
                   
    ;si es minuscula devuelve la letra. 
    continue:
    mov dl,bl
    ;add dl,40h
    mov ah,2
    int 21h
    

fin:int 20h




