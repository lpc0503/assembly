.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	target byte 1000 DUP (0)
	source byte 1000 DUP (0)
	pos dword ?
	stop dword ?
	lenSrc dword ?
	lenTar dword ?

	strFind byte "the pos is: ", 0
	str404 byte "404 not found", 0ah, 0dh, 0

Str_find proto,
	src: ptr byte,
	tar: ptr byte

.code
main PROC

	mov ecx, 1000
	mov edx, OFFSET target
	call readString

	mov ecx, 1000
	mov edx, OFFSET source
	call readString


    mov eax, 0
    invoke Str_find, addr [source], addr [target]

    cmp eax, 0
    js no

    mov pos, eax
    inc eax

    mov edx, OFFSET	strFind
    call writeString
    call writeDec
    call crlf

    exit

    no:
    	mov edx, OFFSET str404
    	call writeString
    	call crlf

    exit

main ENDP

Str_find PROC,
	src: ptr byte,
	tar: ptr byte,

	invoke str_length, tar
	mov lenTar, eax

	invoke str_length, src
	mov lenSrc, eax

	lea edi, [target]
	lea esi, [source]


	mov eax, edi
	add eax, lenTar
	sub eax, lenSrc
	inc eax

	mov stop, eax

	cld

	mov ecx, lenSrc

	L1:
		pushad
		repe cmpsb
		popad

		je found
		inc edi
		cmp edi, stop
		jae notfound
		jmp L1

	notfound:
		mov eax, -1
		ret

	found:
		mov eax, edi
		sub eax, tar
		ret

Str_find ENDP
END main