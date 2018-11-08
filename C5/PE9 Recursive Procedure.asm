.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	count dword ?

.code
main PROC

    mov eax,0
    mov count, 0
    mov ecx, 10
    call Recursive
    mov eax, count
    call writeInt
    call crlf

    exit

main ENDP

Recursive PROC
	
	inc count
	cmp count, ecx
	jz quit
	call Recursive

	quit:
		ret
Recursive ENDP

END main