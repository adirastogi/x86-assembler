data segment 
x db 00100011b 
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      xor ax,ax
      xor bx,bx
      xor dx,dx
      mov cl,4
      
      mov bl,x
      mov al,x
      rol al,cl
      and al,00001111b
      mov dl,10d
      mul dl
      rol bl,cl
      and bl,00001111b
      add al,bl

      mov bl,al      
      mov si,8
      mov cl,1

again: shl bl,cl
       jc one
       jmp zero
one:   
       mov dl,'1'
       mov ah,02h
       int 21h
       jmp cont
zero:   
       mov dl,'0'
       mov ah,02h
       int 21h   
       jmp cont           
cont:  
       dec si
       cmp si,0 
       jne again


DISP PROC NEAR
	PUSH BX
	PUSH CX
	MOV CL,4
	MOV CH,2

DISPL1: ROL AL,CL
	PUSH AX
	AND AX,0FH
	ADD AX,30H
	CMP AX,'9'
	JBE DISPL2
	ADD AL,7
DISPL2: MOV AH,2
	MOV DL,AL
	INT 21H

	POP AX
	DEC CH
	JNZ DISPL1
	POP CX
	POP BX
RET
DISP ENDP
code ends
end start