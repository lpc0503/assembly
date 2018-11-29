.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	true = 1
	false = 0
	gradeAvg word ?
	credits word ?
	ACTORegister byte ?

	str1 byte "Accept to register", 0
	str2 byte "Decline to register", 0
	str3 byte "Enter score: ", 0
	str4 byte "Enter numOf credits: ",0
	errorMSG byte "credirt(1-30) score(0-400)...",0


.code
main PROC

	mov eax, 0

    call get
    call check
    call crlf 

    exit

main ENDP

get PROC USES eax

	mov ebx, 0

	startScore:
		mov edx, OFFSET str3
		call writeString
		call readInt
		cmp eax, 0
		jl error1
		cmp eax, 400
		jg error1
		mov gradeAvg, ax

	startCredits:
		mov edx, OFFSET str4
		call writeString
		call readInt
		cmp eax, 1
		jl error2
		cmp eax, 30
		jg error2
		mov credits, ax
		
		jmp final

	error1:
		mov edx, OFFSET errorMSG
		call writeString
		call crlf
		jmp startScore

	error2:
		mov edx, OFFSET errorMSG
		call writeString
		call crlf
		jmp startCredits

	final:
		ret

get ENDP

check PROC USES edx 

	mov ACTORegister, false

	cmp credits, 12
	jbe ACR

	cmp gradeAvg, 350
	ja ACR

	cmp gradeAvg, 250
	jb NOR
	cmp credits, 16
	jbe ACR

	NOR:
		mov edx, OFFSET str2
		call writeString
		jmp final

	ACR:
		mov edx, OFFSET str1
		call writeString
		mov ACTORegister, true
		jmp final

	final:
		ret


check ENDP


END main