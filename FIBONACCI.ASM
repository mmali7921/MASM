.model small
printmsg macro msg
        push ax
        push dx
        lea dx,msg
        mov ah,09h
        int 21h
        pop dx
        pop ax
 endm

.data
        msg1 db "Enter the limit: $"
        msg2 db 0ah,0dh, "The series is: $"
        msg3 db "  $"
        num dw 0
        cnt dw 0
        
.code
        mov ax,@data
        mov ds,ax
        printmsg msg1
        call readnum
        mov cx,num
        cmp cx,00h
        je l2
        printmsg msg2

        mov dl,00h
        add dl,30h
        mov ah,02h
        int 21h
        dec cx

        cmp cx,00h
        je l2
        printmsg msg3
        mov num,01h
        call printnum
        dec cx
       
        mov ax,00h
        mov bx, 01h
l1:     cmp cx,00h
        je l2
        printmsg msg3
        add ax,bx
        mov num,ax
        call printnum
        mov dx,ax
        mov ax,bx
        mov bx,dx
        dec cx
        jmp l1
l2:     mov ah,4ch
        int 21h


                readnum proc near
                        push ax
                        push bx
                        push cx
                        push dx
                        mov num,00
                        r1:
                                mov ah,01h
                                int 21h
                                cmp al,0dh
                                je r2
                                mov cx,ax
                                and cx,00ffh
                                sub cx,30h
                                mov bx,10
                                mov ax,num
                                mul bx
                                add ax,cx
                                mov num,ax
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
                        mov ax,num
                        mov bx,10
                        p1:
                                mov dx,00
                                div bx
                                push dx
                                inc cnt
                                cmp ax,00
                                jne p1
                        p2:
                                cmp cnt,00
                                je p3
                                pop dx
                                add dl,30h
                                mov ah,02h
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
