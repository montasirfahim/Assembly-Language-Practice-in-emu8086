.model small
.data
msg db 'ENTER A HEX DIGIT: $'
m1 db 0ah,0dh,'IN DECIMAL IT IS: 1'
ans db ?,'$'
m2 db 'This is Fahim, ID: IT22016',0ah,0dh,'$'
.code
main proc
    mov ax,@data
    mov ds,ax

    lea dx,m2
    mov ah,9
    int 21h

    lea dx,msg
    int 21h

    mov ah,1
    int 21h

    sub al,11h
    mov ans,al

    lea dx,m1
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h

main endp
end main





