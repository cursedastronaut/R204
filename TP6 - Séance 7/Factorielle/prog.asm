.DATA
	n		QWORD ?
	sizeF	QWORD ?
	i		QWORD 0
.CODE
	factorielle PROC
		MOV n, RCX
		MOV sizeF, RCX
		MOV i, RCX
		MOV RAX, 1
		MOV RBX, 0

		boucle:
			CMP i, RBX
			JE fin
			MUL i
			DEC i
			JMP boucle
		
		fin:
			RET ; Le résultat à retourner est dans RAX
	factorielle ENDP
END
