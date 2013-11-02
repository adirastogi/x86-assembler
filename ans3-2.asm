.286
;.model tiny

assume cs:code,ds:data 
                    ;.code

data segment

;org 100h

      a db 21h
      b db 22h
      

data ends

code segment 

start:
      MOV AX,DATA
      MOV DS,AX

     mov al,a
     add al,b
          
     ;mov dl,al

     ;mov ah,2
     ;int 21h
     
     CALL DISP  
     
     mov ah,4ch

     int 21h


DISP   		PROC NEAR
               PUSH BX
               PUSH CX
               MOV CL,4 ;ROTATE 4 TIMES
               MOV CH,2  ; 2 DIGITS
 
	DISPH1:ROL AL,CL
               PUSH AX
               AND AX,0FH       ;;
               ADD AX,30H
               CMP AX,'9'       ;;
               JBE DISPH2
               ADD AL,7         ;; 
               
	DISPH2:MOV AH,2      ;FOR OUTPUT    
               MOV DL,AL        ;; 
               INT 21H
               POP AX
               DEC CH
               JNZ DISPH1
               POP CX
               POP BX
               RET

	DISP     ENDP

     

code ends ; end code segment

end start  