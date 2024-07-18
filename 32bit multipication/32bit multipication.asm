data segment
first  DD 12345678H
second DD 12345678H
result DD ?
data ends
 
code segment
assume cs:code, ds:data
start:
mov ax, data
mov ds, ax
mov ax, word ptr first
mul word ptr second
mov word ptr result, ax
mov cx, dx
mov ax, word ptr first+2
mul word ptr second
add cx, ax
mov bx, dx
jnc move
add bx,0001H
 
move: mov ax,word ptr first
mul word ptr second+2
add cx, ax
mov word ptr result+2, cx
mov cx,dx
 
jnc ma
add bx, 0001H
ma: mov ax, word ptr first+2
mul word ptr second+2
add cx, ax
 
jnc mb
add dx, 0001H
mb: add cx, bx
mov word ptr result+4, cx
 
jnc mc
add dx, 0001H
mc: mov word ptr result+6, dx

code ends
end start