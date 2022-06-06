verificarMes macro var 
local mEnero
local mFebrero
local mMarzo
local mAbril
local mMayo
local mJunio
local mJulio
local mAgosto
local mSeptiembre
local mOctubre
local mNoviembre
local mDiciembre 
local final
 
 cmp var,1
 je mEnero
 cmp var,2
 je mFebrero
 cmp var,3
 je mMarzo
 cmp var,4
 je mAbril
 cmp var,5
 je mMayo
 cmp var,6
 je mJunio
 cmp var,7
 je mJulio
 cmp var,8
 je mAgosto
 cmp var,9
 je mSeptiembre
 cmp var,10
 je mOctubre
 cmp var,11
 je mNoviembre
 cmp var,12
 je mDiciembre
 
 jmp final:
 

mEnero:
    mov dx, offset enero
    mov ah, 9 
    int 21h 
    jmp final
mFebrero:
    mov dx, offset febrero
    mov ah, 9 
    int 21h
    jmp final 
mMarzo:
    mov dx, offset marzo
    mov ah, 9 
    int 21h  
    jmp final
mAbril:
    mov dx, offset abril
    mov ah, 9 
    int 21h  
    jmp final
mMayo:
    mov dx, offset mayo
    mov ah, 9 
    int 21h  
    jmp final
mJunio:
    mov dx, offset junio
    mov ah, 9 
    int 21h  
    jmp final
mJulio: 
    mov dx, offset julio
    mov ah, 9 
    int 21h  
    jmp final
mAgosto:   
    mov dx, offset agosto
    mov ah, 9 
    int 21h  
    jmp final
mSeptiembre: 
    mov dx, offset septiembre
    mov ah, 9 
    int 21h  
    jmp final
mOctubre:   
    mov dx, offset octubre
    mov ah, 9 
    int 21h  
    jmp final
mNoviembre: 
    mov dx, offset noviembre
    mov ah, 9 
    int 21h  
    jmp final
mDiciembre:
    mov dx, offset diciembre
    mov ah, 9 
    int 21h 
final:
endm

componer macro fech
    mov ax,0
    mov al,fech
    mov ch,10
    div ch
    
    mov bx,ax
    add bx,3030h
    mov ah,2
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h
endm

componer3 macro n
    mov ax,n
    mov ch,10
    div ch
    
    mov cl,ah
    mov ah,0
    div ch
    mov bx,ax
    add bx,3030h
    add cl,30h
    mov ah,2
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h
    mov dl,cl
    int 21h
endm

ORG 100H 

mov dx, offset msg1
mov ah, 9 
int 21h 
mov si, 0
call saltoLinea    
    
lectura:
 mov ah,1
 int 21h

 cmp al,13 
 jz continue: 


mov bx[si], al ;guarda en un solo registro

 inc si ;incrementa si
 jmp lectura 
 
continue:
    call pantalla
    mov dx, offset msg2
    mov ah, 9 
    int 21h
    
    call saltoLinea 
    
    mov si,0 

lectura2:
    mov ah,1
    int 21h

    cmp al,13 
    jz continuar: 


mov ex[si], al ;guarda en un solo registro

 inc si ;incrementa si
 jmp lectura2    
 


continuar:
    mov bx[si], "$"

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


;____________________________________________________________________________
;----------------------------------------------------------------------------
    call limpiar
    
    mov ex[si], "$"

    mov si,0
    mov di,0
    mov ax,0
    mov cx,0
elDia1:
    mov al,ex[si]
    
    cmp al, 57 
    ja  continuar4
    cmp al,47 
    jng continuar4
    sub al,30h
    mov dia1[di], al 
    inc si
    inc di
    jmp elDia1


continuar4:
    ;mov dia[di],"$"
    inc si
    mov di,0

elMes1:
    mov al,ex[si]
    
    cmp al, 57 
    ja  continuar5
    cmp al,47 
    jng continuar5
    sub al,30h
    mov mes1[di], al 
    inc si
    inc di
    jmp elMes1  

continuar5:
    
    ;mov mes[di],'$'
    inc si
    mov di,0

elAnio1:
    mov al,ex[si]
    
    cmp al, 57 
    ja  continuar6
    cmp al,47 
    jng continuar6
    sub al,30h
    mov anio1[di], al 
    inc si
    inc di
    jmp elAnio1
    
continuar6:
    ;mov dia[di],'$'
    mov di,0
    mov ax,0 
    mov cx,0
    
;composicion de dia    
    mov al,dia1[di]
    mov di,1
    mov bl,dia1[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varDia1,bl
;composicion de mes
    
    mov di,0
    mov ax,0
    mov cx,0
    
    mov al,mes1[di]
    mov di,1
    mov bl,mes1[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varMes1,bl
    
;composicion de anio
    
    mov di,0
    mov ax,0
    mov cx,0
    
    mov al,anio1[di]
    mov di,1
    mov bl,anio1[di]
    
    mov ch,10 ;divisor 
    mul ch
    add bl,al ;composicion guardado en bl
    mov varAnio1,bl

;--------armar primera fecha
    
    call pantalla
    call limpiar
    componer varDia
    call barra
    verificarMes varMes
    call barra
    componer varAnio

;-----------armar segunda fecha.

    call saltoLinea
    call limpiar
    componer varDia1
    call barra
    verificarMes varMes1
    call barra
    componer varAnio1 
    
;----------anios transcurridos
    

    call saltoLinea
    mov dx, offset aniosTra
    mov ah, 9 
    int 21h
    call limpiar
    
    mov al,varAnio1
    mov bl,varAnio
    
    cmp varAnio,al
    je anioIgual
    sub al,bl
    mov bl,al
    componer bl
    jmp seguir
anioIgual: 
    mov ah,2
    mov dl,'0'
    int 21h
    

seguir:
    call saltoLinea
    mov dx, offset mesesTra
    mov ah, 9 
    int 21h

;-----------meses transcurridos
;     = ((a2 - a + 1) * 12) - m - (12-m2)
;            bl  + 1  * 12  - m - (12-m2)
    mov al,varAnio1
    mov bl,varAnio
    sub al,bl
    add al,1
    mov bl,al
    ;sub bl,30h
    mov ch,12
    mov ax,0
    mov al,bl ;respuesta en al
    mul ch
    
    sub al,varMes
    mov bl,12
    sub bl,varMes1
    sub al,bl
    mov bl,al
    
    componer bl 
    
    call saltoLinea
    mov dx, offset diasTra
    mov ah, 9 
    int 21h
;----------------anios transcurridos
;   ((a2 - a) * 365) + (((m2 - m + 1) * 31) - d - (31 - d2))            

    mov ax,0
    mov al,varAnio1
    mov bl,varAnio
    sub al,bl
    
    mul contarAnios ;respuesta en al
    push ax
    
    call limpiar
    mov bl,varMes1
    sub bl,varMes
    add bl,1
    mov ax,0
    mov al,bl
    mul contarDias
    
    
    sub al,varDia
    
    mov cl,contarDias
    sub cl,varDia1
    
    sub al,cl
    
    pop bx
    add bx,ax
    
    componer3 bx
    
    
    
    
fin:int 20h


ex  db 20 dup (' '),'$' ;al macenar en la variable como registro
msg1 db "Ingrese 1ra fecha (dd/mm/aa)$"
msg2 db "Ingrese 2da fecha (dd/mm/aa)$"


diasTra db "Dias Transcurridos: $"
mesesTra db "Meses Transcurridos :$"
aniosTra db "Anios Transcurridos :$"


enero db "enero$"
febrero db "febrero$"
marzo db "marzo$"
abril db "abril$"
mayo db "mayo$"
junio db "junio$"
julio db "julio$"
agosto db "agosto$"
septiembre db "septiembre$"
octubre db "octubre$"
noviembre db "noviembre$"
diciembre db "diciembre$"


dia db 3 dup (' '),'$'
mes db 3 dup (' '),'$'
anio db 3 dup (' '),'$' 

dia1 db 3 dup (' '),'$'
mes1 db 3 dup (' '),'$'
anio1 db 3 dup (' '),'$' 

contarDias db 31
contarAnios dw 365
varDia db ?
varMes db ?
varAnio db ?

varDia1 db ?
varMes1 db ?
varAnio1 db ?


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

proc espacio
    mov ah,2
    mov dl,32
    int 21h
ret
espacio endp

proc pantalla
mov ah,00h ;limpia la pantalla
 mov al,03h
 int 10h 
ret
pantalla endp 

proc barra
    mov ah,2
    mov dl,'/'
    int 21h 
ret
barra endp

