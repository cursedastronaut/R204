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