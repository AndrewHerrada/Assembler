ORG 100H
;--------ingresar abecedario a la cola

mov cx,26

mov n,122

mov ax,'*'
push ax
repetir:



mov ax,n
push ax 

dec n
loop repetir


;-----------insertar
mov si,0
lectura:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig0
    
    mov elem0[si],al
    inc si
    jmp lectura

sig0:
    call saltoLinea
    mov si,0 
lec0:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo0
    
    mov marca0[si],al
    inc si
    jmp lec0
sigo0:
;------------segundo ingreso
    call saltoLinea
    mov si,0 
lectura1:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig1
    
    mov elem1[si],al
    inc si
    jmp lectura1

sig1:
call saltoLinea
    mov si,0 
lec1:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo1
    
    mov marca1[si],al
    inc si
    jmp lec1

sigo1:
;--------------tercera parte
    call saltoLinea
    mov si,0 
lectura2:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig2
    
    mov elem2[si],al
    inc si
    jmp lectura2

sig2:          
call saltoLinea
    mov si,0 
lec2:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo2
    
    mov marca2[si],al
    inc si
    jmp lec2

sigo2:
;--------------tercera parte
    call saltoLinea
    mov si,0 
lectura3:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig3
    
    mov elem3[si],al
    inc si
    jmp lectura3

sig3:          
call saltoLinea
    mov si,0 
lec3:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo3
    
    mov marca3[si],al
    inc si
    jmp lec3

sigo3:
;----------------cuarta parte
    call saltoLinea
    mov si,0 
lectura4:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig4
    
    mov elem4[si],al
    inc si
    jmp lectura4

sig4:          
call saltoLinea
    mov si,0 
lec4:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo4
    
    mov marca4[si],al
    inc si
    jmp lec4

sigo4:
;-----------------quinta parte
    call saltoLinea
    mov si,0 
lectura5:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig5
    
    mov elem5[si],al
    inc si
    jmp lectura5

sig5:          
call saltoLinea
    mov si,0 
lec5:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo5
    
    mov marca5[si],al
    inc si
    jmp lec5

sigo5:
;-----------------------sexta parte 
    call saltoLinea
    mov si,0 
lectura6:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig6
    
    mov elem6[si],al
    inc si
    jmp lectura6

sig6:          
call saltoLinea
    mov si,0 
lec6:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo6
    
    mov marca6[si],al
    inc si
    jmp lec6

sigo6:
;-----------------------septima parte
    call saltoLinea
    mov si,0 
lectura7:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig7
    
    mov elem7[si],al
    inc si
    jmp lectura7

sig7:          
call saltoLinea
    mov si,0 
lec7:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo7
    
    mov marca7[si],al
    inc si
    jmp lec7

sigo7:
;------------------octava parte
    call saltoLinea
    mov si,0 
lectura8:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig8
    
    mov elem8[si],al
    inc si
    jmp lectura8

sig8:          
call saltoLinea
    mov si,0 
lec8:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo8
    
    mov marca8[si],al
    inc si
    jmp lec8

sigo8:
;-------------------novena parte
    call saltoLinea
    mov si,0 
lectura9:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sig9
    
    mov elem9[si],al
    inc si
    jmp lectura9

sig9:          
call saltoLinea
    mov si,0 
lec9:
    mov ah,1
    int 21h
    
    cmp al,13
    jz sigo9
    
    mov marca9[si],al
    inc si
    jmp lec9

sigo9:
    mov ah,00h ;limpia la pantalla
 mov al,03h
 int 10h
 
    mov si,0
    mov di,0
    
    mov al,elem0[di]
    mov elementos[si],al
    inc si
    
    mov al,elem1[di]
    mov elementos[si],al
    inc si
    
    mov al,elem2[di]
    mov elementos[si],al
    inc si
    
    mov al,elem3[di]
    mov elementos[si],al
    inc si
    
    mov al,elem4[di]
    mov elementos[si],al
    inc si
    
    mov al,elem5[di]
    mov elementos[si],al
    inc si
    
    mov al,elem6[di]
    mov elementos[si],al
    inc si
    
    mov al,elem7[di]
    mov elementos[si],al
    inc si
    
    mov al,elem8[di]
    mov elementos[si],al
    inc si
    
    mov al,elem9[di]
    mov elementos[si],al
    inc si
;-------------------------------
    mov si,0
    mov di,0
    
    mov al,marca0[di]
    mov marcas[si],al
    inc si
    
    mov al,marca1[di]
    mov marcas[si],al
    inc si
    
    mov al,marca2[di]
    mov marcas[si],al
    inc si
    
    mov al,marca3[di]
    mov marcas[si],al
    inc si
    
    mov al,marca4[di]
    mov marcas[si],al
    inc si
    
    mov al,marca5[di]
    mov marcas[si],al
    inc si
    
    mov al,marca6[di]
    mov marcas[si],al
    inc si
    
    mov al,marca7[di]
    mov marcas[si],al
    inc si
    
    mov al,marca8[di]
    mov marcas[si],al
    inc si
    
    mov al,marca9[di]
    mov marcas[si],al
    inc si
;----------------------------- 
    mov dx,offset cad
    mov ah,9
    int 21h
    
    call saltoLinea
    
    mov ah,1
    int 21h
    cmp al,'p'
    je ordenarParte
    jmp ordenarMarca
    
;----------
 ordenarParte:
    call saltoLinea
    call limpiar
    mov di,0
    
sigLetra:
    mov si,0
        
    pop bx              ;bl comienza con 'a'   
    
    cmp bx,'*'
    je fin
incSi:
    mov ax,bx
    cmp si,10
    jz sigLetra
    
    cmp al,elementos[si]
    
    je esElemento
    
    inc si
    jmp incSi:
esElemento:
    inc si
    cmp al,elem0[di]    
    jz igualElem0
    cmp al,elem1[di]
    jz igualElem1      
    cmp al,elem2[di]
    jz igualElem2      
    cmp al,elem3[di]
    jz igualElem3      
    cmp al,elem4[di]
    jz igualElem4      
    cmp al,elem5[di]
    jz igualElem5      
    cmp al,elem6[di]
    jz igualElem6      
    cmp al,elem7[di]
    jz igualElem7      
    cmp al,elem8[di]
    jz igualElem8      
    cmp al,elem9[di]
    jz igualElem9      
    cmp al,elem0[di]
    
igualElem0:
    mov dx,offset elem0
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset marca0
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi
igualElem1:
    mov dx,offset elem1
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca1
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi
igualElem2:
    mov dx,offset elem2
    mov ah,9
    int 21h  
    call tab
    
    mov dx,offset marca2
    mov ah,9
    int 21h
    call saltoLinea  
    jmp incSi
igualElem3:
    mov dx,offset elem3
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca3
    mov ah,9
    int 21h 
    call saltoLinea 
    jmp incSi
igualElem4:
    mov dx,offset elem4
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca4
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi
igualElem5:
    mov dx,offset elem5
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca5
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi
igualElem6:
    mov dx,offset elem6
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca6
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi
igualElem7:
    mov dx,offset elem7
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca7
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi
igualElem8:
    mov dx,offset elem8
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca8
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi
igualElem9:
    mov dx,offset elem9
    mov ah,9
    int 21h
    call tab
    
    mov dx,offset marca9
    mov ah,9
    int 21h        
    call saltoLinea
    jmp incSi    

;------------------------------------------------
ordenarMarca: 
    call saltoLinea
    call limpiar
    mov di,0
    
sigLetra1:
    mov si,0
        
    pop bx              ;bl comienza con 'a'   
    
    cmp bx,'*'
    je fin
incSi1:
    mov ax,bx
    cmp si,10
    jz sigLetra1
    
    cmp al,marcas[si]
    
    je esMarca
    
    inc si
    jmp incSi1:
esMarca:
    inc si
    cmp al,marca0[di]    
    jz igualMarca0
    cmp al,marca1[di]    
    jz igualMarca1
    cmp al,marca2[di]    
    jz igualMarca2
    cmp al,marca3[di]    
    jz igualMarca3
    cmp al,marca4[di]    
    jz igualMarca4
    cmp al,marca5[di]    
    jz igualMarca5
    cmp al,marca6[di]    
    jz igualMarca6
    cmp al,marca7[di]    
    jz igualMarca7
    cmp al,marca8[di]    
    jz igualMarca8
    cmp al,marca9[di]    
    jz igualMarca9
    
    
igualMarca0:
    mov dx,offset marca0
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem0
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca1:
    mov dx,offset marca1
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem1
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca2:
    mov dx,offset marca2
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem2
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca3:
    mov dx,offset marca3
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem3
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca4:
    mov dx,offset marca4
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem4
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca5:
    mov dx,offset marca5
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem5
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca6:
    mov dx,offset marca6
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem6
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca7:
    mov dx,offset marca7
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem7
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca8:
    mov dx,offset marca8
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem8
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1
igualMarca9:
    mov dx,offset marca9
    mov ah,9
    int 21h
    
    call tab
    
    mov dx,offset elem9
    mov ah,9
    int 21h
    call saltoLinea
    jmp incSi1 
        
    
fin: int 20h

    
ini dw 0
n dw 0
elem0  db 12 dup (' '),'$'
elem1  db 12 dup (' '),'$'
elem2  db 12 dup (' '),'$'
elem3  db 12 dup (' '),'$'
elem4  db 12 dup (' '),'$'
elem5  db 12 dup (' '),'$'
elem6  db 12 dup (' '),'$'
elem7  db 12 dup (' '),'$'
elem8  db 12 dup (' '),'$'
elem9  db 12 dup (' '),'$'
elementos db 12 dup(' '),'$'

marca0 db 10 dup (' '),'$'
marca1 db 10 dup (' '),'$'
marca2 db 10 dup (' '),'$'
marca3 db 10 dup (' '),'$'
marca4 db 10 dup (' '),'$'
marca5 db 10 dup (' '),'$'
marca6 db 10 dup (' '),'$'
marca7 db 10 dup (' '),'$'
marca8 db 10 dup (' '),'$'
marca9 db 10 dup (' '),'$'
marcas db 12 dup(' '),'$' 


cad db "Ordenar por parte(p) o marca(m)$"

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

proc tab 
    mov ah,2
    mov dl,09
    int 21h
ret
tab endp

