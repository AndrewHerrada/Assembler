;Practica 2 Taller de programacion en bajo nivle.
;Ejercicio 3
org 100h
mov si,0
inicio:
   mov ah,1
   int 21h
   
   cmp al,13
   jz resultado
   
   cmp al,'z'
   ja inicio:
   cmp al,96
   jng inicio

   sub al,20h
   
   mov bx[si],al  ; si es digito, guardar en bx
   inc si 
   
jmp inicio:   
resultado:
mov ah,00h    ;limpia la pantalla
mov al,03h
int 10h
mov bx[si], "$" 
mov dx, offset bx
mov ah, 9 
int 21h 
fin:int 20h
