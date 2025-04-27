.model small
.data
msg db "This is Fahim, ID: IT22016", 0ah, 0dh, "$"  
m1 db "Enter three initials: $"

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h  
    lea dx, m1
    int 21h
     
    mov ah, 1
    int 21h
    mov bl, al  ;a
    int 21h
    mov cl, al  ;b
    int 21h  
    mov bh, al
    
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, bl
    int 21h 
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, cl
    int 21h   
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, bh
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main





