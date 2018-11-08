.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data



.code
main PROC
	
	mov bx, 0A69Bh
	movzx eax, bx
	movzx edx, bh
	call dumpregs
   
    exit

main ENDP

END main