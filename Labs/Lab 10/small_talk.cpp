#include <iostream> 
#include <string>

#include "suggestions.h"

using namespace std; 

// program to give you interesting suggestions on what to say in any situation!
int main() { 
  
  cout << "What situation are you in?" << endl;
  cout << "1. Trying to impress a new classmate" << endl;
  cout << "2. Avoiding an annoying family member" << endl;
  cout << "3. Impressing someone with your knowledge of the TV show Community" << endl;
  cout << "4. Accidentally joining your professor in the elevator" << endl;

  cout << "Enter a number: ";
  int number;
  cin >> number; 


  // make sure their number is one we can use
  while (number != 1 && number != 2 && number != 3 && number != 4) {
      cout << "Please enter 1, 2, 3, or 4" << endl;
      cin >> number;
  }

  cout << "What is the name of the person you are talking to?" << endl;
  string name;
  cin >> name;

  give_suggestion(number,name); 

  return 0; 
} 
