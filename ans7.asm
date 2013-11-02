data segment 
x dw -1,23,44,-43,54,-33,53,89,-2,10
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      mov si,offset x
      mov cx,10
      xor ax,ax
      xor bx,bx ;negv counter
      xor dx,dx	;pos counter

next: mov ax,[si]
      rcl ax,1
      jc negv
      jmp pos 	
negv:  inc bx
      jmp cont 
pos:  inc dx
      jmp cont
cont: inc si
      ;dec cx
      loop next
  
      mov ax,dx  ;display positive
      call disp
      xor ax,ax
      mov ax,bx  ;display negative
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