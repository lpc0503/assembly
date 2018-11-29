.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	s dword 50
	e dword 100

	str1 byte "The integer score is: ", 0
	str2 byte "The letter grade is: ", 0

.code
main PROC

    mov eax, 0
    call randomize
    mov ecx, 10

    L1:

    	mov eax, e
    	mov ebx, s
    	sub eax, ebx
    	dec eax
    	call Randomrange
    	add eax, ebx
    	mov edx, OFFSET str1
    	call writeString
    	call writeint
    	call crlf
    	call CalcGrade
    	call crlf
    loop L1


    exit

main ENDP

CalcGrade PROC USES eax edx

	.IF eax >= 90
		mov al, 'A'
	.ELSEIF eax >= 80
		mov al, 'B'
	.ELSEIF eax >= 70
		mov al, 'C'
	.ELSEIF eax >= 60
		mov al, 'D'
	.ELSE
		mov al, 'F'
	.ENDIF

	mov edx, OFFSET str2
	call writeString
	call writeChar
	call crlf

	ret

CalcGrade ENDP



END main