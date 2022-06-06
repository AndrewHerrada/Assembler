
org 100h
call limpiar
mov dx,offset factura
mov ah,9
int 21h
;-----------
inicio:
mov ah,1
int 21h


cmp ch,2
jb igual
 
cmp al,13
jz continue

mov ah,1
jmp inicio: 


igual:
    push ax
    add ch,1
jmp inicio
continue:

pop ax
mov bh,al
pop ax
mov bl,al
;sub bx,3030h

mov fac1,bh ;guardar datos para imprimir al final
mov fac2,bl


call saltoLinea
mov dx,offset nFactura
mov ah,9
int 21h
;------------
entrada:
mov ah,1
int 21h

cmp al,13
jz continue2
jmp entrada

continue2:

call saltoLinea
call limpiar 
mov dx,offset nomCliente
mov ah,9
int 21h
;--------------
entrada2:
mov ah,1
int 21h
;sub al,30h
add bl,al
inc contador ;guardar divisor de promedio


cmp al,13
jz continue3
jmp entrada2
continue3:
;add bl,30h
mov nomC,bl ;guardar datos para imprimir

call saltoLinea
mov dx,offset monto
mov ah,9
int 21h
;---------------
entrada3: 
mov ah,1
int 21h

cmp al,13
jz continue4
jmp entrada3
continue4: 


call saltoLinea
call limpiar
mov dx,offset fecha
mov ah,9
int 21h
;---------------    
entrada4:

mov ah,1
int 21h
cmp al,13
jz continue5
cmp al, 57 ;si tecla es mayor a 57 entonces finalizar (tecla > 57) 
 ja entrada4
cmp al,47 ;si tecla no es mayor a 47 finalizar (tecla <= 47)
 jng entrada4
 sub al,30h
 add bl,al
 ;mov fech,bl
 
 
jmp entrada4

continue5:
mov fech,bl ; guardar sumatoria de las fechas


call saltoLinea
call limpiar
mov al,nomC
mov ch,b.contador
div ch
mov dl,al
mov ax,0
mov ah,2
int 21h


call limpiar

mov al,fech
mov ch,10
div ch
add ax,3030h
mov bh,ah
mov bl,al
mov ax,0

mov ah,2
mov dl,bl
int 21h
mov dl,bh
int 21h



call limpiar

mov ah,2
mov dl,fac2
int 21h
mov dl,fac1
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

proc limpiar
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0 
ret
limpiar endp


factura db "Nit:$";los dos primeros digitos
nFactura db "Numero de factura:$"
nAutorizacion db "Numero de autorizacion:$"
nomCliente db "Nombre Cliente:$";promedio de las letras
monto db "Monto:$"
fecha db "Fecha:$";sumatorio de los digitos

contador dw 0
fac1 db ?
fac2 db ? 
nomC db ? 
fech db ?