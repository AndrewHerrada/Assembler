ORG 100H 

dia db 3 dup (' '),'$'
mes db 3 dup (' '),'$'
anio db 3 dup (' '),'$' 


varDia db ?
varMes db ?
varAnio db ?

num db ? 
cad  db 9 dup (' '),'$'
var1 db ? 


mov si, 0
lectura:
 mov ah,1
 int 21h

 cmp al,13 
 jz resultado: 


mov bx[si], al ;guarda en un solo registro

 inc si ;incrementa si
 jmp lectura 

continuar:
    mov si,0
    mov di,0
    mov ax,0
    mov cx,0
elDia:
    mov al,bx[si]
    
    cmp al, 57 
    ja  continuar1
    cmp al,47 
    jng continuar1
    sub al,30h
    mov dia[di], al 
    inc si
    inc di
    jmp elDia


continuar1:
    ;mov dia[di],"$"
    inc si
    mov di,0

elMes:
    mov al,bx[si]
    
    cmp al, 57 
    ja  continuar2
    cmp al,47 
    jng continuar2
    sub al,30h
    mov mes[di], al 
    inc si
    inc di
    jmp elMes  

continuar2:
    
    ;mov mes[di],'$'
    inc si
    mov di,0

elAnio:
    mov al,bx[si]
    
    cmp al, 57 
    ja  continuar3
    cmp al,47 
    jng continuar3
    sub al,30h
    mov anio[di], al 
    inc si
    inc di
    jmp elAnio
    
continuar3:
    ;mov dia[di],'$'
    mov di,0
    mov ax,0 
    mov cx,0
    
;composicion de dia    
    mov al,dia[di]
    mov di,1
    mov bl,dia[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varDia,bl
;composicion de mes
    
    mov di,0
    mov ax,0
    mov cx,0
    
    mov al,mes[di]
    mov di,1
    mov bl,mes[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varMes,bl
    
;composicion de anio
    
    mov di,0
    mov ax,0
    mov cx,0
    
    mov al,anio[di]
    mov di,1
    mov bl,anio[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varAnio,bl
    
;-------------------------------------------imprimir dia    
    call saltoLinea
    
    mov bl,varDia
    mov num,bl  
    
    call binario
    
    call limpiar  

    mov bl,varDia
    call hexa

;-----------------------------imprimir mes
    call saltoLinea
    call limpiar
    
    mov bl,varMes
    mov num,bl  
    
    call binario
    
    call limpiar  

    mov bl,varMes
    call hexa
;------------------------------imprimir anio
    call saltoLinea
    call limpiar
    
    mov bl,varAnio
    mov num,bl  
    
    call binario
    
    call limpiar  

    mov bl,varAnio
    call hexa
    
jmp final    
    
    
resultado:
  call saltoLinea

 
mov bx[si], "$" 
mov dx, offset bx
mov ah, 9 ;preparar ah con 9 para la interrupcion 21h
int 21h ;mostrar contenido en dx 
jmp continuar

final:int 20h



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

proc hexa
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
fin:
ret
hexa endp

proc binario
mov SI,7     
   bin:      

      mov ah,00h
      mov al,num
      mov bl,2
      div bl
      mov var1,ah
      mov num,al

      mov dl,var1
      add dl,30h

      mov cad[si],dl

      cmp num,1 
      dec si
      jne bin   
       je salida



      cmp num,0 
       jne bin
        je salida

   salida:         

      mov dl,num
      add dl,30h

      mov cad[si],dl

  mov ah,09h
  lea dx,cad
  int 21h
ret
binario endp