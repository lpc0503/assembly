.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
	
	intput BYTE "Enter two numbers(intervals): ",0dh,0ah,0
	output1 BYTE "Armstrong numbers between ",0
	output2 BYTE " and ",0
	output3 BYTE " are: ",0
	output4 BYTE " ",0
	one DWORD 0
	two DWORD 0
	tmp DWORD 0
	ans DWORD 0
	len DWORD 0
	recode DWORD 0
	
Armstrong PROTO,
	number: DWORD

.code
main PROC
	
	mov edx,offset intput
	call writestring
	call readint
	mov one,eax
	call readint
	mov two,eax

	mov edx,offset output1
	call writestring
	mov eax,one
	call writedec
	mov edx,offset output2
	call writestring
	mov eax,two
	call writedec
	mov edx,offset output3
	call writestring

	mov ecx,5
	L5:
		invoke Armstrong,one
		add one,1
		mov ecx,5
		mov eax,one
		.if(eax>two)
			mov ecx,1
		.endif
	loop L5

	call crlf

	exit
	
main ENDP

Armstrong PROC,
	number: DWORD	

	mov ecx,1000
	mov eax,number
	mov recode,eax
	mov len,0
	mov ans,0
	L1:
		mov edx,0
		mov ebx,10
		div ebx
		add len,1
		.if( eax == 0 )
			mov ecx,1
		.endif
	loop L1
	mov ecx,1000
	L2:
		mov edx,0
		mov eax,number
		mov ebx,10
		div ebx
		mov number,eax
		mov tmp,edx

		mov ecx,len
		mov eax,1
		L3:
			mul tmp
		loop L3
		mov ecx,1

		add eax,ans
		mov ans,eax

		.if( number == 0 )
			mov ecx,1
		.else
			add ecx,1
		.endif
	loop L2

	mov eax,ans
	.if( recode == eax )
		call writedec
		mov edx,offset output4
		call writestring
	.endif

	ret
Armstrong ENDP

END main