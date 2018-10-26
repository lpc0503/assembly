.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 1, 2, 3, 4, 5
	sum dword ?

.code
main PROC

    mov esi, offset array
    mov ecx, LENGTHOF array
    call arraysum
    mov sum, eax
    call writedec
    call crlf

	exit
main ENDP

arraysum PROC
	
	call dumpregs
	push esi
	call dumpregs
	push ecx
	call dumpregs
	mov eax, 0
	mov ecx, 3
	call dumpregs

	L1:

		add eax, [esi]
		add esi, TYPE dword
	loop L1
	
	pop ecx
	call dumpregs
	pop esi
	call dumpregs
	ret

arraysum ENDP


END main