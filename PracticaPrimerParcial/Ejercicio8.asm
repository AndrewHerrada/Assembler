
org 100h

inicio:
mov dx,offset msg
mov ah,9
int 21h

call saltoLinea

mov ah,1
int 21h
sub al,30h
mov conv1,al 

int 21h
sub al,30h
mov conv2,al

cmp conv1,17
je mA
cmp conv1,18
je mB
cmp conv1,19
je mC
cmp conv1,20
je mD
cmp conv1,21
je mE
cmp conv1,22
je mF

mov al,conv1
mov num1,al
jmp sec_num

mA:
    mov num1,10
    jmp sec_num
mB:
    mov num1,11
    jmp sec_num
mC:
    mov num1,12
    jmp sec_num
mD:
    mov num1,13
    jmp sec_num
mE:
    mov num1,14
    jmp sec_num
mF:
    mov num1,15
    jmp sec_num    

sec_num:



cmp conv2,17
je mA2
cmp conv2,18
je mB2
cmp conv2,19
je mC2
cmp conv2,20
je mD2
cmp conv2,21
je mE2
cmp conv2,22
je mF2

mov al,conv2
mov num2,al
jmp operacion

mA2:
    mov num2,10
    jmp operacion
mB2:
    mov num2,11
    jmp operacion
mC2:
    mov num2,12
    jmp operacion
mD2:
    mov num2,13
    jmp operacion
mE2:
    mov num2,14
    jmp operacion
mF2:
    mov num2,15
    jmp operacion
    
operacion:
    mov al,num2
    mov bl,1
    mul bl
    mov fac1,al
    
    mov al,num1
    mov bl,16
    mul bl
    mov fac2,al
    
    mov ax,0
    mov al,fac1
    add al,fac2
    mov res,al
    
    
mov bl,0
mov ax,0 

mov al,res
mov bl,100
div bl
mov cen,al
mov res_cen,ah

mov bl,0
mov ax,0

mov al,res_cen
mov bl,10
div bl
mov dece,al
mov uni,ah

call saltoLinea

mov ah,2
mov al,cen
add al,30h
mov dl,al
int 21h

mov ah,2
mov al,dece
add al,30h
mov dl,al
int 21h

mov ah,2
mov al,uni
add al,30h
mov dl,al 
int 21h


call saltoLinea
;----------------------Transformar numero
mov bh,cen
mov bl,dece
mov ch,uni

mov cl,100
mov ax,0
mov al,bh
mul cl 

mov bh,al
mov al,bl
mov cl,10
mul cl
add bh,al
add bh,ch
mov num,bh
mov nume,bh

mov SI,7     ;Comienzan los ciclos de división entre 2
   bin:         ;Uso de etiqueta

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

call saltoLinea

mov si,2     
   bin1:        

      mov ah,00h
      mov al,nume
      mov bl,8
      div bl
      mov var1,ah
      mov nume,al

      mov dl,var1
      add dl,30h

      mov cad1[si],dl

      cmp nume,1 
      dec si
      jne bin1   
       je salida1



      cmp nume,0 
       jne bin1
        je salida1

   salida1:         

      mov dl,nume 
      add dl,30h

      mov cad1[si],dl

  mov ah,09h
  lea dx,cad1
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

num1 db 0
num2 db 0
conv1 db ?
conv2 db ?
msg db "Ingresa un numero hexadecimal de dos cifras$"
fac1 db ?
fac2 db ?
res db ?
cen db ?
res_cen db ?
uni db ?
dece db ?
nume db ? 
cad1  db 9 dup (' '),'$'
num db ? 
cad  db 9 dup (' '),'$'
var1 db ?