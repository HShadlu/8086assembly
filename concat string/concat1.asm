

;macro for printing a string
print macro input
   
  LEA DX,input 
  
 ;output the string
 ;loaded in dx 
 MOV AH,09H
 INT 21H 
	   
endm

.model small


;******  Data Segment ******
.data

empty db 10,1," " 
str1 db 10,15, "MICROPROCESSORS"
str2 db 10,7, "PROJECT"

result DB 30 DUP("$")
mconcat db 10,13, "Concatenated string: $"

;********** Code Segment ************

.code

start:
mov ax,@data
mov ds,ax

	   
	   
 	   
	   mov cl,str1+1         ;length of string1 in cl
	   mov si,offset str1+2
	   mov di,offset result 
	   
	   
next:  
       mov al,[si]
	   mov [di],al
       inc si
       inc di
	   dec cl
	   jnz next  
	   
	   
	  
	   ;;;;;;;;;;;;;;;;; 
	
	    
	   ;;;;;;;;;;;;;;;;;;;
	   
	   mov si,offset empty+2
	   
	  
	   
	   mov al,[si]
	   mov [di],al   
	   
	   mov cl,str2+1         ;length of string2 in cl
	   mov si,offset str2+2
	   
	   inc di
	   
next2:  
       mov al,[si]
	   mov [di],al
       inc si
       inc di
	   dec cl
	   jnz next2  
	   

		   print mconcat
		   print result

		   
exit:
mov ah,4ch       ;exit the program
int 21h











end start
end