.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	input byte "Enter two numbers(intervals): ", 0dh, 0ah, 0
	output1 byte "Armstrong numbers between " , 0
	output2 byte " and ", 0
	output3 byte " are ", 0
	blank   byte " ", 0

	one dword 0
	two dword 0
	tmp dword 0
	ans dword 0
	len dword 0
	rec dword 0

Armstrong proto,
	number: dword

.code
main PROC

    mov eax, 0

    mov edx, OFFSET input
    call writeString
    call readInt
    mov one, eax
    call readInt
    mov two, eax

    mov edx, OFFSET	output1
    call writeString
    MOV eax, one
    call writeDec
    mov edx, OFFSET output2
    call writeString
    mov eax, two
    call writeDec
    mov edx, OFFSET output3
    call writeString 

    mov ecx, 5
    L5:
    	invoke Armstrong, one
    	add one, 1
    	mov ecx, 5
    	mov eax, one
    	.if(eax>two)
    		mov ecx, 1
    	.endif
    loop L5
    
    call crlf

    exit

main ENDP

Armstrong PROC,
	number: dword

	mov ecx, 1000
	mov eax, number
	mov rec, eax
	mov len, 0
	mov ans, 0

	L1:

		mov edx, 0
		mov ebx, 10
		div ebx
		add len, 1
		.if(eax == 0)
			mov ecx, 1
		.endif
	Loop L1

	mov ecx, 1000
	L2:

		mov edx, 0
		mov eax, number
		mov ebx, 10
		div ebx
		mov number, eax
		mov tmp, edx

		mov ecx, len
		mov eax, 1
		L3:
			mul tmp
		loop L3

		mov ecx, 1

		add eax, ans
		mov ans, eax

		.if(number == 0)
			mov ecx, 1
		.else
			add ecx, 1
		.endif
	loop L2

	mov eax, ans
	.if(rec == eax)
		call writeDec
		mov edx, OFFSET blank
		call writeString
	.endif

	ret
Armstrong ENDP

END main