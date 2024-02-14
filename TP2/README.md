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
| Mémoire Programme |  Assembleur | Label, saut |
|-------------------|-------------|-------------|
| 14 000A           | LOAD_A #FF  |             |
| 12 0000           | LOAD_B #00  |             |
| 5A 0000           | ADD_B_A     | boucle      |
| 01 0002           | JMP 2       | JMP boucle  |