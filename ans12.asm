data segment 
x dw 1024
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      xor ax,ax
      xor bx,bx
      xor dx,dx
      mov ax,1
      mov dx,1
      mov bx,1

next: cmp dx,x
      je sq
      jmp cont
sq:   mov ax,bx
      call disp   
      jmp ex
cont: add ax,2
      add dx,ax
      inc bx
      jmp next
ex:   mov ah,4ch
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