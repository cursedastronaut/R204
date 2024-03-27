; Université Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
; Le fichier prog.asm contient lui la définition de la fonction somme en ASM x64. Lorsque le programme principal
; C++ va appeler la fonction somme, il va placer le premier paramètre (l’entier a) dans le registre ECX et le
; deuxième paramètre (l’entier b) dans le registre EDX et il récupérera la valeur de retour à partir du registre EAX.
; C’est pourquoi la fonction somme copie d’abord ECX dans EAX, puis ajoute le contenu de EDX à EAX

.CODE
	somme PROC
		MOV EAX,ECX
		ADD EAX,EDX
		RET
	somme ENDP
END 