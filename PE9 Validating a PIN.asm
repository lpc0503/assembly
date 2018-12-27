.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

PIN_LENGTH = 5

.data
	
	inputMSG byte "Enter the PIN: ", 0
	ValidStr byte "PIN is valid", 0dh, 0ah, 0
	notValid byte "PIN is not Valid", 0dh, 0ah, 0
	NumOnlyS  byte "PIN is not Valid", 0dh, 0ah, 0

	endMSG   byte "Press any key to continue or 1 to exit...", 0dh, 0ah, 0
	pin byte 5 dup(?)

	floor byte '5', '2', '4', '1', '3'
	ceil byte '9', '5', '8', '4', '6'

.code
main PROC
	
	mov eax, 0

	do:
		mov esi, 0
		mov ecx, PIN_LENGTH
		call getPin
		call crlf

		mov esi, 0
		mov ecx, PIN_LENGTH
		call ValidPin
		call crlf

		mov edx, OFFSET endMSG
		call writeString
		call crlf

		call readChar
		cmp al, '1'
		je left
		jmp do

	left:
		exit

main ENDP

getPin PROC	USES edx ebx ecx
		
	again:
		mov esi, 0
		mov ecx, PIN_LENGTH
		mov edx, OFFSET inputMSG
		call writeString

		L1:
			call readChar
			call writechar
			cmp al, '0'
			jl NumOnly
			cmp al, '9'
			jg NumOnly
			mov pin[esi], al
			add esi, 1
		loop L1

		ret

	NumOnly:
		mov edx, OFFSET NumOnlyS
		call writeString
		jmp again

getPin ENDP

ValidPin PROC USES edx ebx ecx
	
	L2:
		mov al, pin[esi]
		cmp al, floor[esi]
		jl illegal
		cmp al, ceil[esi]
		jg illegal
		add esi, 1
	loop L2

	mov edx, OFFSET ValidStr
	call writeString
	jmp final

	illegal:
		mov edx, OFFSET notValid
		call writeString

	final:
		ret

ValidPin ENDP

END main