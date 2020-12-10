section .text
	global ft_write
	extern handle_error

ft_write:
	mov rax, 1 ;the parameter passed to syscall, 1 is for write
	syscall ;do the syscall and put the return value in rax
	cmp rax,0
	jl handle_error ; jump if less
	ret