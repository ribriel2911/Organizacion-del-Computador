
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax,0
mov bx,0 
mov cx,0
mov dx,0


sig: mov al,3h
     cmp pos,al
     je fin
     mov bl,pos
     mov al,dato[bx]
     sub al,30h    
     call mulpes
     add dx,ax
     dec pes
     mov cl,0
     inc pos
     jmp sig
            


mulpes: inc cl
        cmp cl,pes
        je fin
        mul peso
        jmp mulpes
        


fin:
        ret

dato db "120"

pes db 3h

peso db 10h
pos db 0h