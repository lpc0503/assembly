.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

.code
main PROC

	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov bx, 5
	mov ax, 60h
	stc
	call dumpregs
	adc bx, ax
	;mov cx, 10h
	;div cx
	call dumpregs

    exit

main ENDP
END main