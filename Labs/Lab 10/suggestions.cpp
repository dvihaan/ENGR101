#include <iostream> 
#include <string>

#include "suggestions.h"

using namespace std; 

void give_suggestion(int situation, string name) {

  // print instructions to the user
  cout << "Here's something you can say in your situation with " << name << ":" << endl;

  if (situation == 1) {
    cout << "\"I LOVE staying on top of my work. How early do you like to start assignments?\"" << endl;
  }
  else if (situation == 2) {
    cout << "\"Did you know that you have something stuck in your teeth? You should go check that out in the bathroom.\"" << endl;
  }
  else if (situation == 3) {
    cout << "\"I love the scene where Jeff and the Dean do karaoke. Do you want to sing with me? \u001b[48;5;223m\U0001F3B6\u001b[0m Therrrrrrre used to be a graying TOWer... \u001b[48;5;223m\U0001F3B6\u001b[0m\"" << endl;
  }
  else if (situation == 4) {
    cout << "\".......\" [Don't worry, they probably don't want to talk with you either. Just get out your phone and pretend to be checking Piazza. They'll be pretending to be on their phone, too, so you can be awkward together.]" << endl;
  }


}
