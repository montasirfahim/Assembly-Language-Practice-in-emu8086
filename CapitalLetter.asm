.model small
.data
 m1 db "Enter any alphabet: $"
.code

main proc
    
    MOV AX,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h  
    
    mov ah, 1
    int 21h 
    
    MOV BL, AL ;copy character into bl  
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl,0ah
    int 21h
    
  
    
    cmp bl, 'A'
    jnge END_IF
    cmp bl, 'Z'
    jnle END_IF
    
    mov dl, bl
    mov ah, 2
    int 21H  
    
END_IF:
    mov ah, 4ch
    int 21H

main endp
end main
    




