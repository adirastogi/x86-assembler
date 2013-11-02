data segment 
x db 01h,17h,2Bh,3Fh,36h,21h,35h,58h,02h,0Ah
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      mov cx,10
      xor ax,ax
      xor bx,bx
 
next: mov bx,9
      mov si,offset x      
next1:mov al,[si]
      mov dl,[si+1]
      cmp al,dl
      jg swap
      jmp cont1
swap: mov [si],dl
      mov [si+1],al
      jmp cont1
cont1:inc si
      dec bx
      jnz next1   
      loop next

      mov cx,10  
      mov si,offset x
again: mov al,[si]  
      call disp
      mov dl,' '
      mov ah,02h
      int 21h
      inc si
      loop again

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