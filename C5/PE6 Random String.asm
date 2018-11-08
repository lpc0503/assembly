.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

strLen = 10

.data

	arr byte strLen dup(?)

.code
main PROC
	
	call Randomize
    mov eax, 0
    mov esi, OFFSET arr
    mov ecx, 20

    L1:
    	call RS
    loop L1

    exit

main ENDP

RS PROC USES ecx

	mov ecx, LENGTHOF arr

	L2:
		mov eax, 26
		call RandomRange
		add eax, 65
		mov [esi], eax
		call writeChar
	loop L2
	call crlf
	ret
RS ENDP

END main