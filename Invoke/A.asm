.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	need BYTE ?
	intput1 BYTE "Enter a string: ",0,0ah,0dh
	intput2 BYTE "Enter a character to find the frequency: ",0,0ah,0dh
	output1 BYTE "Frequency of ",0,0ah,0dh
	output2 BYTE " = ",0,0ah,0dh
	char BYTE ?
	len DWORD ?
	ans DWORD ?

str_find proto,
	use: PTR BYTE,
	target: BYTE


.code
main PROC
	
	mov ecx, 1000
	Lea edx, [intput1]
	call writestring
	call crlf

	Lea edx, [need]
	call readstring
	mov len,eax
	
	mov edx, offset intput2
	call writestring
	call crlf

	call readchar
	mov char,al

	mov ans,0
	invoke str_find,addr need,char

	mov edx,offset output1
	call writestring
	mov al,char
	call writechar
	mov eax,ans
	mov edx,offset output2
	call writestring
	mov eax,ans
	call writedec
	call crlf

	exit
	
main ENDP

str_find proc,
	use: PTR BYTE,
	target: BYTE

	mov ecx,len
	mov eax,0

	mov bl,target
	mov esi,use

	L1:
		cmp BYTE ptr[esi],bl
		je thesame
		jmp other

		thesame:
			add ans,1
		other:
			add esi,1

	loop L1
	ret
str_find ENDP

END main