.model small
.data  
msg db "This is Fahim, ID: IT22016 ", 0ah, 0dh, '$'
m2 db 0ah, 0dh, "Result of b - 2a is: $"

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg
    int 21h

    mov ah, 1
    int 21h
    mov bl, al  ; a
    sub bl, 48  ; ascii to numeric

    mov ah, 1
    int 21h
    sub al, 48  ; b

    add bl, bl  ; 2a
    sub al, bl  ; a = b - 2a

    add al, 48  ; numeric to ascii
    mov bh, al  ; preserved

    mov ah, 9
    lea dx, m2
    int 21h

    mov ah, 2
    mov dl, bh
    int 21h

    mov ah, 4ch
    int 21h
    main endp
end main
