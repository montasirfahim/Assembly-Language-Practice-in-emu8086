    .model small
    .stack 100h 
    .data
    m1 db "Enter some characters: $"
    .code
    
   main proc 
         
        mov ax, @data ;load data segment
        mov ds, ax    ;mov data segment address to ds register
        
        mov ah, 9     ;prepare to display a string
        lea dx, m1            ;mov dl, '?'
        int 21h 
         
        ;line break
        mov ah,2   ;display char mode 
        mov dl,0dh ;Carriage return
        int 21h    ;execute
        mov dl,0ah ;Line Feed    
        int 21h    ;execute
        
        xor cx,cx  ;count = 0
        
        ;read character
        mov ah, 1  ;character input mode  
        int 21h    ;execute (read a char)
        
        
   ;while character is not a carriage return do
        
   WHILE_:
        
            cmp al,0dh   ;Carriage return?
            je END_WHILE ;if yes(equal to cr:0dh), exit the loop
            
            ;else, save the character to the stack and increment the count
            push ax
            inc cx
            
            int 21h   ;read a character again
            jmp WHILE_ 
             
        
   END_WHILE:
            ;go to a new line
            mov ah,2   ;displaying a char mode
            mov dl,0dh ;Carriage return
            int 21h    ;execute
            mov dl,0ah ;LF    
            int 21h
            jcxz EXIT  ;exit if count is zero 
            
   TOP: 
            pop dx    ;get a char from stack
            int 21h   ;display it  
            loop TOP
            
   EXIT:
        mov ah,4ch
        int 21h
   main endp
   end main
            
            
            
            