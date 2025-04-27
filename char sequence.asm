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
               
    mov al, 'Z'
    mov bl, 'Y'
   
    cmp al, bl
    jng MOVE
    
    mov ah, 2
    mov dl, bl
    int 21h
    jmp END_
    
    
    MOVE:
        mov dl, al
        mov ah, 2
        int 21h
        
    
    END_:
    mov ah, 4ch
    int 21h
    main endp
end main



