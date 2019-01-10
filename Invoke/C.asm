.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	need BYTE ?,0dh,0ah,0
	input BYTE "Enter a line of string: ",0dh,0ah,0
	Vowels BYTE "Vowels: " ,0
	Consonants BYTE "Consonants: ",0
	Digits BYTE "Digits: " ,0
	Spaces BYTE "White spaces: ",0
	len DWORD 0
	num1 DWORD 0
	num2 DWORD 0
	num3 DWORD 0
	num4 DWORD 0

check proto,
	use: PTR BYTE

.code
main PROC
	

	mov edx,offset input
	call writestring
	call crlf
	
	mov edx,offset need
	mov ecx,150
	call readstring
	mov len,eax
	
	invoke check,addr need

	mov edx,offset Vowels
	call writestring
	mov eax,num1
	call writedec
	call crlf

	mov edx,offset Consonants
	call writestring
	mov eax,num2
	call writedec
	call crlf

	mov edx,offset Digits
	call writestring
	mov eax,num3
	call writedec
	call crlf

	mov edx,offset Spaces
	call writestring
	mov eax,num4
	call writedec
	call crlf

	exit
	
main ENDP

check PROC,
	use: PTR BYTE

	mov esi,use
	mov ecx,len

	L1:
		mov bl,[esi]
		.if( bl == 'a' ) || ( bl =='e') || ( bl =='i') || ( bl =='o') || ( bl =='u') || ( bl =='A') || ( bl =='E') || ( bl =='I') || ( bl =='O') || ( bl =='U')
			add num1,1
		.elseif(bl>='a' ) && ( bl<='z') || (bl>='A') && (bl<='Z')
			add num2,1
		.elseif(bl>='0') && (bl<='9')
			add num3,1
		.elseif(bl==' ')
			add num4,1
		.endif
		add esi,1
		; call dumpregs
	dec cx
	jne L1
	ret
check ENDP

END main