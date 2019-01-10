.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	target byte 1000 DUP (0)
	head dword ?
	rem  dword ?

Str_remove proto,
	pString: ptr byte,	
	len: dword

.code
main PROC

	mov eax, 0

	mov ecx, 1000
	mov edx, OFFSET target
	call readString

	call readInt
	mov head, eax

	call readInt
	mov rem, eax

	mov eax, head
    Invoke Str_remove, addr [target+eax], rem

    mov edx, OFFSET target
    call writeString
    call crlf
    exit

main ENDP

Str_remove proc,
	pString: ptr byte,
	len: dword

	Invoke str_length, pString
	mov ecx, eax

	.if ecx >= len
		sub ecx, len
	.endif

	mov esi, pString
	add esi, len
	mov edi, pString

	cld
	rep movsb
	mov byte ptr [edi], 0

	ret	
Str_remove ENDP
END main