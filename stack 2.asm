.model small 
.stack 100h    
.data
msg db "This is Fahim, ID: IT22016 ", 0ah, 0dh, '$'
.code                                              

main proc 
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg
    int 21h  
    mov cx, 0
    mov ah, 1
    WHILE:
      int 21h
      cmp al, 0dh
      je END_
      push ax
      inc cx
      jmp WHILE
    
    END_:
     mov ah, 2
     mov dl, 0ah
     int 21h
     mov dl, 0dh
     int 21h
     
    
    mov ah, 2 
    PRINT:
     pop dx
     int 21h
     loop PRINT
    
     
    mov ah, 4Ch
    int 21h
    main endp
end main




