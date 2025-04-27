.model small
.data  
msg db "This is Fahim, ID: IT22016", 0ah, 0dh, "$"
m1 db "Sum of "
c1 db ?, "$"
m2 db " and "
c2 db ?, "$"
m3 db " is: "
res db ?, "$"

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
    sub al, 48 
    mov cl, al
    add al, 48 ;again into character
    mov c1, al 
     
    mov ah, 1
    int 21h 
    sub al, 48  
    mov dl, al
    add al, 48 
    mov c2, al
    
   
    mov bl, cl
    add bl, dl
    add bl, 48  ;ascii character to print
    mov res, bl ;move the ans to res
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
             
    mov ah, 9
    lea dx, m1
    int 21h    
    lea dx, m2
    int 21h   
    lea dx, m3
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
    


