
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax,0
mov bx,0 
mov cx,0
mov dx,0
mov ah,9

apilar: mov cx,0
        push fila8
        push fila7
        push fila6
        push fila5
        push fila4
        push fila3
        push fila2
        push fila1
        push fila0
        mov ah,9
        mov dx,offset salto
        int 21h
        

MOSTRAR_TABLA:  cmp cl,9
                je fin
                pop dx
                mov ah,9
                int 21h
                inc cl
                jmp MOSTRAR_TABLA
                    

fin:
        ret


PEDIR_NUM:  mov ah,1
            int 21h
            sub al,30h
            ret


fila0: db "  1 2 3 4 5 6 7 8", 0Dh,0Ah, 24h
fila1: db "1 * * * * * * * *", 0Dh,0Ah, 24h
fila2: db "2 * * * * * * * *", 0Dh,0Ah, 24h
fila3: db "3 * * * * * * * *", 0Dh,0Ah, 24h
fila4: db "4 * * * * * * * *", 0Dh,0Ah, 24h
fila5: db "5 * * * * * * * *", 0Dh,0Ah, 24h
fila6: db "6 * * * * * * * *", 0Dh,0Ah, 24h
fila7: db "7 * * * * * * * *", 0Dh,0Ah, 24h
fila8: db "8 * * * * * * * *", 0Dh,0Ah, 24h

palabras: db "AAA","AAA","AAA", 0Dh,0Ah, 24h

salto db 13,10,"$"
