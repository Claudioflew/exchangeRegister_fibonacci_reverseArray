COMMENT !
Description: Reorders the values in four 8-bit registers, using xchg no more than 3 times
Author name: Koichi Nakata
Author email: kanakta595@insite.4cd.edu
Last modified date: February 26, 2024
Creation date: February 26, 2024
!

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data

.code
main PROC
	mov al, "A"
	mov bl, "B"
	mov cl, "C"
	mov dl, "D"		; Now (al, bl, cl, dl) = {A, B, C, D}

	xchg al, bl		; (al, bl, cl, dl) = {B, A, C, D}
	xchg bl, cl		; (al, bl, cl, dl) = {B, C, A, D}
	xchg cl, dl		; (al, bl, cl, dl) = {B, C, D, A}

	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main