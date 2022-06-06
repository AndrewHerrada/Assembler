

org 100h
inicio: 
   mov var1,0   ;Residuo de cero
   mov ah,1   ;Utilizado con la interrupcu�n siguiente
   int 21h      ;Interrupci�n para leer
   sub al,30h   ;Obtenci�n de valor real
   mov num,al   ;N�mero con que trabajaremos

   mov al,num  
   mov bl,10    ;Movemos a bl 10
   mul bl       ;Multiplicamos 10 por el n�mero a convertir
   mov aux,al   ;Asignamos a aux el residuo

   mov var1,0   ;Para segundo d�gito se repite
   mov ah,1
   int 21h      
   sub al,30h
   add aux,al   ;Lo agregamos al n�mero anterior multiplicado por 10
   mov bl,aux   ;�ste ya no necesita ser multiplicado
   mov num,bl   ;El n�mero resultante a bl

   mov ah,2   ;Imprimimos signo de igual
   mov dl,'='
   int 21h

   mov si,6     ;Comienzan los ciclos de divisi�n entre 2
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

      cmp num,1 ;Hacemos comparaci�n
      dec si
      jne bin   ;Indicamos volver a etiqueta bin o:
       je salida   ;Ir a etiqueta salir



      cmp num,0 ;Comparacion con 0
       jne bin
        je salida

   salida:          ;Etiqueta de salida

      mov dl,num ;Proceso para imprimir cadena final con n�mero binario
      add dl,30h

      mov cad[si],dl

  mov ah,09h
  lea dx,cad
  int 21h

fin:int 20h

cad  db 9 dup (' '),'$'
var1 db ?
num  db ?
aux  db ?