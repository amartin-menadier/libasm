

; char	*ft_strcpy(char *dest, const char *src)
; rdi, rsi, rdx are the first three args
; so here, rdi = dest && rsi = src
; RAX 64 / EAX 32 / AX 16 = AH 8 + AL 8 bits

segment .text
	global ft_strcpy

ft_strcpy:
	mov rcx,0;general register for counter	
	mov rdx,0;general register for data
	jmp main_loop

main_loop:
	mov dl,BYTE[rsi + rcx] ;mov src[i] in dl
	mov BYTE[rdi + rcx],dl ;mov dl in dst[i]
	cmp BYTE[rsi + rcx],0 ;check if src[i] is equal to \0
	je end
	inc rcx ;i++
	jmp main_loop

end:
	mov rax,rdi
	ret
