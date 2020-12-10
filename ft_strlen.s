segment .text 
	global ft_strlen

ft_strlen:
	MOV	RAX, 0
	JMP main_loop

main_loop:
	CMP	BYTE[RDI + RAX], 0
	JE	end
	INC	RAX
	JMP	main_loop

end:
	RET
