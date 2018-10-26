.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	Warray word 1, 2, 3, 4, 5
	Darray dword LENGTHOF Warray dup(?)

.code
main PROC

    mov eax, 0
    mov ecx, LENGTHOF Warray
    mov esi, OFFSET Warray
    mov edi, OFFSET Darray

    L1:

    	mov eax, 0
    	mov ax, [esi]
    	mov [edi], eax
    	
    	add esi, type Warray
    	add edi, type Darray
    loop L1

    mov eax, 0
    mov ecx, LENGTHOF Warray
    mov esi, OFFSET Warray
    mov edi, OFFSET Darray

    L2:

    	mov eax, [edi]
    	call writeint
    	call crlf

    	add edi, type Darray

    loop L2

    exit

main ENDP
END main