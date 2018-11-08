.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 1, 1
	lastVal dword 2971215073
	count	dword 47-2

.code
main PROC

    mov eax, 0
    mov esi, OFFSET array
    add esi, type array
    add esi, type array
    mov ecx, count

    L1:

    	call Fibonacci
    	call writeInt
    	call crlf
    	add esi, type array
    loop L1
    exit

main ENDP

Fibonacci PROC

	mov eax, [esi-4]
	mov ebx, [esi-8]
	add eax, ebx
	mov [esi], eax
	ret
Fibonacci ENDP

END main