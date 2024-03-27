/*
* Universit� Paris Saclay (C) - Galaad Martineaux
* Le fichier main.cpp contient un programme principal C++ classique qui saisit 2 entiers puis appelle une fonction
* somme qui va retourner comme r�sultat la somme de ces 2 entiers. La particularit� de ce programme est que la
* fonction somme n�est pas �crite dans le fichier main.cpp mais dans un autre fichier et dans un autre langage (ici
* ASM x64) qui utilise une convention d�appel sp�cifique. C�est pourquoi il faut ajouter le qualificatif extern "C"
* lors de la d�claration de la fonction. 
*/
#include <iostream>
using namespace std;
extern "C" int somme(int a, int b);
int main()
{
	int a, b;
	cout << "Entrez un premier entier : "; cin >> a;
	cout << "Entrez un deuxieme entier : "; cin >> b;
	cout << a << " + " << b << " = " << somme(a, b) << endl;
	return 0;
}