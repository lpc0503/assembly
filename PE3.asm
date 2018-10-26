.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 0, 2, 5, 9, 10
	result dword 0


.code
main PROC

	mov ecx, LENGTHOF array
	mov esi, OFFSET array

	L1:

		mov eax, [esi]
		mov ebx, [esi+type array]
		sub ebx, eax
		add result, ebx
		add esi, type array
	loop L1

	call writedec
	call crlf

    INVOKE ExitProcess,0ee

main ENDP
END main