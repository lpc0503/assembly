.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	val1 word 35h
	val2 word 48h

.code
main PROC

	mov eax, 0
	mov edx, 0
	mov ebx, 0

	mov ax, 8003h
	mov dx, 01h
	call dumpRegs

	mov bx, 100h
	call dumpRegs

	div bx
	call dumpRegs
	;call writeInt
	call crlf

    exit

main ENDP
END main