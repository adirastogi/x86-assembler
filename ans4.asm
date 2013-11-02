data segment 
x db 1,2,32,4,5,20,35,88,11,03
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      mov si,offset x
      mov cx,10
      xor ax,ax	

next: mov bx,[si]
      add ax,bx
      inc si
      dec cx
      jnz next
      call disp
      mov ah,4ch
      int 21h

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