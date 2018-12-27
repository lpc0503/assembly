.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.DATA
str1 BYTE "Input a Number to set Size", 0dh, 0ah, 0
str2 BYTE "Random Number Array is", 0dh, 0ah, 0
str3 BYTE "The Max Number is : ", 0
input DWORD ?

.CODE
MAIN PROC

	mov edx, OFFSET str1
	call WriteString
	call ReadInt
	mov input, eax
	call crlf

	mov edx, OFFSET str2
	call WriteString
	mov ecx, input
	mov ebx, 0
	;call Randomize
	NEXT:
		mov ebx, eax
		call DumpRegs
	L1:
		mov eax, 99
		call RandomRange
		add eax, 100
		call WriteDec
		call crlf
		cmp ebx, eax
		call DumpRegs
		jc NEXT
	loop L1

	call crlf

	mov edx, OFFSET str3
	call WriteString
	mov eax, ebx
	call WriteDec
	call crlf

	exit

MAIN ENDP
END MAIN