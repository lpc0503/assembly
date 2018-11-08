.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data



.code
main PROC
	
	call Randomize
	mov eax, 0
    mov ebx, -300
    mov eax, 100
    call BetterRandomRange
    call writeint
    call crlf

    exit

main ENDP

BetterRandomRange PROC

	sub eax, ebx
	call RandomRange
	add eax, -300
	ret
BetterRandomRange ENDP


END main