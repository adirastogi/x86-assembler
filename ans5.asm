data segment  
x db 10,9,30,5,44,20,35,8,11,3 

data ends 
code segment 
assume ds:data,cs:code 
start:mov ax,data 
	mov ds,ax 
	mov si,offset x 
	mov cx,10 
	xor ax,ax	 
	mov al,[si]  
				 
next:   mov bl,[si] 
	cmp al,bl 
	jle max  
        jmp cont 
max:    mov al,bl   
        jmp cont  
	cont: inc si 
	;dec cx 
	loop next 
				 
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