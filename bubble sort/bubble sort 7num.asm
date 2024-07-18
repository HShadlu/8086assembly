
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



.data

str db 10,13,"Enter Values: $"
str1 db 0dh,0ah,"Sorted: $"
array db 7dup(0)

.code

mov ah,9
lea dx,str
int 21h

mov cx,7
mov bx,offset array
mov ah,1

inputs:
int 21h
mov [bx],al
inc bx
Loop inputs

mov cx,7
dec cx

nextscan:
mov bx,cx
mov si,0

nextcomp:
mov al,array[si]
mov dl,array[si+1]
cmp al,dl

jc noswap

mov array[si],dl
mov array[si+1],al

noswap:
inc si
dec bx
jnz nextcomp

loop nextscan

 

mov ah,9
lea dx,str1
int 21h

mov cx,7
mov bx,offset array

;  display elements
print:
mov ah,2
mov dl,[bx+6]
int 21h
dec bx
loop print

ret






