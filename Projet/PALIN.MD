# Project R204
## 0. Sommaire

1. [Champs](#chp)
	1. [JMP](#chp-JMP)
	1. [JMPZ](#chp-JMPZ)
	1. [JMPNZ](#chp-JMPNZ)
	1. [JMPN](#chp-JMPN)
	1. [JMPPZ](#chp-JMPPZ)
	1. [MUX1](#chp-MUX1)
	1. [MUX0](#chp-MUX0)
	1. [MUX2](#chp-MUX2)
	1. [DEC](#chp-DEC)
	1. [ALU](#chp-ALU)
	1. [DATA](#chp-DATA)
1. [Instructions](#ins)

1. [PALIN.ASM](#pal)
	1. [Pseudo code très littéral](#pal-code)
	1. [Code expliqué](#pal-exp)
	1. [Jeu de test](#pal-jeu)

1. [MAJ.ASM](#maj)
	1. [Pseudo code très littéral](#maj-code)
	1. [Code expliqué](#maj-exp)
	1. [Jeu de test](#maj-jeu)

<a id="chp"></a>

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
Contient la valeur immédiate ou l'adresse de saut
à laquelle l'utilisateur veut sauter.

<a id="ins"></a>

## 2. Instructions

## 2.01 INCSI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
| ALU   | 0101   | Remplacement | I1 + 1   |
| DEC   | 011    | Remplacement | Écrire dans SI |
| MUX1  | 01     | Remplacement | I1 = valeur d'SI |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.02 DECDI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
| ALU   |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.03 LOADAADRSI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.04 LOADBADRDI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.05 LOADDIADRSI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.06 LOADA
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.07 LOADSI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.08 LOADADI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.09 JMP
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0A CMPSIA
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0B CMPBA
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0C JMPNZ
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0D JMPPZ
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0E LOADASI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.0F LOADBADRSI
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.10 LOADADRSIB
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.11 CMPDIA
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.12 CMPB
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.13 SUBB
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |

## 2.14 JMPN
### Code Opératoire
| Champ | Valeur | Opération    | Pourquoi |
|-------|--------|--------------|----------|
|       |        | Remplacement | |

### Opérandes
| Champ | Type             |
|-------|------------------|
| DATA  |                  |


<a id="pal"></a>

## 3. PALIN.ASM
<a id="pal-code"></a>

### 3.1 Pseudo code très littéral
Pseudo code très littéral.
```c
char* word = "\x5kayak";
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
<a id="pal-exp"></a>

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

<a id="pal-jeu"></a>

### 3.3 Jeu de test

| Nom du test | RAM                                     | Résultat dans A | Palindrome ? |
|-------------|-----------------------------------------|-----------------|--------------|
| Mot vide    | 0000 0000 00...                         | 1               | Oui          |
| Mot d'1 char| 0001 0000 00...                         | 1               | Oui          |
| Pal de 2 char|0002 0041 00041 0000 00...              | 1               | Oui          |
| NPal 2Char  | 0002 0041 00FF 0000 00...               | -1 (0xFFFF)     | Non          |
| NPal 5Char  | 0005 0048 0065 006C 006C 006F 0000 00...| -1 (0xFFFF)     | Non          |
| Pal 5 Char  | 0005 004B 0041 0059 0041 004B 0000 00...| 1               | Oui          |


<a id="maj"></a>

## 4 MAJ.ASM

<a id="maj-code"></a>

### 4.1 Pseudo code très littéral
```c
int DI = 0, SI = 0, A = 0, B = 0;
char* word = "\x05AabcF";

void maj() {
	DI = word[SI]; //Ici, DI = la taille du mot
	while (true) {
		++SI;
		A = SI; //A obtient la valeur actuelle du curseur
		if ((DI-A)<0) { //si le curseur est plus loin que la taille du mot actuel 
			break;
		}
		B = word[SI];
		if ((B-97)>=0) { // B - 'a'
			B -= 32; //B -= 'a' - 'A';
			word[SI] = B;
		}
	}
}
```

Voici l'utilité de chaque registre dans ce programme:
| Registre | Utilité |
|----------|---------|
| DI | Stocke la taille du mot. |
| SI | Curseur du mot (pointe vers la SIème lettre) |
| A  | Sert à vérifier que le curseur n'a pas atteint la fin (la taille du mot) |
| B  | Stocke le caractère à l'adresse SI. On le modifie dans B, puis on le renvoie dans la RAM. | 

En sachant cela, on peut réécrire le programme en pseudo-code pour qu'il soit plus lisible
et simple:
```c
int size = 0, cursor = 0, cursorCopy = 0, currentChar = 0;
char* word = "\x05AabcF";

void maj() {
	size = word[cursor];
	while (true) {
		++cursor;
		cursorCopy = cursor;
		//Faire une copie du curseur est inutile, mais à cause des
		//instructions limités, nous n'avons pas le choix en assembleur.
		
		if ((size-cursorCopy) < 0) //si le curseur a atteint la taille du mot, ou l'a dépassé
			break;

		currentChar = word[size];
		if ((currentChar-'a')>=0) {
			currentChar -= 'a' - 'A';
			word[size] = currentChar;
		}
	}
}
```


<a id="maj-exp"></a>

### 4.2 Code expliqué
1. On retient la taille du mot (dans DI).
1. On regarde la lettre suivante *(à la première occurence, 1)*.
1. Si le numéro de la lettre à laquelle on regarde est égal à la taille du mot, on s'arrête. (Si on a finit de lire le mot.)
1. Si la lettre à laquelle on regarde est en minuscule (supérieure à 97)
	- on la met en majuscule (on soustrait 32 à son code ASCII)
1. On revient à l'étape 2.



<a id="maj-jeu"></a>

### 4.3 Jeu de test
Note: Dans le premier cas, un `'e'` a été rajouté. Puisqu'il est en dehors de la chaine,
vous remarquerez qu'il n'a pas été modifié.
| ASCII avant | ASCII après | Contenu RAM avant      | Contenu RAM après   |
|-------------|-------------|------------------------|---------------------|
| AbcdeF      | ABCDEF      | 5 41 62 63 64 65 46 65 | 5 42 43 44 45 46 65 |
| a           | A           | 61                     | 41                  |
| A           | A           | 41                     | 41                  |
|             |             | 0 0 0...               | 0 0 0...            |
| aa          | AA          | 61 61                  | 41 41               |
| aA          | AA          | 61 41                  | 41 41               |
| Aa          | AA          | 41 61                  | 41 41               |
| AA          | AA          | 41 41                  | 41 41               |