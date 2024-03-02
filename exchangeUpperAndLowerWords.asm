COMMENT !
Description: Exchanges the upper and lowers words in a double word variable
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
three dword 12345678h			; This is stored as 78, 56, 34, 12 in the memory
temp word 2 DUP(?)

.code
main PROC

	mov ax, word ptr three		; ax = 5678h (in memory, 78, 56)
	mov bx, word ptr three + 2	; bx = 1234h
	mov temp, bx				; temp = {1234h, ?}
	mov temp + 2, ax			; temp = {1234h, 5678h}

	mov eax, dword ptr temp		; The first word is copied to the lower of eax, and the second word is copied to the upper of eax, so eax = 56781234hs
	mov three, eax				; Move back the value to three

	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main