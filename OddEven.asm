.model small
.data
 m1 db "Enter an integer: $"
.code

main proc
    mov ax, @data
    mov ds, ax  

    ; Display message
    mov ah, 9
    lea dx, m1
    int 21h

    ; Take input (read 1 character)
    mov ah, 1
    int 21h  
    mov bl, al    ; Store input in BL

    ; Flush the Enter key (consume `0Dh` from buffer)
    mov ah, 1
    int 21h  

    ; Line break
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Compare input stored in BL
    cmp bl, '1'
    je ODD 
    cmp bl, '2'
    je EVEN
    cmp bl, '3'
    je ODD
    cmp bl, '4'
    je EVEN

ODD:
    mov dl, 'o'
    jmp DISPLAY

EVEN:
    mov dl, 'e'
    jmp DISPLAY

DISPLAY:
    mov ah, 2
    int 21h 
    jmp END_CASE

END_CASE: 
    mov ah, 4Ch
    int 21h
    
main endp
end main
