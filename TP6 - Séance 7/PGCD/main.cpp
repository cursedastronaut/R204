/*
* Université Paris-Saclay (C) - IUT d'Orsay - Galaad Martineaux
* 
* Ce programma calcule le PGCD (Plus Grand Commun Diviseur) et
* le PPCM (Plus Petit Diviseur Multiple) entre deux nombres
* entrés par l'utilisateur.
* 
* Le code des fonctions pgcd et ppcm se trouve dans pgcd-ppcm.asm
* et est en x64 pour MASM.
*/
#include <iostream>

using namespace std;
extern "C" int32_t pgcd(int32_t a, int32_t b);
extern "C" int16_t ppcm(int16_t a, int16_t b);
int main()
{
	int32_t a, b;
	cout << endl << "Ce programme sert a calculer le PGCD entre deux nombres." << endl << endl;
	cout << "Entrez une valeur entiere pour a : "; cin >> a;
	cout << "Entrez une valeur entiere pour b : "; cin >> b;
	cout << endl << "Pour a = " << a << " et b = " << b << endl << "Le plus grand diviseur commun est " << pgcd(a, b) << endl;

	int16_t a2, b2;
	cout << endl << "Ce programme sert a calculer le PGCD entre deux nombres." << endl << endl;
	cout << "Entrez une valeur entiere pour a : "; cin >> a2;
	cout << "Entrez une valeur entiere pour b : "; cin >> b2;
	cout << endl << "Pour a = " << a << " et b = " << b << endl << "Le plus petit diviseur multiple est " << ppcm(a2, b2) << endl;


	return 0;
}