.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

    var dword 12345678h

.code
main PROC

    mov eax, 0
    mov ax, byte PTR var

    call dumpregs

    exit

main ENDP
END main