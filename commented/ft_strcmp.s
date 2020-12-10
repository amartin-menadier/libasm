

; rdi, rsi, rdx are the first three args
; RAX 64 / EAX 32 / AX 16 = AH 8 + AL 8 bits
; int ft_strcmp(const char *s1, const char *s2)

segment .text
	global ft_strcmp

ft_strcmp:
	mov rax,0
	mov rbx,0
	mov rdx,0

main_loop:
	mov al, BYTE[rdi + rdx] ;al = 1 char in rax, the return value
	mov bl, BYTE[rsi + rdx] ;bl = 1 char in a var
	cmp al,0 ;str1[i] = 0, go to end
	je  end
	cmp bl,0 ;str2[i] = 0, go to end
	je  end
	cmp al,bl ;compare str1[i] and str2[i]
	jne end ;not equal ? go to end
	inc rdx
	jmp main_loop

end:
	sub rax, rbx
	ret

