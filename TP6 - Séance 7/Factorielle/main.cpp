#include <iostream>

using namespace std;
extern "C" long long factorielle(long long a);
int main()
{
	long long a;
	cout << endl << "Ce programme sert a calculer la factorielle d'un nombre" << endl << endl;
	cout << "Entrez une valeur entiere pour n : "; cin >> a;
	cout << endl << "Pour n = " << a << " : La factorielle de n vaut " << factorielle(a) << endl;
	return 0;
}