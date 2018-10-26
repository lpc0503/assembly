.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
.code
main PROC
    mov eax,2
    sub eax,2 
    call DumpRegs

    exit
main ENDP

END main