format PE GUI 4.0
entry inicio

include 'Win32a.inc'

ventana_1	equ		1
salir_btn	equ		1000

section '.data' data readable writeable

Ist  dd 0
pWnd dd 0    ;solo lectura

hdc dd 0
mando dd 0
mandoColor dd 0
pantalla RECT 15,15,679,301
rectangulo RECT 300,210,400,140
circulo RECT 80,120,120,160
triangulo1 RECT 210,120,640,200
triangulo2 RECT 210,455,640,455


ulb LOGBRUSH
uhBrush	rd    1
 
section '.code' code readable executable

inicio:
	;stdcall drawpantalla
	invoke GetModuleHandle,0
	mov [Ist],eax
	invoke DialogBoxParam,eax,ventana_1,0,DlgProc,0 
	
fin:
	invoke ExitProcess,0

proc DlgProc,hWnd,uMsg,wParam,lParam
	push edi esi ebx
	;stdcall drawpantalla
	mov eax,[uMsg]
	cmp	eax,WM_COMMAND
	je	jCOMMAND
	cmp	eax,WM_INITDIALOG
	je	jINITDIALOG
	cmp	eax,WM_CLOSE
	je	jCLOSE
	xor eax,eax
	jmp finish

jINITDIALOG:
	mov eax,[hWnd]
	mov [pWnd],eax
	
	mov eax,1
	jmp finish
	
jCOMMAND:
	mov eax,[wParam]
	cmp	eax,salir_btn
	je	salir
	
	cmp	eax,1006
	je	drawRectangulo
	
	cmp	eax,1008
	je	drawCirculo
	
	cmp	eax,1007
	je	drawTriangulo
	
	cmp	eax,1001
	je	arriba
	
	cmp	eax,1002
	je	abajo
	
	cmp	eax,1003
	je	derecha
	
	cmp	eax,1004
	je	izquierda
	
	xor eax,eax
	jmp finish

drawRectangulo:
	stdcall dibujarPanel
	mov [mando],2
drawRect:	
	invoke GetDC,[pWnd]
	mov [hdc],eax
	invoke CreateSolidBrush,0FFh
	invoke FillRect,[hdc],rectangulo,eax
	
	mov eax,1
	jmp finish
	

drawTriangulo:
	stdcall dibujarPanel
	mov [mando],3
drawTri:
	invoke GetDC,[pWnd]
	mov [hdc],eax
	
	stdcall CambiaColorFondo,00FF00h,[hdc]
	invoke Pie,[hdc],[triangulo1.left],[triangulo1.top],[triangulo1.right],[triangulo1.bottom],[triangulo2.left],[triangulo2.top],[triangulo2.right],[triangulo2.bottom] 
  
	
	mov eax,1
	jmp finish

;00FF0000h azul
;00000000h negro
drawCirculo:
	stdcall dibujarPanel
	mov [mando],1
drawCir:
	invoke GetDC,[pWnd]
	mov [hdc],eax
	
	
	stdcall CambiaColorFondo,00FF0000h,[hdc]
	invoke Ellipse,[hdc],[circulo.left],[circulo.top],[circulo.right],[circulo.bottom]
	mov eax,1
	jmp finish



derecha:
	cmp [mando],1
	je derechaCirculo
	cmp [mando],2
	je derechaRectangulo
	cmp [mando],3
	je derechaTriangulo
	
	derechaCirculo:		
		add [circulo.left], 5
  		add [circulo.right], 5
  		stdcall dibujarPanel
  		jmp drawCir
  					
	derechaRectangulo:
		add [rectangulo.left], 5
  		add [rectangulo.right], 5
		stdcall dibujarPanel
		jmp drawRect
	
	derechaTriangulo:
		add [triangulo1.left], 5
  		add [triangulo1.right], 5
  		add [triangulo2.left], 5
  		add [triangulo2.right], 5
		stdcall dibujarPanel
		jmp drawTri
		
izquierda:
	cmp [mando],1
	je izquierdaCirculo
	cmp [mando],2
	je izquierdaRectangulo
	cmp [mando],3
	je izquierdaTriangulo
	
	izquierdaCirculo:		
		sub [circulo.left], 5
  		sub [circulo.right], 5
  		stdcall dibujarPanel
  		jmp drawCir
  					
	izquierdaRectangulo:
		sub [rectangulo.left], 5
  		sub [rectangulo.right], 5
		stdcall dibujarPanel
		jmp drawRect
	
	izquierdaTriangulo:
		sub [triangulo1.left], 5
  		sub [triangulo1.right], 5
  		sub [triangulo2.left], 5
  		sub [triangulo2.right], 5
		stdcall dibujarPanel
		jmp drawTri
		
arriba:
	cmp [mando],1
	je arribaCirculo
	cmp [mando],2
	je arribaRectangulo
	cmp [mando],3
	je arribaTriangulo
	
	arribaCirculo:		
		sub [circulo.top], 5
  		sub [circulo.bottom], 5
  		stdcall dibujarPanel
  		jmp drawCir
  		
  					
	arribaRectangulo:
		sub [rectangulo.top], 5
  		sub [rectangulo.bottom], 5
		stdcall dibujarPanel
		jmp drawRect
	
	arribaTriangulo:
		sub [triangulo1.top], 5
  		sub [triangulo1.bottom], 5
  		sub [triangulo2.top], 5
  		sub [triangulo2.bottom], 5
		stdcall dibujarPanel
		jmp drawTri
		
abajo:
	cmp [mando],1
	je abajoCirculo
	cmp [mando],2
	je abajoRectangulo
	cmp [mando],3
	je abajoTriangulo
	
	abajoCirculo:		
		add [circulo.top], 5
  		add [circulo.bottom], 5
  		stdcall dibujarPanel
  		jmp drawCir
  					
	abajoRectangulo:
		add [rectangulo.top], 5
  		add [rectangulo.bottom], 5
		stdcall dibujarPanel
		jmp drawRect
	
	abajoTriangulo:
		add [triangulo1.top], 5
  		add [triangulo1.bottom], 5
  		add [triangulo2.top], 5
  		add [triangulo2.bottom], 5
		stdcall dibujarPanel
		jmp drawTri
salir:
	invoke SendMessage,[hWnd],WM_CLOSE,0,0
	mov eax,1
	jmp finish
	
jCLOSE:	
	invoke EndDialog,[hWnd],0
	mov eax,1
	
finish:
	pop ebx esi edi
	ret
endp

proc  CambiaColorFondo newColor, uhdc
    mov       [ulb.lbStyle], BS_SOLID
    mov       eax, [newColor]
    mov       [ulb.lbColor], eax
    mov       [ulb.lbHatch], NULL
    invoke    CreateBrushIndirect, ulb
    mov       [uhBrush], eax
    invoke    SelectObject,[uhdc],[uhBrush]
    ret
endp

proc MoverArriba 
  invoke CopyRect,figura,circulo
  sub [figura.top], 5
  sub [figura.bottom], 5
ret
endp

proc Redibujar hwnd
  invoke RedrawWindow,[hwnd],pantalla,NULL,RDW_ERASE+RDW_INVALIDATE
ret
endp

proc dibujarPanel 
	
	invoke GetDC,[pWnd]
    mov [hdc],eax
    invoke CreateSolidBrush,0ffffffh
    invoke FillRect,[hdc],pantalla,eax
	
	ret
endp

section '.idata' import data readable writeable
;  importamos solo los procedimientos basicos para abrir una ventana
;  library kernel, 'KERNEL32.DLL',\
;	  user,   'USER32.DLL'

;  import  kernel,\
;	  GetModuleHandle,'GetModuleHandleA',\
;	  ExitProcess,	  'ExitProcess'

;  import  user,\
;	  DialogBoxParam, 'DialogBoxParamA',\
;	  EndDialog,	  'EndDialog',\
;	  SendMessage,	  'SendMessageA'
  ;otra forma para importar los procedimientos importando archivos INC
  library kernel32,'KERNEL32.DLL',user32,'USER32.DLL',gdi32,'GDI32.DLL'
  include 'api\kernel32.inc'
  include 'api\user32.inc'
  include 'api\gdi32.inc'

section '.rsrc' resource from 'TrabajoFinal.res' data readable
