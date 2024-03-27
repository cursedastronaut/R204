.DATA
	a REAL8 ?
	b REAL8 ?
	c REAL8 ?
	n REAL8 ?
	tmp REAL8 ?
.CODE
	polynome2double PROC
		; la fonction appelante passe a dans XMM0, b dans XMM1,
		; c dans XMM2 et n dans XMM3
		MOVSD a, xmm0
		MOVSD b, xmm1
		MOVSD c, xmm2
		MOVSD n, xmm3

		; Calcul de n^2
		MOVSD xmm4, xmm3
		MULSD xmm4, xmm4 ; n^2

		; Calcul de a*n^2
		MOVSD xmm5, xmm0
		MULSD xmm5, xmm4 ; a*n^2

		; Calcul de b*n
		MULSD xmm3, xmm1 ; b*n

		; Calcul de a*n^2 + b*n
		ADDSD xmm5, xmm3

		; Calcul de a*n^2 + b*n + c
		ADDSD xmm5, xmm2

		MOVSD tmp, xmm5 ; Stockage du résultat temporaire
		MOVSD xmm0, xmm5 ; Chargement du résultat dans xmm0 pour le retour

		RET ; Le résultat à retourner est dans xmm0
	polynome2double ENDP
END
