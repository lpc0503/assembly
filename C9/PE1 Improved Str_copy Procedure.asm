.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	String byte 1000 DUP (0)
	Str_cop byte ?

Str_CopyN proto,
	source: ptr byte,
	target: ptr byte,
	len: dword

.code
main PROC

    mov eax, 0
    mov ecx, 1000
    mov edx, OFFSET String
    call readString
    
    Invoke Str_CopyN, addr String, addr Str_cop, 7

    mov edx, OFFSET Str_cop
    call writeString
    call crlf

    exit

main ENDP

Str_CopyN proc,
	source: ptr byte,
	target: ptr byte,
	len: dword

	mov ecx, len
	mov esi, source
	mov edi, target
	cld
	rep movsb

	mov byte ptr [edi], 0
	ret
Str_CopyN ENDP
END main