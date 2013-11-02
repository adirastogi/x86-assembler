data segment 
message1 db 'Enter a char:$'
message2 db 'The char entered: $'
data ends
code segment
assume ds:data,cs:code
start:mov ax,data
      mov ds,ax
      xor ax,ax
      mov cx,5

again :mov dx,offset message1
      mov ah,09h
      int 21h

      mov ah,01h   ;input charachter
      int 21h
      mov bl,al 

      mov dl,10     ;output newline
      mov ah,02h
      int 21h
      
      mov dx,offset message2
      mov ah,09
      int 21h

      mov dl,bl     ;output char
      mov ah,02h
      int 21h
      
      mov dl,10
      mov ah,02h
      int 21h

      loop again

      mov ah,4ch
      int 21h
code ends
end start