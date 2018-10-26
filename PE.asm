.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	
	bigEndian byte 12h, 34h, 56h, 78h
	littleEndian dword ?

.code
main PROC

    mov	eax, 0
   	
   	mov al, bigEndian+3
	mov byte ptr [littleEndian], al
	
	mov al, bigEndian+2
	mov byte ptr [littleEndian+1], al
	
	mov al, bigEndian+1
	mov byte ptr [littleEndian+2], al
	
	mov al, bigEndian
	mov byte ptr [littleEndian+3], al

	mov eax, littleEndian
	call dumpregs

    exit

main ENDP
END main