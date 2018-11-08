.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	aName byte "kiyohime my wife", 0dh, 0ah, 0
	nameSize = LENGTHOF aName

.code
main PROC

    mov eax,0
    mov ecx, nameSize
    dec ecx
    mov esi, 0

    L1:
    	movzx eax, aName[esi]
    	push eax
    	inc esi
    loop L1

    mov ecx, nameSize
    dec ecx
    mov esi, 0

    L2:
    	pop eax
    	mov aName[esi], al
    	;call dumpregs
    	;call writeChar
    	;call crlf
    	inc esi
    loop L2

    mov edx, OFFSET aName
    call writeString
    call crlf

    exit

main ENDP
END main