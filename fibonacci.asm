.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	tmp DWORD 0
	tmp2 DWORD 0


.code
main PROC
	
	call ReadINT
	mov ecx, eax
	mov eax, 0
	mov tmp, 1
	mov tmp2, 0

	LP:

		mov eax, 0
		add eax, tmp
		add eax, tmp2
		mov ebx, tmp
		mov tmp2, ebx
		mov tmp, eax

		call WriteInt
		call dumpregs

	Loop LP

    exit

main ENDP
END main