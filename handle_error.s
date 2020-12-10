section .text
	global _handle_error
	extern __errno_location

_handle_error:
	NEG  RAX
	MOV  R12, RAX
	CALL __errno_location
	MOV  [RAX], R12
	MOV  RAX, -1
	RET
