.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	target byte 1000 DUP (0)


Str_nextWord proto,
	pString: ptr byte,
	delimiter: byte

.code
main PROC

	mov ecx, 1000
	mov edx, OFFSET target
	call readString

	mov eax, 0
    mov esi, OFFSET target
    mov ebx, 0

    L1:
    	invoke Str_nextWord, esi, ','
    	cmp bl, 1
    	je bb
    	mov esi, eax
    	mov edx, eax
    	call writeString
    	call crlf

    	jmp L1

    bb:

    exit

main ENDP

Str_nextWord proc,
	pString: ptr byte,
	delimiter: byte

	mov al, delimiter
	mov esi, pString
	cld
	L1:
		lodsb
		cmp al, 0
		je L3
		cmp al, delimiter
		je L2
		jmp L1
	L2:
		mov byte ptr [esi-1], 0
		mov eax, esi
		jmp left
	L3:
		mov bl, 1

	left:
		ret

Str_nextWord ENDP

END main