.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	
	prompt byte "enter a integer : ", 0
	MSG  byte  "sum is : ", 0 
	int1 dword ?
	int2 dword ?
	sum  dword ?

.code
main PROC
	
	mov ecx, 3

	L1:
	    ;move cursor to mid screen
		call clrscr
	    mov dh, 13
	    mov dl, 40
	    call gotoxy

	    mov edx, OFFSET prompt
	    call writeString
	    call readInt
	    mov int1, eax

	    mov dh, 13
	    mov dl, 62
	    call gotoxy

	    call writeString
	    call readInt
	    mov int2, eax

	    mov eax, int1
	    add eax, int2
	    mov sum, eax

	    mov dh, 15
	    mov dl, 40
	    call gotoxy

	    mov edx, OFFSET MSG
	    call writeString
	    mov eax, sum
	    call writeInt
	    call crlf
	Loop L1
    exit

main ENDP
END main