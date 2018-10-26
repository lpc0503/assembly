.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	
	str1 BYTE "The original array as it is given",0dh,0ah,0
	str2 BYTE "After exchanging the result is as follows",0dh,0ah,0
	dwarray dword 21, 32, 45, 64, 76, 87, 56, 23, 34, 77
	count  EQU (LENGTHOF dwarray)
	rearray dword count DUP(0)

.code
main PROC

	mov edx, OFFSET str1
    call writestring
    mov ecx, count
    mov esi, OFFSET dwarray

    L1:

    	mov eax, [esi]
    	call writedec
    	call crlf
    	add esi, type dwarray
    loop L1
	
	mov eax, 0
    mov ecx, count/2
    mov esi, OFFSET dwarray

    call crlf

    L2:
    	
    	mov eax, [esi]
    	xchg eax, [esi + type dwarray]
    	mov [esi], eax

    	add esi, 8

    loop L2

    mov edx, OFFSET str2
    call writestring
    mov ecx, count
    mov esi, OFFSET dwarray

    L3:

    	mov eax, [esi]
    	call writedec
    	call crlf
    	add esi, type dwarray
    loop L3

    ;call dumpregs

    exit

main ENDP
END main