.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	source BYTE "This is the source string",0
    target BYTE SIZEOF source DUP('#')

.code
main PROC

	mov edx, OFFSET source
    call writestring
    call crlf

    mov eax, 0
    mov esi, 0
    mov edi, LENGTHOf source - 1
    mov ecx, SIZEOF source - 1
    ;call dumpregs

    L1:

    	mov eax, 0
    	mov al, source[esi]
    	mov target[edi], al
    	inc esi
    	dec edi
    loop L1

    mov edx, OFFSET target
    call writestring
    call crlf

    exit

main ENDP
END main