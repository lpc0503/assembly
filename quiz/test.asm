.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	str1 byte "AAAX", 0
	str2 byte 10 dup(0FFh)

.code
main PROC

   mov eax, 0
   mov eax, -16
   cdq
   call dumpregs
   mov ebx, +5
   idiv ebx

   call dumpregs

   exit

main ENDP
END main