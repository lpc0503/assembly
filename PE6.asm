.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	str1 byte "original array", 0dh, 0ah, 0
	str2 byte "reverse array", 0dh, 0ah, 0

	array dword 1, 2, 3, 4, 5, 6, 7, 8
	count EQU (LENGTHOF array)

.code
main PROC

	mov edx, OFFSET str1
	call writestring
	mov esi, OFFSET array
	mov ecx, count

	L1:

		mov eax, [esi]
		call writedec
		call crlf
		add esi, type array
	loop L1


    mov eax, 0
 	mov ecx, count/2
 	mov esi, OFFSET array
 	mov edi, OFFSET array
 	add edi, sizeof array
 	sub edi, type array

 	L2:

 		mov eax, [esi]
 		mov ebx, [edi]

 		mov [esi], ebx
 		mov [edi], eax

 		add esi, type array
 		sub edi, type array
 	loop L2

 	mov edx, OFFSET str2
	call writestring
	mov esi, OFFSET array
	mov ecx, count

	L3:

		mov eax, [esi]
		call writedec
		call crlf
		add esi, type array
	loop L3

	exit

main ENDP
END main