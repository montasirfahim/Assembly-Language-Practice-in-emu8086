.model small
.stack 100h
.data
    msg db 'This is Fahim, ID: IT22016', 0ah, 0dh, '$'
 
    m1 db 0AH, 0DH, '***********',0ah,0dh
    m2 db '***********',0ah,0dh
    m3 db '***********',0ah,0dh
    m4 db '***********',0ah,0dh
    m5 db '***********',0ah,0dh
    m6 db '****'         
    c1 db ?
    c2 db ?
    c3 db ?
    m7 db '****', 0ah,0dh
    m8 db '***********',0ah,0dh
    m9 db '***********',0ah,0dh 
    m10 db '***********',0ah,0dh
    m11 db '***********',0ah,0dh
    m12 db '***********',0ah,0dh,'$'
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, msg
    mov ah, 9
    int 21h
 
    mov ah, 1
    int 21h
    mov c1, al
    int 21h
    mov c2, al
    int 21h
    mov c3, al

    mov ah, 9 ;print box
    lea dx, m1
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main
    