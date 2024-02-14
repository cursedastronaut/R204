# TP2 : Microprocesseurs (Réponses données)
## 1. Microprocesseurs élémentaire
### **1.1 Sur combien de bits est codée une instruction?**
24 bits
### **1.2 Sur combien de bits est codé le champ DATA ou adresse ?**
16 bits
### **1.3 Quelles sont les positions, dans le code de l’instruction, des bits du champ DATA ou adresse (0 étant la position du bit de poids le plus faible) ?**
0-15

### **1.4 Sur combien de bits est codé le code opératoire ?**
8 bits

### **1.5 Quelles sont les positions dans le code de l’instruction, des bits du code opératoire (0 étant la position du bit de poids le plus faible) ?**
16-23

### **1.6 Indiquez le rôle de chacun des bits du code opératoire**
| Position       | Nom        | Rôle                       |
|----------------|------------|----------------------------|
| Bit 0          | JMP        | Instruction de saut        |
| Bit 1          | Registre B | Activation de l'écriture dans le Registre de données |
| Bit 2          | Registre A | Activation de l'écriture dans le Registre de données |
| Bit 3          | MUX        | Sert à choisir entre DATA et Registre A pour l'entrée I0 de l'UAL (Multiplexeur) |
| Bit 4, 5, 6, 7 | ALU        | Unité Logique Arithmétique |

### **1.7 __Sans utiliser la simulation, mais en analysant uniquement le code binaire de chaque instruction,__ donnez en assembleur le programme contenu dans la mémoire. Que fait ce programme ?**
| Mémoire Programme |  Assembleur | Label, saut |
|-------------------|-------------|-------------|
| 14 0000           | LOAD_A #00  |             |
| 12 000A           | LOAD_B #10  |             |
| 5C 0000           | ADD_A_B     | boucle      |
| 01 0002           | JMP 2       | JMP boucle  |

| Rôle du programme                               |
|-------------------------------------------------|
| Calcule les multiples de 10 dans le registre A. |

### **1.8 Modifiez le programme contenu dans la mémoire pour avoir le résultat dans B au lieu de A.**
| Mémoire Programme |  Assembleur | Label, saut |
|-------------------|-------------|-------------|
| 14 000A           | LOAD_A #10  |             |
| 12 0000           | LOAD_B #00  |             |
| 5A 0000           | ADD_B_A     | boucle      |
| 01 0002           | JMP 2       | JMP boucle  |
### **1.9 Ecrire un programme qui charge dans le registre A une valeur de votre choix puis calcule dans le registre B son complément à 2 (complément à 1 + 1)**
| Mémoire Programme |  Assembleur   |
|-------------------|---------------|
| 14 00F0           | LOAD_A   #F0  |
| 1A 0000           | LOAD_B_A #00  |
| C2 0000           | NOT B         |
| 32 0000           | INC B         |

## 2. Microprocesseur avec sauts conditionnels 
### **2.1 Sur combien de bits est codée une instruction ?**
32 bits

### **2.2 Sur combien de bits est codé le code opératoire ?**
16 bits

### **2.3 Sur combien de bits est codé le champ DATA ou adresse ?**
16 bits

### **2.4 A quoi servent les 4 bits JMPZ, JMPNZ, JMPN, JMPPZ ?**
| Bit   | Nom complet         | Rôle |
|-------|---------------------|-------------------------------------------------------------------|
| JMPZ  | Jump if Zero        | Saute si le résultat de l'opération précédente est nul            |
| JMPNZ | Jump if NOT Zero    | Saute si le résultat de l'opération précédente n'est PAS nul      |
| JMPN  | Jump if negative    | Saute si le résultat de l'opération précédente est négatif        |
| JMPPZ | Jump if zero or >1  | Saute si le résultat de l'opération précédente est positif ou nul |

### **2.5 Donnez les codes binaires et hexa des instructions suivantes :**
Avec VVVV = valeur, AAAA = adresse.
| Instruction    | Code Binaire        | Code Hexa   |
|----------------|---------------------|-------------|
| NOP            | 0000 0000 X000 XXXX | 0x0000 0000 |
| LOAD_A #valeur | 0000 0001 0100 VVVV | 0x0014 VVVV |
| LOAD_B_A       | 0000 0001 1010 XXXX | 0x001A 0000 |
| MUL_A_B        | 0000 1000 1100 XXXX | 0x008C 0000 |
| DEC_B          | 0000 0100 X010 XXXX | 0x0042 0000 |
| JMP [label]    | 0000 0000 0001 AAAA | 0x0001 AAAA |
| JMPZ [label]   | 1000 0000 0000 AAAA | 0x0800 AAAA |
| JMPNZ [label]  | 0100 0000 0000 AAAA | 0x0400 AAAA |

### **2.6 En utilisant les instructions ci-dessus, écrire un programme qui charge dans le registre A la valeur 5 puis calcule sa factorielle. Vous donnerez 2 versions. La première version utilisera l’instruction JMPNZ. La deuxième version utilisera les instructions JMPZ et JMP. Ecrivez les codes hexa trouvés dans la mémoire puis testez à l’aide de simulations.**
#### 1ère version (JMPNZ)
| Adresse | Instruction Assembleur | Contenu mémoire |
|---------|------------------------|-----------------|
| 0001    | LOAD_B #5              | 0x0014 0101     |
| 0000    | LOAD_A #1              | 0x0014 0001     |
| 0002    | DEC_B (b)              | 0x008C 0000     |
| 0003    | MUL_A_B                | 0x0042 0000     |
| 0004    | JMPNZ (b)              | 0x0000 0011     |
| 0005    | NOP                    | 0x0000 0000     |
| 0006    | NOP (f)                | 0x0000 0000     |

#### 2ème version (JMPZ et JMP)
| Adresse | Instruction Assembleur | Contenu mémoire |
|---------|------------------------|-----------------|
| 0001    | LOAD_B #5              | 0x0014 0101     |
| 0000    | LOAD_A #1              | 0x0014 0001     |
| 0002    | DEC_B (b)              | 0x008C 0000     |
| 0003    | MUL_A_B                | 0x0042 0000     |
| 0004    | JMPZ (f)               | Unknown yet     |
| 0005    | JMP (b)                | Unknown yet     |
| 0006    | NOP (f)                | 0x0000 0000     |
