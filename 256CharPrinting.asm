.model small

.data

.code

main proc
  
   mov cx, 256  
   mov dl, 0
   mov ah, 2
   
   PRINT_LOOP:
   
        int 21h
        inc dl
        dec cx
        jnz PRINT_LOOP
    
 
    mov ah, 4ch
    int 21h
    
    main endp
end main


