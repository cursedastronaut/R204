; Universit� Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
;
; Ce programme permet de calculer la valeur d�un polyn�me de second degr� a*n2+b*n+c pour des valeurs enti�res
; donn�es de a, b, c et n. 
;
; Int�ressons-nous � pr�sent au programme assembleur. Celui-ci comporte cette fois-ci la d�finition de 4 variables
; de types QWORD (64 bits) a, b, c, n servant � stocker temporairement les valeurs des param�tres re�us. Une
; cinqui�me variable temporaire tmp est �galement utilis�e pour stocker des calculs temporaires. Les cinq variables
; ne sont pas initialis�es, d�o� le point d�interrogation.
; Les premi�res instructions du programme copient les valeurs des param�tres dans les variables.
; Le programme proc�de ensuite aux calculs n�cessaires en utilisant l�instruction IMUL qui r�alise une multiplication
; sign�e ainsi que l�instruction ADD pour l�addition. A la fin le r�sultat est retourn� dans le registre RAX. 
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
		; ici IMUL fait une multiplication enti�re sign�e de RAX
		; (64 bits) par un autre registre ou une autre variable
		; enti�re de 64 bits et stocke le r�sultat sur 128 bits dans
		; RDX:RAX mais on supposera ici que le r�sultat tient sur
		; 64 bits seulement (soit RAX)
		MOV RAX,n
		IMUL n ; calcul de n^2
		IMUL a ; calcul de a*n^2
		MOV tmp,RAX ; stockage du r�sultat temporaire
		MOV RAX,n
		IMUL b ; calcul de b*n
		ADD RAX,tmp ; calcul de a*n^2 + b*n
		ADD RAX,c ; calcul de a*n^2 + b*n + c
		RET ; le r�sultat � retourner est dans RAX
	polynome2int ENDP
END 