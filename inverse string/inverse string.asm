.model small
.stack 100h
.data
linefeed db 13, 10, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, 0      ; Initialize BX to 0 to count characters
    mov cx, 0      ; Initialize CX to 0 for later use

    scan:
        mov ah, 01h
        int 21h     ; Read a character

        cmp al, 13  ; Check if the user pressed ENTER key (carriage return)
        je exit     ; If ENTER key is pressed, jump to exit

        push ax     ; Push the character onto the stack
        inc bx      ; Increment BX to count the characters
        jmp scan    ; Repeat the scan loop

    exit:
        MOV DX, OFFSET linefeed  ; Print line feed
        MOV AH, 09h
        INT 21h

        mov cx, bx  ; Move the character count into CX

    print_reverse:
        pop dx      ; Pop the last character from the stack into DX
        mov ah, 02h
        int 21h     ; Print the character
        loop print_reverse  ; Loop until all characters are printed

    mov ah, 4Ch     ; Terminate program
    int 21h
main endp
end main
