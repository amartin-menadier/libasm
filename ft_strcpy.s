segment .text
	global ft_strcpy

ft_strcpy:
	MOV RCX, 0
	MOV RDX, 0
	JMP main_loop

main_loop:
	MOV DL, BYTE[RSI + RCX]
	MOV BYTE[RDI + RCX], DL
	CMP BYTE[RSI + RCX], 0
	JE	end
	INC RCX
	JMP main_loop

end:
	MOV RAX, RDI
	RET
