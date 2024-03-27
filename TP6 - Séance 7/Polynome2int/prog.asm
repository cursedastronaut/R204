; Université Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
;
; Ce programme permet de calculer la valeur d’un polynôme de second degré a*n2+b*n+c pour des valeurs entières
; données de a, b, c et n. 
;
; Intéressons-nous à présent au programme assembleur. Celui-ci comporte cette fois-ci la définition de 4 variables
; de types QWORD (64 bits) a, b, c, n servant à stocker temporairement les valeurs des paramètres reçus. Une
; cinquième variable temporaire tmp est également utilisée pour stocker des calculs temporaires. Les cinq variables
; ne sont pas initialisées, d’où le point d’interrogation.
; Les premières instructions du programme copient les valeurs des paramètres dans les variables.
; Le programme procède ensuite aux calculs nécessaires en utilisant l’instruction IMUL qui réalise une multiplication
; signée ainsi que l’instruction ADD pour l’addition. A la fin le résultat est retourné dans le registre RAX. 
.DATA
	a QWORD ?
	b QWORD ?
	c QWORD ?
	n QWORD ?
	tmp QWORD ?
.CODE
	polynome2int PROC
		; la fonction appelante passe a dans RCX, b dans RDX,
		; c dans R8 et n dans R9
		MOV a,RCX
		MOV b,RDX
		MOV c,R8
		MOV n,R9
		; ici IMUL fait une multiplication entière signée de RAX
		; (64 bits) par un autre registre ou une autre variable
		; entière de 64 bits et stocke le résultat sur 128 bits dans
		; RDX:RAX mais on supposera ici que le résultat tient sur
		; 64 bits seulement (soit RAX)
		MOV RAX,n
		IMUL n ; calcul de n^2
		IMUL a ; calcul de a*n^2
		MOV tmp,RAX ; stockage du résultat temporaire
		MOV RAX,n
		IMUL b ; calcul de b*n
		ADD RAX,tmp ; calcul de a*n^2 + b*n
		ADD RAX,c ; calcul de a*n^2 + b*n + c
		RET ; le résultat à retourner est dans RAX
	polynome2int ENDP
END 