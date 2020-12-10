

; In 42 VM, syscall numbers can be found in /usr/include/x86_64-linux-gnu/asm/unistd_64.h

section .text
	global ft_read
	extern handle_error

ft_read:
	mov rax,0 ;the parameter passed to syscall, 0 is for read
	syscall ;do the syscall and put the return value in rax
	cmp rax,0
	jl handle_error
	ret
