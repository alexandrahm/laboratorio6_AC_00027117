; Password hecho por Alexandra Maria Henriquez Miranda

.model small
.stack 100h
.data
    mensaje db 'Ingrese Contrasena por favor: $'
    passwd  db 'uca12'
    conta   dw 5
    correcto db 'BIENVENIDO!!$'
    incorrecto db 'INCORRECTO!!$'
	
; codificacion
                               
.code

begin:   
    mov ax, @data
    mov ds,ax
    
    mov cx,conta            ; contador cx=5
    mov bx,offset passwd    ; numero de posiciones en memoria, en este caso 'uca12'    
       
; Mostrando el mensaje de ingresar contrasena
    mov dx, offset mensaje
    mov ah, 09
    int 21h
    
; Leer caracter por caracter formando un loop  
again:
    mov ah,08               ; 
    int 21h                 ;
    
    cmp al,[bx] 
    jne error
    inc bx
    loop again  

; si despues del loop no hay problema, muestra un mensaje de bienvenida.
    
    mov dx, offset correcto
    mov ah,09
    int 21h
    jmp over

; mensaje de error por si hay un problema.
error:
    mov dx, offset incorrecto
    mov ah,09
    int 21h
    
    
over: 
    mov ah,08
    int 21h
    

end begin
    