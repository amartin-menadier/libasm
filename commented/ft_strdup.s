

; char		*ft_strdup(const char *s)

segment .text
	global ft_strdup
	extern malloc
	extern handle_error
	extern ft_strlen

ft_strdup:
	call ft_strlen ;use ft_strlen(rdi) and stock the len in rax
	push rdi ;save rdi value in the memory
	mov rdi,rax ;mov the len in rax in rdi
	inc rdi ;len +1 for \0
	call malloc ;void *malloc ( size_t size ); first arg, rdi is the value passed to malloc, the return value is set in rax
	cmp rax,0 ;if malloc didn't set free memory, rax is equal to 0, NULL
	je handle_error
	pop rdi ;get saved rdi value back in rdi
	mov rsi,rdi ;*ft_strcpy(char *dest, const char *src) rdi is the src, we need to move it in rsi
	mov rdi,rax ;the malloc space is in rax, need to be the dest, so we mov this space in rdi
	push rdx
	mov rdx,0
	jmp cpy
cpy:
	mov cl,byte[rsi + rdx] ;mov src[i] in cl
	mov byte[rdi + rdx],cl ;mov cl in dst[i]
	inc rdx ;i++
	cmp cl,0
	je end
	jmp cpy
end:
	mov rax,rdi
	pop rdx
	ret ;return rax set to 0
