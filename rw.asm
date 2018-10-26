.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	
	var1 sbyte -4, -3, -2, -1
	var2 word 1000h, 2000h, 3000h, 4000h
	var3 sword -16, -42
	var4 dword 1, 2, 3, 4, 5

.code
main PROC
	
	mov eax, 0	

	mov al, 00f0h
	call dumpregs
	add al, 45h
	call dumpregs
	add al, 20
	call dumpregs

	exit

main ENDP
END main