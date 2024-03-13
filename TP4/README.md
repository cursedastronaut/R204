# TP4
## 1. Registres des processeurs x64
- **Quelle est le lien entre le registre RAX et le registre EAX ?**
	<br>Le registre EAX représente les <u>32 bits de poids faible</u> de RAX.
- **Quelle est le lien entre le registre EAX et le registre AX ?** 
	<br>Le registre AX représente les <u>16 bits de poids faible</u> de EAX.
- **Quelle est le lien entre le registre AX et les registres AH et AL ?**
	<br>AH répresente les <u>8 bits de poids fort</u> de AX, et AL représente les <u>8 bits de poids faible</u> de AX.
- **Sachant qu’une case mémoire peut contenir 8 bits, quelle est en octets, la taille de l'espace mémoire qu'on peut adresser avec une adresse codée sur 16 bits ?**	
	<br><u>2¹⁶ octets</u>, soit 64 Kibioctets
- **Même question pour une adresse codée sur 20 bits ?** 
	<br><u>2²⁰ octets</u>, soit 1 Mébioctets.
- **Même question pour une adresse codée sur 32 bits ?** 
	<br><u>2³² octets</u>, soit 4 Gibioctets.
- **Même question pour une adresse codée sur 64 bits ?** 
	<br><u>2⁶⁴ octets</u>, soit 16 Exbioctets, ou approximativement 18 milliards de milliards d'octets.
- **Si le registre 64 bits RAX contient (ABCDEF0123456789)<small>16</small>, quel est le contenu en hexa des registres suivants :**

	| Registre | Contenu en Hexadécimal |
	|----------|------------------------|
	| AH       | 67                     |
	| AL       | 89                     |
	| AX       | 6789                   |
	| EAX      | 23456789               |

- **Le registre RSP (Stack Pointer) sert à pointer vers la prochaine case libre de la pile. Quelle est le rôle de la pile ?**

- **Que contient le registre des indicateurs EFL ? Quand est-il modifié ?**