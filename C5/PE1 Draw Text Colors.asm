.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	COUNT = 4
	Text dword 4
	DefaultColor = lightgray + (black * 16)
	;array dword 12345678h, 1A2B3C4Dh, 132h, 22222222h
	prompt byte "Enter a 32-bit signed integer : ", 0

.code
main PROC

    mov eax, Text
    call SetTextColor
    call Randomize

    call crlf
    mov ecx, COUNT

    L1:

    	mov eax, 16
    	call RandomRange
    	mov Text, eax
    	call SetTextColor
    	mov edx, OFFSET prompt
    	call writeString
    	call readInt
    	call crlf

    	call WriteInt
    	call crlf
    loop L1

    mov eax, DefaultColor
    call SetTextColor

    exit

main ENDP
END main