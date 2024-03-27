; Université Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
;
; Code des fonctions x64asm (MASM) pcgd et ppcm
.CODE
	;int32_t pgcd(int32_t, int32_t)
	pgcd PROC

		boucle: 
			MOV EAX,ECX
			MOV ECX,EDX
			
			MOV EDX,0
			DIV ECX
			
			CMP EDX,0
			JNE BOUCLE

		MOV EAX,ECX ;EAX est le registre de retour
		RET ;On retourne EAX

	pgcd ENDP

	;int16_t ppcm(int16_t, int16_t)
	ppcm PROC
		MOV AX, CX ;a=m
		MOV BX, DX ;b=n

		boucleEx:
			CMP AX, BX
			JE fin	;s a=b on arrete

		boucleIn:
			CMP AX, BX
			JAE boucleIn2; si a>=b on arrête
			ADD AX, CX
			JMP BoucleIn

		boucleIn2:
			CMP AX, BX
			JBE boucleEx
			ADD BX, DX
			JMP boucleIn2

		fin:
			RET ; retourne AX
	ppcm ENDP
END 
