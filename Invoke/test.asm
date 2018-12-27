.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	intput BYTE "Enter an alphabet: ",0,0ah,0dh
	output1 BYTE " is a vowel." ,0,0ah,0dh
	output2 BYTE " is a consonant." ,0,0ah,0dh
	check BYTE "aeiouAEIOU" ,0,0ah,0dh
	char BYTE ?

alphabet proto,
	use: PTR byte,
	target: byte

.code
main PROC

    mov eax, 0

    mov edx, OFFSET intput
    call writeString
    call crlf

    call readChar
    mov char, al
    call writeChar

    Invoke alphabet, addr check, char

    .if(eax == 1)
    	mov edx, OFFSET output1
    .else
    	mov edx, OFFSET output2
    .endif

    call writeString
    call crlf

    exit

main ENDP

alphabet PROC,
	use: PTR byte,
	target: byte

	mov bl, target
	mov esi, use
	mov ecx, 10

	L1:

		cmp [esi], bl
		je  same
		jmp addd

		same:
			mov eax, 1
			ret
		addd:
			add esi, 1

		dec ecx
		jne L1
	ret
alphabet ENDP

END main