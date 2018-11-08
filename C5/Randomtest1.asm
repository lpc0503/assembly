.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	randVal dword ?

.code
main PROC

    mov eax, 0
    call Random32
    mov randVal, eax
    call dumpregs
    call Randomize
    mov ecx, 10

    L1:

    	call Random32
    	call dumpregs

    loop L1

    exit

main ENDP
END main