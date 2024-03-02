COMMENT !
Description: Reverses an array with any data type and size, using a loop
Author name: Koichi Nakata
Author email: kanakta595@insite.4cd.edu
Last modified date: February 25, 2024
Creation date: February 25, 2024
!

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
array dword 1, 5, 6, 8, 0Ah, 1Eh, 22h, 2Ah, 32h

.code
main PROC
	mov esi, 0							; Index of the first element
	mov edi, sizeof array - type array	; Index of the last element (use sizeof, not lengthof)
	mov ecx, lengthof array / 2			; Counter

L1:
	mov eax, array[esi]
	xchg eax, array[edi]
	mov array[esi], eax

	add esi, type array					; Increment the first index by type bytes
	sub edi, type array					; Decrement the second index by type bytes
	loop L1


	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main