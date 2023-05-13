#include <string>
#include "school.h"
using namespace std;

Mycourse::Mycourse(string name, int credit)
{
	this->name = name;
	this->credit = credit;
}

int Mycourse::get_credit()
{
	return credit;
}