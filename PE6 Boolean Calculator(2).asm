.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
msgMenu BYTE "---- Boolean Calculator ----",0dh,0ah
		BYTE 0dh,0ah
		BYTE "1. x AND y"     ,0dh,0ah
		BYTE "2. x OR y"      ,0dh,0ah
		BYTE "3. NOT x"       ,0dh,0ah
		BYTE "4. x XOR y"     ,0dh,0ah
		BYTE "5. Exit program",0

msgAND BYTE "Boolean AND",0
msgOR  BYTE "Boolean OR",0
msgNOT BYTE "Boolean NOT",0
msgXOR BYTE "Boolean XOR",0

msgInteger1 BYTE "Enter the first 32-bit hexadecimal integer: ",0
msgInteger2 BYTE "Enter the second 32-bit hexadecimal integer: ",0
msgResult   BYTE "The 32-bit hexadecimal result is: ",0



.code
main PROC

Menu:
	mov edx, OFFSET msgMenu		; menu choices
	call WriteString			; display menu
	call Crlf				; go to next output line

L1:	
	call ReadChar			; wait for input and return char
	cmp al, '5'				; is selection valid (1-5)?
	ja L1					; jump if above 5, go back
	cmp al, '1'
	jb L1					; jump if below 1, go back


	cmp al,'5'
	je quit
	call Crlf				
	call ChooseProcedure		


	call Crlf
	jmp Menu				; display menu again

quit: exit
main ENDP

ChooseProcedure PROC
	

	cmp al,'4'
	je XOR_op
	cmp al,'3'
	je NOT_op
	cmp al,'2'
	je OR_op
	cmp al,'1'
	je AND_op

ChooseProcedure ENDP


;---------------------------------------------------------

AND_op PROC

	pushad 

	mov edx, OFFSET msgAND		
	call WriteString		
	call Crlf
	call Crlf

	mov edx,OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx,eax

	mov edx,OFFSET msgInteger2
	call WriteString
	call ReadHex
	
	and eax,ebx

	mov edx,OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret


AND_op ENDP

OR_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgOR		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first integer
	call WriteString
	call ReadHex			; get hexadecimal integer
	mov ebx, eax			; move first integer to EBX

	mov edx, OFFSET msgInteger2	; ask for second integer
	call WriteString
	call ReadHex			; get hex integer

	or eax, ebx				; integer1 OR integer2

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; display hex to window
	call Crlf

	popad					; save and restore registers
	ret					; return from procedure
OR_op ENDP

NOT_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgNOT		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for integer
	call WriteString
	call ReadHex			; get hex integer

	not eax				; NOT operand

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; EAX = result
	call Crlf

	popad					; restore registers
	ret					; return from procedure

NOT_op ENDP

XOR_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgXOR		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first operand
	call WriteString
	call ReadHex			; get hexadecimal integer
	mov ebx, eax			; move first operand to EBX

	mov edx, OFFSET msgInteger2	; ask for second operand
	call WriteString
	call ReadHex			; get hex integer

	xor eax, ebx			; integer1 XOR integer2

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; display hex to window
	call Crlf

	popad					; save and restore registers
	ret					; return from procedure

XOR_op ENDP

;---------------------------------------------------------

END main