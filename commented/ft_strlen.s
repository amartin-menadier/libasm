

segment .text 
	global ft_strlen

ft_strlen:
	mov	rax,0 ; rax, return value init to 0 ; rax = registre accumulateur
	jmp main_loop

main_loop:
	cmp	BYTE[rdi + rax],0 ;check if src[i] = \0 ; rdi is the first arg ; 
	je	end ; jump if equal si ZF = 1 et ZF = 1 si la dernière opération = 0
	inc	rax ;i++
	jmp	main_loop

end:
	ret ;return rax = i ; 

; segment is a synonym of section. 
; Nasm can produce output in various formats, some of which support sections. 
; Certain section names can be arbitrary (such as .text .data and .bss), 
; for them only the section flags count. 
; The predefined ones are just convenience shortcuts, 
; 	.text (or .code) is marked as containing code, 
; 	.data as read-write initialized data. = initialized data
; 	.bss as zero-initialized read-write data. = uninitialized data
; You could put your code in a section named foo 
; as long as it was marked as a code section, 
; and you can use multiple sections as you see fit.

; global main basically means that the symbol should be visible to the linker
; because other object files will use it.
; Without it, the symbol main is considered local to the object file it's assembled to, 
; and will not appear after the assembly file is assembled.

; MOV destination source ; copies destination in source
; 2. L’instruction MOV (« Move »)
; Syntaxe : MOV Destination, Source
; Description : Copie le contenu de Source dans Destination.
; Mouvements autorisés : MOV Registre général, Registre quelconque
; MOV Mémoire, Registre quelconque
; MOV Registre général, Mémoire
; MOV Registre général, Constante
; MOV Mémoire, Constante
; MOV Registre de segment, Registre général
; Remarques : Source et Destination doivent avoir la même taille. On ne peut charger dans un
; registre de segment que le contenu d’un registre général (SI, DI et BP sont considérés ici
; comme des registres généraux). 
; Exemples : MOV AX, 5
; MOV ES, DX
; MOV AL, [Variable1] ;Copie un octet car AL contient 8 bits
; MOV [Variable2], DS ;Copie un word car DS contient 16 bits
; MOV word ptr [Variable3], 12 ;Ici, on spécifie que la variable est un word 

; 4. L’instruction JMP (« Jump »)
; Syntaxe : JMP MonLabel
; Description : Saute à l’instruction pointée par MonLabel. 

; 5. L’opérateur CMP (« Compare »)
; Syntaxe : CMP Destination, Source
; Description : Cet opérateur sert à comparer deux nombres : Source et Destination. C'est le
; registre des indicateurs qui contient les résultats de la comparaison. Ni Source ni Destination
; ne sont modifiés.
; Indicateurs affectés : AF, CF, OF, PF, SF, ZF
; Remarque : Cet opérateur effectue en fait une soustraction mais contrairement à SUB, le
; résultat n’est pas sauvegardé.

; JE (« Jump if Equal ») fait un saut au label spécifié si et seulement si ZF = 1.
; Rappelez-vous que ce flag est à 1 si et seulement si le résultat de l’opération
; précédente vaut zéro. Comme CMP réalise une soustraction, on utilise généralement
; JE pour savoir si deux nombres sont égaux. 

