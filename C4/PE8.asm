.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 21, 32, 45, 64, 76, 87, 56, 23, 34, 77, 89, 93, 103
	count EQU (LENGTHOF array)
	resultarray DWORD count DUP(0)
	
	MSG0 BYTE  "Result after shifting one value to the right.",0dh,0ah,0

.code
main PROC

    mov eax, 0
    mov esi, OFFSET array
    mov edi, OFFSET resultarray
    mov eax, [esi + 4*(count-1)]
    mov ecx, count-1
    ;mov eax, array[4*(count-1)]
    ;call dumpregs

    L1:

    	mov ebx, [esi]
    	mov [edi], eax
    	mov eax, ebx

    	add esi, type array
    	add edi, type resultarray
    loop L1

    mov [edi], eax

    mov edx, OFFSET MSG0
    call writestring
    mov esi, OFFSET resultarray
    mov ecx, count

    L2:

    	mov eax, [esi]
    	call writedec
    	call crlf
    	add esi, type resultarray
    loop L2


    exit

main ENDP
END main