;ejercicio5
org 100h
mov dx,offset mensaje1
mov ah,9
int 21h

call saltoLinea

inicio:
    mov ah,1
    int 21h
    mov bh,al
    
    int 21h
    mov bl,al
    
    push bx
    call espacio
    
    mov ah,1
    int 21h
    mov bh,al
    push bx
    
    call saltoLinea
;--------------ingreso de operacion
    mov dx,offset mensaje2
    mov ah,9 
    int 21h
     
    call saltoLinea
    
    mov ah,1
    int 21h
    mov cx,0; limpiar cx
    mov ch,al               
    
    call saltoLinea
;---------------seleccion de sistema numerico
    mov dx,offset mensaje3
    mov ah,9
    int 21h
    
    call saltoLinea
    
    mov ah,1
    int 21h
    mov aux,al 
        
    call saltoLinea
;-------------------resultado si:
;-------es suma
    cmp ch,43
    jz suma
;-------es resta
    cmp ch,45
    jz resta
;-------es multiplicacion
    cmp ch,42
    jz multi
;-------es division
    cmp ch,47
    jz division  

suma:
    pop cx
    pop bx
    call establecer
    add bl,al
    add bl,ch ;resultado de la suma en bl
    
    mov cl,aux    
    call sistemaNum
resta:
    pop cx 
    pop bx
    call establecer
    add bl,al
    sub bl,ch
    
    mov cl,aux
    call sistemaNum
multi: 
    pop cx 
    pop bx
    call establecer
    add al,bl
    mul ch
    mov bl,al
    
    mov cl,aux
    call sistemaNum
division:
    pop cx 
    pop bx
    call establecer
    add al,bl
    mov ah,0 ; limpiar antes de dividir
    div ch
    mov bl,al
    
    mov cl,aux
    call sistemaNum
    
binario:

   mov num,bl   ;El número resultante a bl

   
   mov si,6     ;Comienzan los ciclos de división entre 2
   bin:         ;Uso de etiqueta

      mov ah,00h;Aseguramos residuo de 0
      mov al,num
      mov bl,2
      div bl
      mov var1,ah
      mov num,al

      mov dl,var1
      add dl,30h

      mov cad[si],dl;Concatenamos resultados

      cmp num,1 ;Hacemos comparación
      dec si
      jne bin   ;Indicamos volver a etiqueta bin o:
       je salida   ;Ir a etiqueta salir



      cmp num,0 ;Comparacion con 0
       jne bin
        je salida

   salida:          ;Etiqueta de salida

      mov dl,num ;Proceso para imprimir cadena final con número binario
      add dl,30h

      mov cad[si],dl

  mov ah,09h
  lea dx,cad
  int 21h

decimal:
   mov bh,10
   mov al,bl
   div bh
   
   mov bh,ah
   mov bl,al
   add bx,3030h
   
   mov ax,0
   mov ah,2
   mov dl,bl
   int 21h
   mov dl,bh
   int 21h
   
   jmp fin
octal:
      mov num,bl
      mov si,2     ;Comienzan los ciclos de división entre 8
      bin1:         ;Uso de etiqueta

      mov ah,00h;Aseguramos residuo de 0
      mov al,num
      mov bl,8
      div bl
      mov var1,ah
      mov num,al

      mov dl,var1
      add dl,30h

      mov cad[si],dl;Concatenamos resultados

      cmp num,1 ;Hacemos comparación
      dec si
      jne bin1   ;Indicamos volver a etiqueta bin o:
       je salida1   ;Ir a etiqueta salir



      cmp num,0 ;Comparacion con 0
       jne bin1
        je salida1

   salida1:          ;Etiqueta de salida

      mov dl,num ;Proceso para imprimir cadena final con número binario
      add dl,30h

      mov cad[si],dl

  mov ah,09h
  lea dx,cad
  int 21h


hexad:
    mov al,bl
    mov bh,16
    div bh
    
    mov ch,ah
    cmp ch,10
    jb mostrar
    cmp ch,10
    je m10
    cmp ch,11
    je m11
    cmp ch,12
    je m12
    cmp ch,13
    je m13
    cmp ch,14
    je m14
    cmp ch,15
    je m15

mostrar:
    mov bh,ah
    mov bl,al
    
    add bx,3030h
    mov ax,0
    mov ah,2
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h
    jmp fin
m10:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'A'
    int 21h
    jmp fin
m11:
    mov bh,al
    add bh,30h
    mov ax,0
    mov dl,bh
    int 21h
    mov dl,'B'
    int 21h
    jmp fin
m12:
    mov bh,al
    add bh,30h
    mov ax,0 
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'C'
    int 21h
    jmp fin
m13:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'D'
    int 21h
    jmp fin 
m14:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'E'
    int 21h
    jmp fin
m15:
    mov bh,al
    add bh,30h
    mov ax,0
    mov ah,2
    mov dl,bh
    int 21h
    mov dl,'F'
    int 21h


fin:int 20h
proc saltoLinea
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
ret
saltoLinea endp  

proc espacio
    mov ah,2
    mov dl,32
    int 21h
ret
espacio endp

proc sistemaNum
    cmp cl,'b'
    jz binario
    cmp cl,'d'
    jz decimal
    cmp cl,'o'
    jz octal
    cmp cl,'h'
    jz hexad
ret
sistemaNum endp

proc establecer
    
    mov ax,0
    mov dx,0
    sub bx,3030h
    sub ch,30h
    
    mov al,bh
    mov bh,10
    mul bh
ret
establecer endp

mensaje1 db "Ingreso de numeros$" 
mensaje2 db "Ingreso de operacion$"
mensaje3 db "Seleccion de sistema numerico (b, d, o, h)$" 
cad  db 9 dup (' '),'$'
var1 db ?
num  db ?
aux db ?
