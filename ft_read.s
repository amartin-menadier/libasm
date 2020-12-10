section .text
	global ft_read
	extern _handle_error

ft_read:
	MOV	RAX, 0
	SYSCALL
	CMP	RAX, 0
	JL	_handle_error
	RET
