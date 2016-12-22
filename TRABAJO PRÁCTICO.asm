org 100h
Name "TP OC"

jmp start

escena_1 db "I",1,2,10, "Hay una invasion zombie. Estas solo y te encuentras en la calle. Que quieres hacer?", 10,13, "1)Buscar herramientas en las casas",10,13, "2)Recorrer las calles$"
  
escena_2 db "I",5,6,8, "Te cansaste corriendo hacia la casa, hay muchos zombies afuera. Que quieres hacer?",10,13,"1)Descansar y dormir",10,13,  "2)Buscar armas y asegurar la casa$"   

escena_3 db "I",3,4,8, "Te cansaste corriendo en las calles, los zombies te persiguen. Hacia donde quieres ir?",10,13,"1)A la estacion de policia",10,13,"2)A la ciudad$"

escena_4 db "I",11,12,7, "En la estacion de policia encuentras muchas armas y un auto. Que quieres hacer?",10,13,"1)Te vas con el auto y las armas",10,13,"2)Te metes adentro y te quedas$"

escena_5 db "F",0,0,0, "En la ciudad hay muchos zombies, quedas atrapado y mueres$" ;muerte

escena_6 db 'F',0,0,0, "Los zombies entraron en la casa mientras dormias y fuiste devorado$" ;muerte 

escena_7 db "I",7,8,7, "Aseguras la casa y reunes muchas armas. Que quieres hacer?",10,13,"1)Mirar por la ventana",10,13,"2)Subir a la terraza$"

escena_8 db "I",9,10,7, "Ves una persona. No sabes si esta infectado. Que quieres hacer?",10,13,"1)Ayudarlo",10,13,"2)Dispararle$" 

escena_9 db "I",14,18,7, "Encontraste unos binoculares, y logras localizar un campamento zombie. Que haces? ",10,13,"1)Ir al terreno zombie",10,13,"2)Esperar ayuda$"

escena_10 db "I",22,19,6, "Ayudas a la persona. Resulta ser un militar",10,13,"1)Quieres unirte al ejercito",10,13,"2)Abandonarlo$"

escena_11 db "F",0,0,0, "El ruido del disparo atrae a los zombies, no logras escapar$" ;muerte

escena_12 db "I",13,8,6, "El auto se quedo sin combustible. Estas en el medio del campo. Que haces? ",10,13,"1)Ir a pie por la ruta",10,13,"2)Buscar refugio en el campo$"

escena_13 db "I",17,15,4, "Encuentras un zombie y salis lastimado",10,13,"1)Buscar un antidoto",10,13,"2)Cortarte el brazo$"

escena_14 db "I",14,16,6, "Una oleada zombie te persigue, que haces?",10,13,"1)Combatir",10,13,"2)Salir corriendo$"

escena_15 db "I",22,19,5, "Comienza  a combatir con los zombies. Estas rodeado y te salvan los militares",10,13,"1)Continuas con ellos",10,13,"2)Sigues solo$"

escena_16 db "F",0,0,0, "Mueres desangrado$" ;muerte

escena_17 db "F",0,0,0, "Te atraparon los zombies, has muerto$" ;muerte

escena_18 db "I",20,21,5, "Te encuentras con militares y te ofrecen ayuda",10,13,"1)Unirse a su ejercito",10,13,"2)Ignorarlos$"

escena_19 db "I",22,19,5, "Llegan las fuerzas militares y te solicitan unirte a ellos. Deseas ir a la batalla?",10,13,"1)Ir",10,13,"2)Quedarse$"

escena_20 db "F",0,0,0, "No logras sobrevivir solo por falta de alimentos y medicamentos, mueres$" ;muerte

escena_21 db "I",22,19,5, "Logran salvarte con un antidoto de ellos, te piden que te unas a sus fuerzas",10,13,"1)Aceptar",10,13,"2)Rechazar$"

escena_22 db "F",0,0,0, "No logras encontrar el antidoto, mueres infectado$" ;muerte

escena_23 db "I",23,24,4, "En el medio de la batalla, te piden que coloques una bomba en el campo central zombie, que decides hacer?",10,13,"1)Arriesgar tu vida e ir",10,13,"2)Esperar un rato$"

escena_24 db "I",25,26,4, "Tienes la bomba, que decides hacer?",10,13,"1)Ir corriendo",10,13,"2)Ir escondiendose$"

escena_25 db "I",25,26,4, "Los zombies han tomado mucho terreno, y ya no tienes tiempo, hay que tomar una decision . Tomas la bomba para colocarla. Como decides ir?",10,13,"1)Ir corriendo",10,13,"2)Ir escondiendose$"

escena_26 db "F",0,0,0, "Te tropiezas y no puedes escapar, has sido devorado$" ;muerte                            

escena_27 db "I",27,28,2, "Avanzas despacio esquivando los zombies, y logras llegar a destino. Colocas la bomba pero no hay forma de escapar del campamento",10,13,"1)Sacrificarse para proteger la bomba",10,13,"2)Intentar escapar$"
                                                                                                                   
escena_28 db "W",0,0,1, "Llega un helicoptero justo antes de que explote la bomba. Logras escapar, has salvado a la humanidad$"

escena_29 db "F",0,0,0, "Dejaste la bomba sola, y los zombies la destrozan. Ya no hay esperanza, la humanidad sera totalmente infectada$"
                                     
mensaje_energia db "Energia: $"
energia db "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
GAME__OVER db "                 GAME OVER!!$"
cartel_win db "                 HAS GANADO!!$"
vector_posiciones dw 56 DUP(0)

salto db 10,13,"$"

start:
XOR SI,SI
MOV vector_posiciones [0],offset escena_1
MOV vector_posiciones [2],offset escena_2
MOV vector_posiciones [4],offset escena_3
MOV vector_posiciones [6],offset escena_4
MOV vector_posiciones [8],offset escena_5
MOV vector_posiciones [10],offset escena_6
MOV vector_posiciones [12],offset escena_7
MOV vector_posiciones [14],offset escena_8
MOV vector_posiciones [16],offset escena_9
MOV vector_posiciones [18],offset escena_10
MOV vector_posiciones [20],offset escena_11
MOV vector_posiciones [22],offset escena_12
MOV vector_posiciones [24],offset escena_13
MOV vector_posiciones [26],offset escena_14
MOV vector_posiciones [28],offset escena_15
MOV vector_posiciones [30],offset escena_16
MOV vector_posiciones [32],offset escena_17
MOV vector_posiciones [34],offset escena_18
MOV vector_posiciones [36],offset escena_19
MOV vector_posiciones [38],offset escena_20
MOV vector_posiciones [40],offset escena_21
MOV vector_posiciones [42],offset escena_22
MOV vector_posiciones [44],offset escena_23
MOV vector_posiciones [46],offset escena_24
MOV vector_posiciones [48],offset escena_25
MOV vector_posiciones [50],offset escena_26
MOV vector_posiciones [52],offset escena_27
MOV vector_posiciones [54],offset escena_28
MOV vector_posiciones [56],offset escena_29

cicloPpal:;juego

call calcular_energia
call mostrar_mensaje_energia
call mostrar_energia
call enter
call mostrar_escenario
call enter
call game_over
cmp cl,1
je fin_del_juego
cmp cl,2
je fin_del_juego
call win
call pedir_opcion                      
call calcular_escenario
call enter
jmp cicloPpal                                
                      

fin_del_juego:
ret
win PROC
    xor ax,ax
    xor cx,cx
    xor dx,dx
    mov bx, vector_posiciones[SI]
    mov dx,bx[0]
    mov ax,'W'
    xor dh,dh
    cmp dx,ax
    je mostrar_final_ganado
    ret
    mostrar_final_ganado:
    mov cl,2
    mov dx,offset cartel_win 
    mov ah, 09h
    int 21h
    ret
game_over PROC
    xor ax,ax
    xor cx,cx
    mov bx, vector_posiciones[SI]
    mov dx,bx[0]
    xor dh,dh
    mov ax,'F'
    cmp dx,ax
    je mostrar_final
    ret
    mostrar_final:
    mov cl,1
    mov dx,offset GAME__OVER 
    mov ah, 09h
    int 21h
    ret
    game_over ENDP 


mostrar_mensaje_energia PROC
    XOR DX,DX
    MOV DX, offset mensaje_energia
    MOV AH, 09h
    INT 21h
    ret
    mostrar_mensaje_energia ENDP

mostrar_energia PROC
    MOV DX, offset energia
    MOV AH,09h
    INT 21h
    ret
    mostrar_energia ENDP

calcular_energia PROC
    xor di,di
    xor ax,ax
    xor cx,cx
    mov bx, vector_posiciones[SI]
    mov dx, bx[3] 
    xor dh,dh
    comp:
    cmp dx,ax
    je salt
    
    n1:
    mov energia[di], '*'
    inc ax
    inc di
    jmp comp
     
    salt:
    mov ax,10
    modificar:
    cmp di,ax
    je fin_c
    mov energia[di], '$'
    inc di
    jmp modificar
     
    fin_c:
    ret
    calcular_energia ENDP
    
    
    

    
    
pedir_opcion PROC
    pedir_dato:
    MOV AH,07h
    INT 21h
    CMP AL,'1'
    je fin
    CMP AL,'2'
    je fin    
    jmp pedir_dato
    fin:
    ret
    pedir_opcion ENDP

mostrar_escenario PROC
    mov bx, vector_posiciones[SI]
    mov dx, bx
    add dx, 4
    mov ah, 09h
    int 21h
    ret
    mostrar_escenario ENDP

calcular_escenario PROC
    XOR AH, AH
    SUB AL, 30h
    ADD BX, AX
    MOV CL,[BX]
    MOV SI,CX
    MOV AX, SI
    MOV AH, 2
    MUL AH
    MOV SI, AX
    ret
    calcular_escenario ENDP
enter PROC
    MOV DX,offset salto
    MOV AH,9h
    INT 21h
    ret
    enter ENDP    