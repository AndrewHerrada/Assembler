
;Practica2 Taller de Programacion en Bajo nivel
;Ejercicio2
;SOLO FUNCIONA SI EL PRIMER NUMERO NO ES IMPAR
org 100h
inicio:
    mov bl,1

repetir:            ; ingreso de datos
    mov ah,1
    int 21h
    sub al,30h
            ; copiar los datos
    mov ah,0
    mov bh,al
    mov ch,bl
    
    cmp al,bl
    ja mayor
    jmp menor 
mayor:
    sub al,bl
    mov cl,2
    div cl
    
    cmp ah,0
    je mostrar
    mov bl,bh 
    jmp repetir
    
menor:
    xchg al,bl
    sub al,bl
    mov cl,2
    div cl
    
    cmp ah,0
    je mostrar
    mov bl,bh   
    jmp repetir
;------------------   
mostrar:
    mov ah,1
    int 21h
    cmp al,0Dh
    je continuar
    jmp mostrar
continuar:    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    add bh,30h
    add ch,30h
    mov dl,bh
    int 21h
    mov dl,ch
    int 21h 
    
           
fin: int 20h







