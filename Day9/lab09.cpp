#include <iostream>
#include "school.h"
using namespace std;

int main()
{
	Mycourse c1("C151", 3);
	Mycourse c2("C201", 4);
	Mycourse c3("C243", 4);

	int total = c1.get_credit() + c2.get_credit() + c3.get_credit();
	cout << "I am taking " << total << " credits this semester!";
	return 1;
}