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
	msg1 db 0dh,0ah,"enter a number: $"
	msg2 db 0dh,0ah,"numberis: $"
        num dw 0
	cnt dw 0
.code
	mov ax,@data
	mov ds,ax
	printmsg msg1
	call readnum
	printmsg msg2
	call printnum
	mov ah,4ch
	int 21h
   readnum proc near
	push ax
	push bx
	push cx 
	push dx
	mov num,00
	mov dx,00
   rd1:mov ah,01h
	int 21h
	cmp al,0dh
	je rd2
	sub al,30h
	mov cx,ax
	and cx,00ffh
        mov ax,num
	mov bx,10
	mul bx
	add ax,cx
        mov num,ax
	jmp rd1
    rd2:pop dx
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
    p1:mov dx,00
	cmp ax,00
	jz p2
	div bx
	push dx
	inc cnt
	jmp p1
    p2:cmp cnt,00
	je p3
	pop dx
	add dl,30h
	mov ah,02h
	int 21h
	dec cnt
	jmp p2
     p3:pop dx
        pop cx
        pop bx
        pop ax
        ret
printnum endp
end
