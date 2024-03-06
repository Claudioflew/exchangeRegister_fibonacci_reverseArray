COMMENT !
Description: Convert big endian value to little endian
Author name: Koichi Nakata
Author email: kanakta595@insite.4cd.edu
Last modified date: February 24, 2024
Creation date: February 24, 2024
!

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
bigEndian byte 12h, 34h, 56h, 78h
littleEndian dword ?				; In memory 12h, 34h, 56, 78h = 56781234

.code
main PROC
	mov ah, bigEndian
	mov al, bigEndian + 1
	mov word ptr littleEndian + 2, ax

	mov ah, byte ptr bigEndian + 2
	mov al, byte ptr bigEndian + 3
	mov word ptr littleEndian, ax

	CALL DumpRegs

	INVOKE ExitProcess, 0
main endp
end main