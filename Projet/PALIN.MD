# Project R204
## 1. Champs
| Adresse | Nom   | Taille | Valeur par défaut | Utilité | Contrôle |
|---------|-------|--------|-------------------|---------|----------|
| 01      | JMP   | 01     | 0                 | Active un saut vers une adresse spécifiée dans [DATA](#chp-DATA) | [JMP](#chp-JMP) |
| 02      | JMPZ  | 01     | 0                 | Active un saut vers une adresse spécifiée dans [DATA](#chp-DATA) si le dernier résultat de l'UAL est nul | [JMPZ](#chp-JMPZ) |
| 03      | JMPNZ | 01     | 0                 | Active un saut vers une adresse spécifiée dans [DATA](#chp-DATA) si le dernier résultat de l'UAL n'est pas nul.| [JMPNZ ](#chp-JMPNZ)|
| 04      | JMPN  | 01     | 0                 | Active un saut vers une adresse spécifiée dans [DATA](#chp-DATA) si le dernier résultat de l'UAL est négatif. | [JMPN](#chp-JMPN)  |
| 05      | JMPPZ | 01     | 0                 | Active un saut vers une adresse spécifiée dans [DATA](#chp-DATA) si le dernier résultat de l'UAL n'est pas négatif.| [JMPPZ ](#chp-JMPPZ)|
| 06      | MUX1  | 02     | 0                 | Choisir entre envoyer B, SI, DI, ou la donnée de la RAM séléctionnée (voir [MUX2](#chp-MUX2)) à l'UAL à l'entrée 1.| [MUX1](#chp-MUX1)  |
| 08      | MUX0  | 01     | 0                 | Choisir entre envoyer A ou le contenu de [DATA](#chp-DATA) (Adresse ou valeur immédiate) à l'UAL à l'entrée 0. | [MUX0](#chp-MUX0)  |
| 09      | MUX2  | 01     | 0                 | Obtenir une donnée à l'adresse précisée par SI ou DI qu'on séléctionne ici. | [MUX2](#chp-MUX2)  |
| 10      | DEC   | 03     | 0                 | Choisir où écrire (A, B, SI, DI, RAM) | [DEC](#chp-DEC)   |
| 13      | ALU   | 04     | 0                 | Donner des ordres de calculs à l'UAL | [ALU](#chp-ALU)   |
| 17      | DATA  | 17     | 0                 | Adresse ou valeur immédiate| [DATA](#chp-DATA)  |

<a id="chp-JMP"></a>

### 1.1 JMP
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | - |

<a id="chp-JMPZ"></a>

### 1.2 JMPZ
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | le dernier résultat de l'UAL est nul |
<a id="Jchp-MPNZ"></a>

### 1.3 JMPNZ
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | le dernier résultat de l'UAL n'est pas nul. |
<a id="chp-JMPN"></a>

### 1.4 JMPN
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | le dernier résultat de l'UAL est négatif. |
<a id="Jchp-MPPZ"></a>

### 1.5 JMPPZ
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | le dernier résultat de l'UAL n'est pas négatif. |
<a id="chp-MUX1"></a>

### 1.6 MUX1
| Bit(s) | Action |
|--------|--------|
| 00     | Envoie B à l'entrée I1 de l'UAL. |
| 01     | Envoie SI à l'entrée I1 de l'UAL. |
| 10     | Envoie DI à l'entrée I1 de l'UAL.
| 11     | Envoie la donnée de la RAM sélectionnée par [MUX2](#chp-MUX2) à l'entrée I1 de l'UAL. |
<a id="chp-MUX0"></a>

### 1.7 MUX0
| Bit(s) | Action |
|--------|--------|
| 0      | Envoie la valeur immédiate de DATA à l'entrée 0 de l'UAL. |
| 1      | Envoie A à l'entrée 0 de l'UAL. |

<a id="chp-MUX2"></a>

### 1.8 MUX2
| Bit(s) | Action |
|--------|--------|
| 0      | Sélectionne la donnée à l'adresse de la valeur de SI |
| 1      | Sélectionne la donnée à l'adresse de la valeur de DI |
<a id="chp-DEC"></a>

### 1.9 DEC
| Bit(s) | Action |
|--------|--------|
| 000    | -      |
| 001    | Permet l'écriture sur A |
| 010    | Permet l'écriture sur B |
| 011    | Permet l'écriture sur SI |
| 100    | Permet l'écriture sur DI |
| 101    | Permet l'écriture sur la RAM, à l'adresse séléctionnée par [MUX2](#chp-MUX2). |
| 110    | -      |
| 111    | -      |
<a id="chp-ALU"></a>

### 1.A ALU
| Bit(s) | Action | Condition à respecter |
|--------|--------|-----------------------|
| 0      | -      | - |
| 1      | Active un saut vers une adresse spécifiée dans DATA | - |
<a id="chp-DATA"></a>

### 1.B DATA


## 2. Instructions

## 3. PALIN.ASM
### 3.1 Pseudo code très littéral
Pseudo code très littéral.
```c
char* word = "kayak";
int DI = 0, SI = 0, A = 0, B = 0;

void PALIN() {
	DI = word[SI];	//LOADDIADRSI
	while (;;) {
		++SI;			//INCSI (début de la boucle "boucle")
		B = word[DI];	//LOADBADRDI
		A = word[SI];	//LOADAADRSI
		
		if ((B-A)!=0) { //CMPBA & JMPNZ fail
			A = -1;		//LOADA #-1 (dans fail)
			return;
		}

		if ((--DI)!=0) {	//DECDI & JMPNZ AAAA
			A = DI;			//LOADADI (dans AAAA)
			if ((SI-A)<=0) {//CMPSIA & JMPPZ G
				A = 1;		//LOAD #1 (dans G)
				return;		//JMP fin (dans G)
			}
		} else {
			A = 1;			//LOADA #1 (dans G)
		}
	}
}
```

### 3.2 Code expliqué:
1. On charge la taille du mot dans DI
1. On incrémente SI *(si c'est la première fois, il sera à 1 et donc au premier caractère du mot)*.
1. On charge dans B le DIème caractère du mot *(si c'est la première fois, la dernière lettre)*.
1. On charge dans A le SIème caractère du mot *(si c'est la première fois, la première lettre)*.
1. On vérifie que B=A *(si c'est la première fois, que la première lettre soit égale à la dernière)*.
1. Si ce n'est pas le cas, on met A à -1, et on saute à la fin du programme. **Le mot n'est pas un palindrome**.
1. Si c'est bien le cas, on décrémente DI *(si c'est la première fois, il pointe vers l'avant dernière lettre)*.
1. Si la nouvelle valeur de DI est nulle, on met A à 1, et terminé. **Le mot est un palindrome**.
1. Sinon, on met A à DI, et on vérifie que (SI-A) est bien supérieur ou égal à zéro.
1. Si c'est bien le cas, on met A à 1 et terminé.
1. Sinon, on recommence à l'étape 2.

### 3.3 Jeu de test

| Nom du test | RAM                                     | Résultat dans A | Palindrome ? |
|-------------|-----------------------------------------|-----------------|--------------|
| Mot vide    | 0000 0000 00...                         | 1               | Oui          |
| Mot d'1 char| 0001 0000 00...                         | 1               | Oui          |
| Pal de 2 char|0002 0041 00041 0000 00...              | 1               | Oui          |
| NPal 2Char  | 0002 0041 00FF 0000 00...               | -1 (0xFFFF)     | Non          |
| NPal 5Char  | 0005 0048 0065 006C 006C 006F 0000 00...| -1 (0xFFFF)     | Non          |
| Pal 5 Char  | 0005 004B 0041 0059 0041 004B 0000 00...| 1               | Oui          |

