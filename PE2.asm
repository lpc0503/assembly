.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	array dword 1, 2, 3, 4, 5, 6, 7, 8

.code
main PROC

 	call crlf
    mov eax, 0
    mov esi, OFFSET array
    mov ecx, LENGTHOF array/2

    L1:

    	mov eax, [esi]
    	xchg eax, [esi + type array]
    	mov [esi], eax

    	add esi, type array
    	add esi, type array

    loop L1
    
    mov ecx, LENGTHOF array
    mov esi, OFFSET array

    L2:

    	mov eax, [esi]

    	call writeint
    	call crlf

    	add esi, type array

    loop L2
   
   
    exit

main ENDP
END main