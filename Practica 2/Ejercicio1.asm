
;Practica2 Taller de programacion en bajo nivel
;Ejercicio1
org 100h
inicio:
    mov ah,1
    int 21h
    
    sub al,30h
    mov ah,0
    mov cl,al ; contador for
    mov bl,2
    div bl
    mov bh,al
    add bh,30h
ciclo:    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2 
    mov dl,bh
    int 21h 
    loop ciclo
fin:int 20h







