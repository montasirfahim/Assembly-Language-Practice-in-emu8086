.model small     
.data
msg db "This is Fahim, ID: IT22016 ", 0ah, 0dh, '$' 
m1 db "Enter a lowercase letter: $"
m2 db 0ah, 0dh, "In upper-case it is: $"
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
    sub al, 32
    mov bl, al
    
    mov ah, 9
    lea dx, m2
    int 21h
  
    mov ah, 2
    mov dl, bl
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main



