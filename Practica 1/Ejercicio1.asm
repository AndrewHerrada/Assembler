
;Taller de Programacion en Bajo Nivel
;Ejercicio 1

org 100h
inicio:
    mov ah,4
    mov bh,4
    mov bl,4
    mov ch,2
    mov al,3
    mov dh,2
    
    add bh,ah ;multiplicar dos primeros 
    sub bl,ch ;restar los segundos dos
    
    mul dh    ;multiplicar los ultimos dos
    mov ch,al
    
    mov al,bh ; div sumados entre restados
    div bl
    
    xchg ch,al ;intercambiar
    div ch    ; div multiplicados entre ult div

fin:int 20h




