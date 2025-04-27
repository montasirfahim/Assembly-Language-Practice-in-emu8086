.model small
.code

main proc
    
    mov cx,100
    mov dl, '*'
    mov ah, 2
    
TOP:
    int 21h
    loop TOP
    
   
   
    mov ah, 4ch
    int 21H

    main endp
    end main
    




