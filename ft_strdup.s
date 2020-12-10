segment .text
	global ft_strdup
	extern malloc
	extern _handle_error
	extern ft_strlen

ft_strdup:
	CALL ft_strlen
	PUSH RDI
	MOV  RDI, RAX
	INC  RDI
	CALL malloc
	CMP  RAX, 0
	JE   _handle_error
	POP  RDI
	MOV  RSI, RDI
	MOV  RDI, RAX
	PUSH RDX
	MOV  RDX, 0
	JMP  cpy

cpy:
	MOV  CL, BYTE[RSI + RDX]
	MOV  BYTE[RDI + RDX], CL
	INC  RDX
	CMP  CL, 0
	JE   end
	JMP  cpy

end:
	MOV  RAX, RDI
	POP  RDX
	RET
