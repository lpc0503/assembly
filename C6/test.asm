.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data



.code
main PROC
	
	mov eax, 0
    mov eax, 4
    mov ebx, 3
    cmp eax, ebx
    call dumpregs
    jg L1

    call writedec
    call crlf

    L1:
    	call writeInt
    	call crlf

    exit

main ENDP
END main