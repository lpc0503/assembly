.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	targetStr byte 1000 DUP (0)
	sourceStr byte 100 DUP (0)
	num dword ?

Str_concat proto,
	target: ptr byte,
	source: ptr byte,
	len: dword

.code
main PROC

    mov eax, 0

    mov ecx , 1000
    mov edx, OFFSET targetStr
    call readString
    mov num, eax

    mov edx, OFFSET sourceStr
    call readString

    Invoke Str_concat, addr targetStr, addr sourceStr, num

    mov edx, OFFSET targetStr
    call writeString
    call crlf

    exit

main ENDP

Str_concat proc,
	target: ptr byte,
	source: ptr byte,
	len: dword

	mov eax, len
	;dec eax
	;call dumpregs

	mov ecx, lengthOF sourceStr
	dec ecx

	mov esi, source
	mov edi, target

	add edi, eax

	L1:
		mov ebx, [esi]
		mov [edi], ebx

		inc esi
		inc edi
	loop L1

	ret

Str_concat ENDP

END main