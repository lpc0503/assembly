.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	string1 byte "abcde///", 0

.code
main PROC

	mov eax, 0
	mov ecx, 0
	call dumpregs

	invoke Str_trim, ADDR string1, '/'
	mov edx, OFFSET string1
	call writeString
	call crlf

    exit

main ENDP
END main