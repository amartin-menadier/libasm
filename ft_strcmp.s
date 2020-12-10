segment .text
	global ft_strcmp

ft_strcmp:
	MOV RAX, 0
	MOV RBX, 0
	MOV RDX, 0

main_loop:
	MOV AL, BYTE[RDI + RDX] 
	MOV BL, BYTE[RSI + RDX] 
	CMP AL, 0 
	JE  end
	CMP BL, 0 
	JE  end
	CMP AL, BL 
	JNE end 
	INC RDX
	JMP main_loop

end:
	SUB RAX, RBX
	RET
