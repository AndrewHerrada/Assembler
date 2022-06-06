ORG 100H
mov si, 0
lectura:
 mov ah,1
 int 21h

 cmp al,13 
 jz resultado: 
 
 mov bx[si], al 
 
 inc si
 add ch,1
 jmp lectura

resultado:
    ;mov bx[si], "$" 
    mov si,0
    mov di,0
    mov cl,0
    mov ax,0
siguiente: 
  mov al,bx[si] 
  cmp ch,cl
  jz imprimir 
 
  cmp al, 57 
  ja incremento
  cmp al,47 
  jng incremento
  mov digitos[di],al
  inc di 
incremento: 
 inc si
 add cl,1
 jmp siguiente
 
 
resultado1:
    mov si,0
    mov di,0
    mov cl,0
    mov ax,0
siguiente1:
 
 mov al,bx[si] 
 cmp ch,cl
 jz imprimir2 
 
 cmp al,'z'
  ja incremento1
 cmp al,96
 jng incremento1
 
 mov minusculas[di],al
 inc di 
incremento1: 
 inc si ;incrementa si
 add cl,1
 jmp siguiente1
 

resultado2:
    mov si,0
    mov di,0
    mov cl,0
    mov ax,0
siguiente2:
 
 mov al,bx[si] 
 cmp ch,cl
 jz imprimir3 
 
 cmp al,'Z'
  ja incremento2
 cmp al,64
 jng incremento2
 
 mov mayusculas[di],al
 inc di 
incremento2: 
 inc si ;incrementa si
 add cl,1
 jmp siguiente2

 
 
 resultado3:
    mov si,0
    mov di,0
    mov cl,0
    mov ax,0
siguiente3:
 
 mov al,bx[si] 
 cmp ch,cl
 jz imprimir4 
 
 cmp al,20h
 ja mayor
mayor:
 cmp al,'0'
 jb menor
 jmp caso1
menor:
 mov charEspecial[di],al
 inc di
 jmp incremento3
 
caso1:
        
  cmp al,'9'
 ja mayor1
mayor1:
 cmp al,'A'
 jb menor1
 jmp caso2
menor1:
 mov charEspecial[di],al
 inc di
 jmp incremento3   
     
caso2:  
  cmp al,'Z'
 ja mayor2
mayor2:
 cmp al,'a'
 jb menor2
 jmp incremento3
menor2:
 mov charEspecial[di],al
 inc di
 jmp incremento3 
  
 
incremento3: 
 inc si ;incrementa si
 add cl,1
 jmp siguiente3
 
 
 
 
imprimir:
 mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h

mov ax,0
 
mov digitos[di], "$" 
mov dx, offset digitos
mov ah, 9 
int 21h 
  
jmp resultado1  
 ; mov ax,0
 ; mov bx,0
 ; mov cx,0
 ; mov dx,0
imprimir2:

mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h

mov ax,0  
mov minusculas[di], "$" 
mov dx, offset minusculas
mov ah, 9 
int 21h 

jmp resultado2

imprimir3:

mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h

mov ax,0
mov mayusculas[di], "$" 
mov dx, offset mayusculas
mov ah, 9 
int 21h
jmp resultado3

imprimir4:

mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h

mov ax,0
mov charEspecial[di], "$" 
mov dx, offset charEspecial
mov ah, 9 
int 21h

fin:int 20h

digitos db ?
minusculas db ?
mayusculas db ? 
charEspecial db ?
