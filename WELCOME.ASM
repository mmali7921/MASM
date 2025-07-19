.model small
.data
        message db "Welcome $"
        message2 db "to $"
        message3 db "MEA$"

.code
        mov ax,@data
        mov ds,ax

        lea dx,message
        mov ah,09h
        int 21h



        lea dx,message2
        mov ah,09h
        int 21h


        lea dx,message3
        mov ah,09h
        int 21h

        mov ah,4ch
        int 21h
end
