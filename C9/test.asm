.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
targetStr byte 'ABCDEkk',20 DUP(0)
sourceStr byte '12343456789',0

.code

Str_concat proto,
	target:ptr byte,
	source:ptr byte
	

main proc
	invoke Str_concat,addr targetStr,addr sourceStr
	
	mov edx,offset targetStr
	call writestring	

    exit

main endp


Str_concat proc uses eax ebx ecx esi edi,
	target:ptr byte,
	source:ptr byte


	mov eax, 7
	call dumpregs
	
	mov ecx, lengthof sourceStr
	sub ecx,1
	
	mov esi, source
	mov edi, target

	add edi, eax	

	L1:
		
		mov ebx, [esi]
		mov [edi], ebx

		inc esi
		inc edi
	loop L1

	ret
Str_concat endp




end main