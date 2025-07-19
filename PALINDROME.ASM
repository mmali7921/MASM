.model small
.stack 100h
printmsg macro msg
    push ax
    push dx
    LEA dx,msg
    mov ah,09h
    int 21h
    pop dx
    pop ax
endm

.data
msg1 db 0ah,0dh,"Enter the string$"
msg2 db 0ah,0dh,"it is a palindrome$"
msg3 db 0ah,0dh,"it is not a palindrome$"
msg4 db 0ah,0dh,"$"
msg5 db 0ah,0dh,"Length is $"
buffer db 10
       db ?
       db 12 dup("$")
len db 00

.code
main:
    mov ax,@data
    mov ds,ax

    printmsg msg1
    lea dx,buffer
    mov ah,0Ah
    int 21h

    mov al,buffer[1]
    mov len,al

    printmsg msg5
    mov dl,len
    add dl,30h
    mov ah,02h
    int 21h

    lea bx, buffer + 2
    mov si, 0
    mov al, len
    mov ah, 0
    dec ax
    mov di, ax
    mov cl, 0

a1: cmp cl, len
    je a4
    mov dl, [bx + si]
    mov dh, [bx + di]
    cmp dl, dh
    jnz a2
    inc si
    dec di
    inc cl
    jmp a1

a4: printmsg msg2
    jmp a3

a2: printmsg msg3

a3: mov ah,4ch
    int 21h
end main

