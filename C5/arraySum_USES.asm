.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 10000h, 20000h, 30000h, 40000h, 50000h
	theSum dword ?

.code
main PROC

    mov esi, OFFSET array
    mov ecx, LENGTHOF array
    call arraySum
    call dumpregs
    call writehex
    call crlf

    exit
main ENDP

arraySum PROC USES esi ecx
	
	call dumpregs
	;push esi
	;push ecx
	mov eax, 0
	;call dumpregs

	L1:

		add eax, [esi]
		add esi, type dword
	loop L1

	;call dumpregs
	;pop ecx
	;call dumpregs
	;pop esi
	ret
arraySum ENDP

END main