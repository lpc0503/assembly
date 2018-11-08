.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	start dword 1
	chars byte 'H', 'A', 'C', 'E', 'B', 'D', 'F', 'G'
	links dword 0,   4,   5,   6,   2,   3,   7,   0
	typeLinks byte type links
	newArray byte LENGTHOF chars dup(?)

.code
main PROC
	
	mov eax, 0
    mov ecx, LENGTHOF newArray
    ;call dumpregs
    mov edi, OFFSET newArray
    ;call dumpregs

    L1:
    	;Get char array element accoridng to start
    	mov esi, OFFSET chars
    	;call dumpregs
		add esi, start
		;call dumpregs
		mov al, [esi]
		;call dumpregs
		;Move element to new array
		mov [edi], al
		;call dumpregs
		call writechar
		call crlf
		;Move start to element in the links array
		mov edx, OFFSET links
		mov eax, start
		;call dumpregs
		mul typeLinks
		;call dumpregs
		mov start, eax
		;call dumpregs
		add edx, start
		;Replace start 
		mov eax, [edx]
		mov start, eax
		;call dumpregs

		inc edi
	Loop L1 

    exit

main ENDP
END main