.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	targetStr byte 1000 DUP (0)
	semi byte " : ", 0
	ascii byte 128 DUP (0)

cal proto,
	target: ptr byte 

.code
main PROC

  	mov eax, 0

  	mov ecx, 1000
  	mov edx, OFFSET targetStr
  	call readString

  	invoke cal, addr targetStr

  	mov ecx, 128
  	mov ebx, 0

  	mov esi, 0

  	L1:
  		.if(ascii[esi] > 0)
  			mov al, bl
  			call writeChar
  			mov edx, OFFSET semi
  			call writeString
  			mov al, ascii[esi]
  			call writeDec
  			call crlf
  		.endif

  		inc esi
  		inc ebx
  	loop L1

    exit

main ENDP

cal proc,
	target: ptr byte

	invoke str_length, target
	mov ecx, eax
	mov esi, 0

	L2:
		mov ebx, 0
		mov edi, 0
		mov bl, targetStr[esi]
		add edi, ebx
		add ascii[edi], 1
		inc esi
	loop L2

	ret

cal ENDP
END main