.model small
.code

main proc
    
    mov cx,0
    mov ah, 1
    int 21h
    
WHILE: 
    cmp al, 0dh ;cr ?
    je END_WHILE
    inc cx
    int 21h
    jmp WHILE
    
   
END_WHILE:  
    mov ah, 4ch
    int 21H

    main endp
    end main
    




