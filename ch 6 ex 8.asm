.model small     
.data
msg db "This is Fahim, ID: IT22016 ", 0ah, 0dh, '$'
m2 db 0ah, 0dh, "In alphabatical order: "
a1 db ?
a2 db ?, "$" 
.code                                              

main proc 
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg
    int 21h  
    
    mov ah, 2
    mov dl, '?'
    int 21h
     
    mov ah, 1
    int 21h
    mov bl, al
    int 21h
    mov cl, al
    
    cmp bl, cl
    jge MOVE
    
    mov a1, bl 
    mov a2, cl
    jmp PRINT
    
    
    MOVE:
        mov a1, cl
        mov a2, bl 
        jmp PRINT
        
   
    PRINT:
        mov ah, 9
        lea dx, m2
        int 21h
    
    END_:
    mov ah, 4ch
    int 21h
    main endp
end main



