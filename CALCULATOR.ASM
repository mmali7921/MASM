.model small
printmsg macro msg
    push ax
    push bx
    push cx
    push dx

    lea dx, msg
    mov ah, 09h
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
endm

.data
    msg1 db 0ah,0dh,"Enter the first number:$"
    msg2 db 0ah,0dh,"Enter the second number:$"
    msg3 db 0ah,0dh,"1-add, 2-sub, 3-mul, 4-div $"
    msg4 db 0ah,0dh,"Enter your opinion$"
    msg5 db 0ah,0dh,"Your result is:$"
    msg6 db 0ah,0dh,"NO SUCH OPINION$"
    num dw 0
    cnt dw 0
    choice dw 0
    a dw 0
    b dw 0

.code
    mov ax, @data
    mov ds, ax

    printmsg msg1
    call readnum
    mov ax, num
    mov a, ax

    printmsg msg2
    call readnum
    mov bx, num
    mov b, bx

    printmsg msg3
    call readnum
    mov ax, num
    mov choice, ax

    cmp choice, 1
    je addi
    cmp choice, 2
    je subt
    cmp choice, 3
    je multi
    cmp choice, 4
    je divi

    printmsg msg6
    call printnum
    jmp ex

addi:
    printmsg msg5
    mov ax, a
    add ax, b
    mov num, ax
    call printnum
    jmp ex

subt:
    printmsg msg5
    mov ax, a
    mov bx, b
    sub ax, bx
    mov num, ax
    call printnum
    jmp ex

multi:
    printmsg msg5
    mov ax, a
    mov bx, b
    mul bx
    mov num, ax
    call printnum
    jmp ex

divi:
    printmsg msg5
    mov ax, a
    mov bx, b
    xor dx, dx
    div bx
    mov num, ax
    call printnum
    jmp ex

ex:
    mov ah, 4Ch
    int 21h


readnum proc near
    push ax
    push bx
    push cx
    push dx
    mov num, 0

r1:
    mov ah, 01h
    int 21h
    cmp al, 0dh
    je r2
    mov cx, ax
    and cx, 00ffh
    sub cx, 30h
    mov bx, 10
    mov ax, num
    mul bx
    add ax, cx
    mov num, ax
    jmp r1

r2:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
readnum endp


printnum proc near
    push ax
    push bx
    push cx
    push dx
    mov ax, num
    mov bx, 10

p1:
    mov dx, 0
    cmp ax, 0
    jz p2
    div bx
    push dx
    inc cnt
    jmp p1

p2:
    cmp cnt, 0
    je p3
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    dec cnt
    jmp p2

p3:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
printnum endp

end