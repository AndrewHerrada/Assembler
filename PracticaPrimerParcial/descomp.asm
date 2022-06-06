macro descomp var
   push ax
   push dx
   mov al,var
   
   cmp al,10
   ja dosDigitos   
    
unDigito:
   sub bh,30h
   mov ax,0
   mov al,bh
   ;mov cl,2   ;divisor
   ;div cl
   mov bh,al
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   
   mov dl,bh
   add dl,30h
   int 21h 
   
   	   

   jmp fin
    
dosDigitos:
   mov cl,10
   div cl
   mov bh,al
   mov bl,ah
   sub bx,3030h
   mov ax,0
   mov cl,10   ;mult/divisor
   mov al,bh
   mul cl
   
   add al,bl
   ;mov bh,al
   
   ;mov ax,0
   ;mov al,bh
   ;mov cl,2
   ;div cl
   
   mov cl,10
   div cl
   
   mov bx,ax
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   
   mov ah,2
   mov dl,bl
   add dl,30h
   int 21h
   mov dl,bh
   add dl,30h
   int 21h
   pop ax
   pop dx
   jmp fin
tresDigitos:  
   sub bx,3030h
   sub ch,30h
   mov ax,0
   mov cl,10
   mov al,bh
   mul cl
   
   add al,bl
   mul cl
   add al,ch
   
   ;mov cl,2
   ;div cl
   
   mov bl,al
   mov ax,0
   mov cl,10
   mov al,bl
   div cl
   
   mov bh,ah
   mov ah,0
   div cl
   
   mov bl,ah
   mov ch,al
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   
   
   mov dl,ch
   add dl,30h
   int 21h
   mov dl,bl
   add dl,30h
   int 21h
   mov dl,bh
   add dl,30h
   int 21h
   
   
fin:endm