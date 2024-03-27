; Universit� Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
; Le fichier prog.asm contient lui la d�finition de la fonction somme en ASM x64. Lorsque le programme principal
; C++ va appeler la fonction somme, il va placer le premier param�tre (l�entier a) dans le registre ECX et le
; deuxi�me param�tre (l�entier b) dans le registre EDX et il r�cup�rera la valeur de retour � partir du registre EAX.
; C�est pourquoi la fonction somme copie d�abord ECX dans EAX, puis ajoute le contenu de EDX � EAX

.CODE
	somme PROC
		MOV EAX,ECX
		ADD EAX,EDX
		RET
	somme ENDP
END 