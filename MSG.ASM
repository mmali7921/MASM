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
	msg1 db "........................$"
	msg2 db 0ah,0dh,"Hiran V Nath$"
	msg3 db 0ah,0dh,"Assistant Professor$"

.code
	
	mov ax,@data
	mov ds,ax

	printmsg msg1
	printmsg msg2
	printmsg msg3

	mov ah, 4ch
	int 21h

end
