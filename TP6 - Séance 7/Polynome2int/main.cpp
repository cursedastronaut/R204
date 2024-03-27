/*
* Universit� Paris Saclay (C) - IUT d'Orsay - Galaad Martineaux
* 
* Ce programme permet de calculer la valeur d�un polyn�me de second degr� a*n2+b*n+c pour des valeurs enti�res
* donn�es de a, b, c et n.
* 
* Le programme C++ principal s�occupe de saisir les valeurs de a, b, c et n puis appelle la fonction polynome2int
* (�crite en ASM x64) qui calcule la valeur du polyn�me et retourne le r�sultat. Le programme principal affiche alors
* ce r�sultat. 
* 
* Comme on peut le voir ici le programme principal a besoin de passer 4 param�tres � la fonction assembleur. Lors
* de l�appel, les param�tres a, b, c et n sont pass�s automatiquement et respectivement � travers les registres RCX,
* RDX, R8 et R9. Le r�sultat est r�cup�r� � travers le registre RAX. En effet le programme principal utilise des
* variables de type long long int c�est-�-dire de 64 bits (voir le tableau dans la section 2 pour savoir quels registres
* sont utilis�s pour passer des param�tres entiers de 64 bits). 
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