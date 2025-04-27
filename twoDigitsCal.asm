.model small
.data
m1 db 0dh, 0ah, "Result is: "
res db ?, "$" 
b db ?
c db ? 
m2 db 0dh, 0ah, "Result is: 1"
d db ?, "$"

.code


main proc
    mov ax, @data
    mov ds, ax
    
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    mov ah, 1
    int 21h 
    mov cl, al   
    sub cl, 48
    
    mov al, bl
    add al, bl
    add al, bl ;3b 
    
    add cl, cl
    
    
    add al, cl  ;b = 3b + 2c 
   
    
       
    cmp al, 9
    jg LARGER  
    
              
    mov res, al 
    add res, 48 ;again into ascii to print readable character
    mov ah, 9
    lea dx, m1
    int 21h    
    JMP EXIT
  
  LARGER: 
     mov ah, 0  
     mov dl, 10
     div dl
     
     add ah, 48 ;remainder
     mov d, ah
     mov ah, 9
     lea dx, m2
     int 21h   
 
  EXIT:   
    
    mov ah, 4ch
    int 21h
    
    main endp
    end main




