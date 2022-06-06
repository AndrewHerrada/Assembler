
;Ejercicio 10

org 100h
mov si,0
mov ch,0
mov dx,offset msg3
mov ah,9
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
inicio:
;------------introducir correo
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente
    mov bx[si],al
    inc si
    jmp inicio
    ;loop inicio
    
siguiente:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;--------------------------- verificar correo
ciclo:
    ;mov si,0
    mov si,contador
    mov al, usuario[si]
    
    cmp bx[si],al
    jne imprimirNoIgual ;si no es igual
    cmp bx[si], "$"
    jz imprimirIgual
    ;inc si
    inc contador
    loop ciclo
imprimirIgual:
    mov ah,0
    mov al,0
    mov si,0
    mov ch,0
    
    mov dx,offset msg
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    jmp continuar:
    ;mov dx,offset cadena
    ;mov ah,9
    ;int 21h
    ;jmp fin
imprimirNoIgual:
    cmp ch,2
    jne incrementar
        
    mov dx,offset cadena2
    mov ah,9
    int 21h
incrementar: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp inicio
    
;-------------------------introducir contrasena    
continuar:
    mov ah,7
    int 21h
    
    cmp al,13
    jz siguiente1
    
    mov bx[si],al
    inc si
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    
    jmp continuar
    ;loop inicio
    
siguiente1:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bx[si], "$"    
;---------------------------comprobar si la contrasena es correcta
ciclo1:
    ;mov si,0
    mov si,contador1
    mov al, password[si]
    
    cmp bx[si],al
    jne imprimirNoIgual1 ;si no es igual
    cmp bx[si], "$"
    jz imprimirIgual1
    ;inc si
    inc contador1
    loop ciclo1
imprimirIgual1:
    mov dx,offset cadena
    mov ah,9
    int 21h
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov dx,offset msg4
    mov ah,9
    int 21h
    jmp volver
imprimirNoIgual1:
    cmp ch,2
    jne incrementar1
        
    mov dx,offset cadena2
    mov ah,9
    int 21h
incrementar1: 
    add ch,1
    mov ah,0
    mov al,0
    mov si,0
    ;mov cl,0
    jmp continuar 
;------------------------------------ introducir celular   
volver:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente2
    
    ;mov bx[si],al
    ;inc si
    ;sub al,30h
    cmp al,'6'
    je vol
    jmp noI
    noI: cmp al,'7'
        je vol
        jmp srs
        
             
vol: 
    mov ah,1
    int 21h
    
    cmp al,13
    jz siguiente2
    
    jmp vol
    ;loop inicio
    
siguiente2:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dx,offset cadena3
    mov ah,9
    int 21h
    jmp continues  
srs:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dx,offset cadena4
    mov ah,9
    int 21h
continues:    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dx,offset msg5
    mov ah,9
    int 21h
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h    

continue:
    
    
    mov ah,1
    int 21h
    
    cmp al,13
    jz fin
    jmp continue
    
    
fin:int 20h
usuario db "andrew.herrada.villarroel@gmail.com$"
;usuario db "andrew$"
password db "Checho1$"
celular db "69438288$"

cadena db "Acceso Concedido$"
cadena2 db "Cuenta Bloqueada$"
cadena3 db "Telefono de Bolivia$"
cadena4 db "Telefono no es de Bolivia$" 

msg3 db "Ingresar Nombre de Usuario$"
msg db "Escribir contrasena$"
msg2 db "*$"
msg4 db "Introduce el numero de su celular$"
msg5 db "Ingrese su pais$"

contador dw 0 
contador1 dw 0
contador2 dw 0
contador3 dw 0





