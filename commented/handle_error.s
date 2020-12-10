

section .text
	global handle_error
	extern __errno_location

handle_error:
	neg rax ;rax is negative, we change it into positive value
	mov r12, rax ;mov rax in r12 for errno call
	call __errno_location
	mov [rax], r12 ;put the value in r12 in rax
	mov rax, -1 ;ret -1
	ret

; __errno_location -- address of errno variable