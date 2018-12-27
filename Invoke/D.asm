.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	String byte ?
	input  byte "Enter a String: ",0
	output byte "Output String: ",0

	targetStr byte ?
	len    Dword ?

remove proto,
	use: PTR byte,

.code
main PROC
	
	mov eax, 0

    mov edx, OFFSET input
    call writeString
    call crlf

    mov ecx, 1000
    mov edx, OFFSET String
    call readString
    mov len, eax

    Invoke remove, addr String

    mov edx, OFFSET output
    call writeString
    call crlf

    mov edx, OFFSET targetStr
    call writeString
    call crlf

    exit

main ENDP

remove proc,
	use: PTR byte

	mov eax, 0
	mov ecx, len
	mov esi, use
	mov edi, OFFSET targetStr

	;call dumpRegs
	L1:

		mov bl, 'A'
		cmp [esi], bl
		jL rem
		mov bl, 'Z'
		cmp [esi], bl
		jG check

		jmp addIdx

		check:

			mov bl, 'a'
			cmp [esi], bl
			jL rem
			mov bl, 'z'
			cmp [esi], bl
			jG rem

			jmp addIdx
		rem:
			add esi, 1
			sub ecx, 1
			cmp ecx, 0
			je left
			jmp L1

		addIdx:

			mov al, [esi]
			mov [edi], al

			add esi, 1
			add edi, 1

			sub ecx, 1
			cmp ecx, 0

			je left
			jmp L1
		
	left:
		ret

remove ENDP
END main