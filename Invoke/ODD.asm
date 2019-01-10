.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte "ABC DEF GHI",0
asciii byte 128 DUP(0)
semicol byte " : "

isascii proto,
	str123: ptr byte

.code
main PROC
	
	mov esi,offset str1

	invoke isascii,addr str1

    mov ecx,128


    mov edi,0
    L2:
    	.if (asciii[edi] != 0)
    		mov al,asciii[edi]
    		call writechar
    		mov edx,offset semicol
    		call writestring
    		call crlf
    		inc edi
    	.endif
    Loop L2

    exit

main ENDP

isascii proc,
	str123: ptr byte	


	mov esi,offset str1
	invoke str_length,str123
	mov ecx,eax

	L1:
		mov ebx,0
		mov bl,[esi]
		mov edi,offset asciii
		add edi,ebx
		add [edi],al
		inc esi
	loop L1


isascii endp 


END main