#include <iostream> 
using namespace std; 

int main() {

  for (int i = 0; i < 5; ++i){
    cout << "Enter a number: ";
    double num;
    cin >> num;

    double total = 0;
    total += num;
  }

  cout << "The sum of the numbers is: " << total << endl;

}