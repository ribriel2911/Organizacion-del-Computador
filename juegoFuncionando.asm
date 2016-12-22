
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

start:

call reiniciarTabla
mov estado,0
mov ax,0
mov bx,0
mov cx,0  ;guarda posicion ingresada por el usuario
mov dx,0
mov di,0  ;guarda mi posicion actual en TAMANIOS y BLOQUES
mov si,0
jmp juego

juego:

call enter
call enter
call MOSTRAR_TABLA
call enter
call enter
cmp di,20
je finJuego
call MOSTRAR_ACTUAL
call enter
call INGRESAR
call LIBRE  
call enter
call enter
cmp estado,0
jne finJuego
call enter
call RESTAR
call COPIAR

jmp juego
ret

finJuego:
    
    cmp di,3
    je gano
    mov dx,offset lose
    mov ah,9
    int 21h
    jmp volver

gano:
    mov dx,offset win
    mov ah,9
    int 21h
    jmp volver

volver:
    call enter
    mov ah,9
    mov dx,offset preguntar
    int 21h
    call enter
    mov ah,1
    int 21h
    cmp al,89
    je start
    cmp al,121
    je start
    cmp al,78
    je terminar
    cmp al,110
    je terminar
    jmp volver
    
terminar:
    call enter
    mov ah,9
    mov dx, offset dijoNo
    int 21h
    ret


enter:
    MOV DX,offset salto
    MOV AH,9h
    INT 21h
    ret

reiniciarTabla:
    mov bx,offset TABLA
    mov si,1
    asteriscar_RT:
            cmp si,128
            jae fin_RT
            mov bx[si],42
            add si,2
            jmp asteriscar_RT
    
    fin_RT:
            ret
        

INGRESAR:
    mov ax,0
    mov cx,0
    mov bx,0
    mov dx,0
    
  pedirPrim:
    call enter  
    mov ah,9
    mov dx,offset PEDIR_FILA
    int 21h
    call enter    
    mov ah,1
    int 21h
    cmp al,37h
    ja pedirPrim
    cmp al,30h
    jb pedirPrim
    sub al,30h
    mov bh,8
    mul bh    
    mov cl,al
    call enter
    jmp pedirSeg
    
  pedirSeg:
    call enter
    mov ah,9
    mov dx,offset PEDIR_COLUMNA
    int 21h
    call enter
    mov ah,1
    int 21h
    cmp al,37h
    ja pedirSeg
    cmp al,30h
    jb pedirSeg
    sub al,30h
    add al,cl
    mov bh,2
    mul bh
    mov cl,al
    ret


MOSTRAR_TABLA:

    push di ;guardo di en pila
    
    mov ax,0
    mov bx,0 
    mov dx,0
    mov si,0
    mov di,0 ;di es el puntero que cuenta hasta 8
        
    mov ah,9
    mov dx,offset Fila0
    int 21h
    call enter
    mov ah,2
    mov dl,FilaACT
    int 21h
    inc FilaACT
    
    main:   cmp si,128
            je fin
               
            cmp di,16
            je salto_linea
            dibujar:
            mov bx, offset TABLA
            mov dx, bx[si]
            mov ah,2
            int 21h
            inc si
            inc di
            jmp main
            
            
            salto_linea:
            call enter
            mov ah,2
            mov dl,FilaACT
            int 21h
            inc FilaACT
            mov dx,0
            mov di,0
            jmp dibujar        

    fin:    
            mov FilaACT,30h
            pop di ;recupero di
            ret


MOSTRAR_ACTUAL:
    
    mov si,0
    mov cx,0
    mov bx, offset TAMANIOS
    mov cl,bx[di]
    mov bx, offset BLOQUES
    mov dl,bx[di]
    
    mostrar:    
                cmp si,cx
                je finMostrar
                mov ah,2
                int 21h
                inc si
                jmp mostrar
                
    finMostrar:
                ret                


COPIAR:
    
    mov ax,0
    mov bx,0
    mov dx,0
    mov si,1
    add si,cx
    mov bx, offset TAMANIOS
    mov al,bx[di]
    mov bh,2
    mul bh
    add cl,al
    mov bx, offset BLOQUES
    mov dl,bx[di]
    
    main_C: cmp si,cx
            jae fin_C
            mov bx,offset TABLA
            mov bx[si],dl
            add si,2
            jmp main_C
            
    fin_C:  mov TABLA,offset bx
            inc di
            mov cx,0
            ret

RESTAR:            
            
    mov ax,0
    mov bx,0
    mov dx,0
    mov si,1
    mov bx, offset TABLA
   
    main_R: cmp si,128
            jae  fin_R
            mov al,bx[si]
            cmp al,65
            je  asteriscar
            cmp al,42
            jne disminuir
            add si,2
            jmp main_R
            
    disminuir:
            sub bx[si],1
            add si,2
            jmp main_R
            
    asteriscar:
            mov bx[si],42
            add si,2
            jmp main_R
            
    fin_R:
           mov TABLA,offset bx
           ret 
    

LIBRE:

    
    push cx
    
    mov ax,0
    mov bx,0
    mov dx,0
    mov si,1
    add si,cx
    mov bx, offset TAMANIOS
    mov al,bx[di]
    mov bh,2
    mul bh
    add cl,al
    
    
    main_L: cmp si,cx
            jae fin_L            
            mov bx,offset TABLA
            cmp bx[si],42
            jne perdiste
            cmp si,128
            jae perdiste
            add si,2
            jmp main_L
            
    perdiste:
             mov estado,1
             jmp fin_L
             
    fin_L:  pop cx
            ret
            

lose db "PERDISTE$"
win db "GANASTE!!$"

Fila0 db "  0 1 2 3 4 5 6 7$"

PEDIR_FILA db "Ingrese un numero valido de fila:$"
PEDIR_COLUMNA db  "Ingrese un numero valido de columna:$"

preguntar db "Quiere volver a jugar? y/n?$"
dijoNo db "Gracias por jugar$"


TABLA db 128 dup(" *"),"$"

FilaACT db 30h

salto db 10,13,"$"

BLOQUES db "DBCDEFABAFFFECDEFGAB"

TAMANIOS db 10,4,20,10,10,12,10,5,20,3,6,12,11,5,4,3,20,1,2,34

estado db 0