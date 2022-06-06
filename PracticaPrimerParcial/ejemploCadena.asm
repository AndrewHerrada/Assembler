
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

inicio:
mov cx,12
mov si, offset aux
mov ah,1
c2:
int 21h
 cmp al,13
 je enter
 mov [si],al
 inc si
    loop c2
enter: 
 mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h
 
 mov cx,12
 mov si,offset aux
 mov ah,2
 
ciclo:
    mov dl,[si]
    int 21h
    inc si 
    loop ciclo
fin: int 20h

aux db ''
;x dw 0



