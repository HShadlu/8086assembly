

;macro for printing a string
print macro input
   
 lea DX,input
  
 
 MOV AH,09H
 INT 21H 
;macro for getting a string	   
endm
GETSTR MACRO STR
MOV AH,0AH
LEA DX,STR
INT 21H
ENDM

.model small


;******  Data Segment *************
.data

        
arp dw 0
array db 'hanieh$','amirali$','hossein$','nazanin$','alireza$','mohammad$','fatemeh$','alexander&','mostafa$','shaghayegh$'   


MSG1 DB 10,13,'ENTER key to search :$'
MSG3 DB 10,13,' is found :)$'
MSG4 DB 10,13,'is NOT found :($' 
key DB 80,80 DUP('$')
word db '$'
;********** Code Segment ************



.code
assume cs:code,ds:data
start: mov ax,@data
mov ds,ax
mov es,ax
        PRINT MSG1
        GETSTR key
	   
	    
 	   
	   mov bl,0        
	  
	   
	 makeword:
	   cmp bl,7
	   jz noteq 
	   inc bl
	   mov si,offset array
	   add si,arp    
	   mov di,offset word
	   l1: 
	      mov al,[si]
	      mov [di],al 
	      inc arp
	      cmp [si],"$"
	      jz compare
	      inc si
	      inc di
	      
	      jmp l1
	      
	   
compare: 

    
    MOV SI, OFFSET word

    MOV DI, OFFSET key+2

    CLD

    MOV CX,6H

    REPE CMPSB
    jne makeword 
    
    jmp equal
   
   	  

noteq:
	   
print  MSG4
exit:
mov ah,4ch       ;exit the program
int 21h

equal:
    
    print MSG3
    
    jmp exit









end start
end