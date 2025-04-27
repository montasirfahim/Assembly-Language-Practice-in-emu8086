.model small
.stack 100h
.data       
 m1 db 0dh, 0ah, "Enter some characters: $"
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0 
    mov ah, 9
    lea dx, m1
    int 21h         
    mov ah, 1          
    int 21h            
    
WHILE:
    cmp al, 0dh        ; Check if the character is Enter (CR, 0dh)
    je EXIT_LOOP       ; If Enter, exit the loop
    
    inc cx             ; Increment counter
    push ax            ; Push the current character onto the stack
    int 21h            ; Read the next character
    jmp WHILE          ; Jump back to the loop to continue reading
    
EXIT_LOOP:
    ; If cx is zero (nothing was entered), exit immediately
    jcxz END_

    mov ah, 2 
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
TOP: 
    pop dx             ; Pop the character from the stack into DX
    int 21h            ; Call DOS interrupt to print the character
    loop TOP           ; Loop back if there are more characters to print
    
END_:
    mov ah, 4ch        
    int 21h            
    
main endp
end main
