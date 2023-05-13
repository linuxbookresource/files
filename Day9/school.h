#include <string>
using namespace std;

class Mycourse
{
private:
	string name;
	int credit;
public:
	Mycourse(string, int);
	int get_credit();
};