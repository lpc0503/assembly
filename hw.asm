.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	sum SDword 0
	msg BYTE "sum is :", 0dh, 0ah, 0

.code
main PROC
	
	call ReadInt
	mov ecx, eax
    mov eax, 0 
    mov ebx, 1
    mov edx, OFFSET msg

    lp:

	    add eax, ebx
	    call WriteInt
	    call crlf

    loop lp

    call WriteString
	call WriteInt 
	call crlf   

    exit

main ENDP
END main