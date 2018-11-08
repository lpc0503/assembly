.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data



.code
main PROC

    mov eax, 0
    mov ecx, 16

    L1:

    	push ecx
    	push eax
    	mov ecx, 16

    	L2:

    		call SetTextColor
    		push eax
    		mov al, 'A'
    		call WriteChar
    		pop eax
    		inc eax
    	loop L2

    	call crlf
    	pop eax
    	add eax, 16
    	pop ecx

    loop L1

    call crlf
    mov eax, lightgray
    call SetTextColor

    exit

main ENDP
END main