
.model small
.data
m1 db 0AH, 0DH, "Enter a capital alphabet: $" 
m2 db 0ah, 0dh, "Invalid input! Please enter a Capital letter: $"
m3 db 0ah, 0dh, "Want to continue? y/n: $"

.code


main proc
    mov ax, @data
    mov ds, ax

WHILE:    
    mov ah, 9
    lea dx, m1
    int 21h 
    
    mov ah, 1
    int 21h 
    mov bl, al 
   
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
                
    mov cx, 10
      
    cmp bl, 'A'
    jl ERROR
    cmp bl, 'Z'
    jg ERROR 
    
   
    mov ah, 2
    mov dl, bl
 
TOP:   
    int 21h    
    loop TOP 
    
AGAIN:
    mov ah, 9
    lea dx, m3
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je WHILE
    cmp al, 'Y'
    je WHILE
    JMP EXIT  

ERROR:
    MOV AH, 9
    LEA DX, m2
    int 21h
    jmp WHILE
        
    
EXIT:    
    
    mov ah, 4ch 
    int 21h
    
    main endp
    end main
                




