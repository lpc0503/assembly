.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	msgMENUE byte "---- Boolean Calculator ----", 0dh, 0ah
			 byte 0dh, 0ah
			 byte "1. X AND Y", 0dh, 0ah
			 byte "2. X OR Y", 0dh, 0ah
			 byte "3. NOT X", 0dh, 0ah
			 byte "4. X XOR Y", 0dh, 0ah
			 byte "5. Exit program", 0dh, 0ah

	msgAND byte "Boolean AND", 0
	msgOR  byte "Boolean OR", 0
	msgNOT byte "Boolean NOT", 0
	msgXOR byte "Boolean XOR", 0

	msgInteger1 byte "Enter first 32-bit integer: ", 0
	msgInteger2 byte "Enter first 32-bit integer: ", 0
	msgResult   byte "The 32-bit result is: ", 0


.code
main PROC

    mov eax, 0

    Menu:
    	mov edx, OFFSET msgMENUE
    	call writeString
    	call crlf

    L1:
    	call readChar
    	cmp al, '5'
    	ja L1
    	cmp al, '1'
    	jb L1

    	cmp al, '5'
    	je quit
    	call crlf
    	call ChooseProcedure

    	call crlf
    	jmp Menu

    quit:
    	exit

main ENDP

ChooseProcedure PROC
	
	cmp al, '4'
	je XOR_op
	cmp al, '3'
	je NOT_op
	cmp al, '2'
	je OR_op
	cmp al, '1'
	je AND_op

ChooseProcedure ENDP

AND_op PROC
		
	pushad

	mov edx, OFFSET msgAND
	call writeString
	call crlf
	call crlf

	mov edx, OFFSET	msgInteger1
	call writeString
	;call crlf
	call ReadDec
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call writeString
	;call crlf
	call ReadDec

	and eax, ebx

	mov edx, OFFSET msgResult
	call writeString
	call writeDec
	call crlf

	popad
	ret

AND_op ENDP

OR_op PROC
		
	pushad

	mov edx, OFFSET msgOR
	call writeString
	call crlf
	call crlf

	mov edx, OFFSET	msgInteger1
	call writeString
	;call crlf
	call ReadDec
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call writeString
	;call crlf
	call ReadDec

	or eax, ebx

	mov edx, OFFSET msgResult
	call writeString
	call writeDec
	call crlf

	popad
	ret

OR_op ENDP

NOT_op PROC
		
	pushad

	mov edx, OFFSET msgNOT
	call writeString
	call crlf
	call crlf

	mov edx, OFFSET	msgInteger1
	call writeString
	;call crlf
	call ReadDec

	not eax

	mov edx, OFFSET msgResult
	call writeString
	call writeDec
	call crlf

	popad
	ret

NOT_op ENDP

XOR_op PROC
		
	pushad

	mov edx, OFFSET msgXOR
	call writeString
	call crlf
	call crlf

	mov edx, OFFSET	msgInteger1
	call writeString
	;call crlf
	call ReadDec
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call writeString
	;call crlf
	call ReadDec

	xor eax, ebx

	mov edx, OFFSET msgResult
	call writeString
	call writeDec
	call crlf

	popad
	ret

XOR_op ENDP

END main