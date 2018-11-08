.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	randVal dword ?

.code
main PROC

    ;mov eax, 0
    ;mov eax, 20
    ;call dumpregs
    call Randomize
    mov ecx, 10
    mov randVal, eax
    ;call Randomize

    L1: 

    	mov eax, 20     ;remenber to add this line
    	call RandomRange
    	call writeint
    	call crlf

    loop L1

    ;call dumpregs

    exit

main ENDP
END main