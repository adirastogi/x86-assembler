data segment 
x dw 56ABh,34EFh,3A43h,8922h,556Ah,7721h,5A66h,4D43h,2B4Ch,90C0h
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      mov si,offset x
      mov cx,10
      xor ax,ax
      xor bx,bx ;even counter 
      xor dx,dx	;odd counter

next: mov ax,[si]
      ror ax,1
      jc odd
      jmp eve 	
odd:  inc dx
      jmp cont 
eve:  inc bx
      jmp cont
cont: inc si
      ;dec cx
      loop next
  
      mov ax,dx  ;display odd
      call disp
      xor ax,ax
      mov ax,bx  ;display even
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