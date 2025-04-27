.model small
.data
   m1 db 0ah,0dh,"Enter a hex digit: $"
   m2 db 0ah,0dh, "In decimal it is: "
   res1 db ?, "$"
   m3 db 0ah,0dh,"Do you want more y/n?: $"
   m4 db 0ah, 0dh, "Illegal input! Enter 0-9 or A-F: $"
   m5 db 0ah, 0dh, "In decimal it is: 1"
   res2 db ?,"$"

.code  


main proc
    mov ax, @data
    mov ds, ax
     
    Begin:
    mov ah, 9
    lea dx,m1
    int 21h
    
    Input:
    mov ah, 1
    int 21h
    
    cmp al, '0'
    jnge illegal_check
    cmp al, '9'
    jnle illegal_check
    
    mov res1, al
    mov ah, 9
    lea dx, m2
    int 21h
    jmp msg_show
    
    
    
    illegal_check:
     cmp al, 'A'
     jl illegal
     cmp al, 'F'
     jg illegal
     
     sub al, 11h
     mov res2, al 
     mov ah, 9
     lea dx, m5
     int 21h
     jmp msg_show
               
               
    illegal:
    mov ah, 9
    lea dx, m4
    int 21h
    jmp Input
    
    msg_show:
    mov ah, 9
    lea dx, m3
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je Begin
    cmp al, 'Y'
    je Begin   
    jmp END_  
    
    
    
    
    END_:
    
    mov ah, 4ch
    int 21h
    
    
 main endp
end main
    
    

