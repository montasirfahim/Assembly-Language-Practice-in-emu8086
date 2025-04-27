.model small
.data
msg db "This is Fahim, ID: IT22016", 0ah, 0dh, '$'

.code

main proc
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov cx, 128         
    mov bh, 80h         
    mov bl, 0            
        
    mov ah, 2 
  LOOP_: 
    mov dl, bh      
    int 21h    
    mov dl, ' '
    int 21h
    
    inc bh
    inc bl          
   
    cmp bl, 10           
    jne continue_loop
    
    mov dl, 0ah
    int 21h         
    mov dl, 0dh
    int 21h
    xor bl, bl          

continue_loop:
    loop LOOP_      

    mov ah, 4Ch          
    int 21h
    main endp
end main