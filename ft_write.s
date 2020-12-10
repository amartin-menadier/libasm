section .text
	global ft_write
	extern _handle_error

ft_write:
	MOV RAX, 1
	SYSCALL
	CMP RAX,0
	JL  _handle_error
	RET
