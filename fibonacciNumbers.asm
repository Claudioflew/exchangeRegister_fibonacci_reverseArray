COMMENT !
Description: Calculates the first seven values of the Fibonacci Sequence, using a loop
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
fibonacci word 7 DUP(0)			; Create an array with 7 zeros

.code
main PROC
	mov fibonacci, 1		; Fill 1 in the first element
	mov fibonacci + 2, 1		; Fill 1 in the second element

	mov ecx, 5			; We want to loop 5 times
	mov esi, offset fibonacci + 4	; Make an iterator starting from the third element	

L1:
	mov ax, [esi - 4]		; Move the previous element to ax
	add ax, [esi - 2]		; Add the previous previous element to ax
	mov [esi], ax			; [esi] deferences the third element
	add esi, 2			; Don't forget increment the iterator by 2 bytes
	loop L1

	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main