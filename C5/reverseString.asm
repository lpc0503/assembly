.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	aName byte "kiyohime my wife", 0dh, 0ah, 0
	nameSize = ($ - aName) - 1

.code
main PROC

	;push the name on stack
	mov ecx, nameSize
	mov esi, 0
	L1:

		movzx eax, aName[esi];get charactor
		call  writechar
		call  dumpregs
		push  eax			 ;push on stack
		inc   esi

	loop L1

	;pop the name from the stack, in reverse
	;store int the aName array
	mov ecx, nameSize
	mov esi, 0

	L2:

		pop eax
		call writechar
		call dumpregs
		mov aName[esi], al
		inc esi

	loop L2

	mov edx, OFFSET aName
	call writeString
	call crlf

    exit

main ENDP
END main