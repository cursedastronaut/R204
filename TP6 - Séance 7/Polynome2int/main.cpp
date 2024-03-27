/*
* Université Paris Saclay (C) - IUT d'Orsay - Galaad Martineaux
* 
* Ce programme permet de calculer la valeur d’un polynôme de second degré a*n2+b*n+c pour des valeurs entières
* données de a, b, c et n.
* 
* Le programme C++ principal s’occupe de saisir les valeurs de a, b, c et n puis appelle la fonction polynome2int
* (écrite en ASM x64) qui calcule la valeur du polynôme et retourne le résultat. Le programme principal affiche alors
* ce résultat. 
* 
* Comme on peut le voir ici le programme principal a besoin de passer 4 paramètres à la fonction assembleur. Lors
* de l’appel, les paramètres a, b, c et n sont passés automatiquement et respectivement à travers les registres RCX,
* RDX, R8 et R9. Le résultat est récupéré à travers le registre RAX. En effet le programme principal utilise des
* variables de type long long int c’est-à-dire de 64 bits (voir le tableau dans la section 2 pour savoir quels registres
* sont utilisés pour passer des paramètres entiers de 64 bits). 
*/

#include <iostream>
using namespace std;
extern "C" long long polynome2int(long long a, long long b, long long c, long long n);
int main()
{
	long long a, b, c, n;
	cout << endl << "Ce programme sert a calculer la valeur d'un polynome entier de second degre a * n ^ 2 + b * n + c" << endl << endl;
		cout << "Entrez une valeur entiere pour a : "; cin >> a;
	cout << "Entrez une valeur entiere pour b : "; cin >> b;
	cout << "Entrez une valeur entiere pour c : "; cin >> c;
	cout << "Entrez une valeur entiere pour n : "; cin >> n;
	cout << endl << "Pour n = " << n << " : " << a << "*n^2 + " << b << "*n + " << c
		<< " = " << polynome2int(a, b, c, n) << endl;
	return 0;
}