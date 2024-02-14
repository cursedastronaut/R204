# TP2 : Microprocesseurs (Réponses données)
## 1. Microprocesseurs élémentaire
**Sur combien de bits est codée une instruction?**
24 bits
**Sur combien de bits est codé le champ DATA ou adresse ?**
16 bits
**Quelles sont les positions, dans le code de l’instruction, des bits du champ DATA ou adresse (0 étant la position du bit de poids le plus faible) ?**
0-15

**Sur combien de bits est codé le code opératoire ?**
8 bits

**Quelles sont les positions dans le code de l’instruction, des bits du code opératoire (0 étant la position du bit de poids le plus faible) ?**
16-23

**Indiquez le rôle de chacun des bits du code opératoire**
| Position       | Nom        | Rôle                       |
|----------------|------------|----------------------------|
| Bit 0          | JMP        | Instruction de saut        |
| Bit 1          | Registre B | Registre de données        |
| Bit 2          | Registre A | Registre de données        |
| Bit 3          | MUX        | Multiplexeur               |
| Bit 4, 5, 6, 7 | ALU        | Unité logique arithmétique |

**__Sans utiliser la simulation, mais en analysant uniquement le code binaire de chaque instruction,__ donnez en assembleur le programme contenu dans la mémoire. Que fait ce programme ?**
| Mémoire Programme |  Assembleur                                   |
|-------------------|-----------------------------------------------|
| 14 0000           | I0<br>I1-1<br>NOP<br>NOP<br>NOP<br>NOP        |
| 12 000A           | I0<br>I1<br>NOP<br>NOP<br>NOP<br>I1 CMP 10    |
| 5C0000            | I0 + I1<br>NOT I1<br>NOP<br>NOP<br>NOP<br>NOP |
| 010002            | NOP<br>I0<br>NOP<br>NOP<br>NOP<br>I1          |

| Rôle du programme |
|-------------------|
|                   |