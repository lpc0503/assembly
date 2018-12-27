.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	
	msg1 byte "enter low bound: ", 0
	msg2 byte "enter high bound: ", 0
	msg3 byte "the random number is: ", 0
	val1 dword ?
	val2 dword ?
	TextColor = lightgray + (black * 16)

.code
main PROC
	
	mov eax, 0
	mov ecx, 3
    call Randomize

	L1: 
	   	call STCOLOR

	    mov edx, OFFSET msg1
	    call writeString
	    call ReadInt
	    call crlf
	    mov val1, eax

	    mov edx, OFFSET msg2
	    call writeString
	    call ReadInt 
	    call crlf
	    mov val2, eax

	    mov eax, val2
	    mov ebx, val1

	    call RD

	    mov eax, val1
	    mov edx, OFFSET msg3
	    call writeString
	    call writeInt
	    call crlf
	    call crlf
	loop L1

	mov eax, TextColor
	call SetTextColor

    exit

main ENDP

RD PROC USES eax ebx
	
	sub eax, ebx
	call RandomRange
	add eax, val1
	mov val1, eax
	ret
RD ENDP

STCOLOR PROC USES eax

	mov eax, 15
	call RandomRange
	inc eax
	call SetTextColor
	ret

STCOLOR ENDP

END main