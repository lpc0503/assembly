.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	
	intput BYTE "Enter a three digit integer: ",0dh,0ah,0
	output1 BYTE " is an Armstrong number.",0dh,0ah,0
	output2 BYTE " is not an Armstrong number.",0dh,0ah,0
	num DWORD 0
	tmp DWORD 0
	ans DWORD 0
	
Armstrong PROTO,
	number: DWORD

.code
main PROC
	
	mov edx,offset intput
	call writestring
	call readint
	mov num,eax

	invoke Armstrong,num

	mov eax,ans
	.if( num == eax )
		mov edx,offset output1
	.else
		mov edx,offset output2
	.endif

	mov eax,num
	call writedec
	call writestring

	exit
	
main ENDP

Armstrong PROC,
	number: DWORD	

	mov ecx,3

	L1:
		mov edx,0
		mov eax,number
		mov ebx,10
		div ebx
		mov number,eax
		mov tmp,edx

		mov eax,tmp
		mul tmp
		mul tmp

		add eax,ans
		mov ans,eax

	loop L1
	ret
Armstrong ENDP

END main