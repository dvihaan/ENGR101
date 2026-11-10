#include <iostream>
#include <string>
#include <vector>
#include <fstream>

# include "rover.h"

using namespace std;



// Driver program to select rovers for a mission
int main() {

  // ----- First, read in the rover data ----- //

  // Create an empty vector of rovers
  vector<Rover> fleet;

  // Create an input file stream to a file with rover data
  ifstream roversInput("rover_data.txt");

  // check if the file was opened; end program if not
  if(!roversInput.is_open()) {
    cout << "ERROR READING ROVERS DATA FILE" << endl;
    return 1;
  }

  // Load a set of rovers from a file into fleet
  loadRovers(fleet, roversInput);

  // Close the file
  roversInput.close();


  // ---- Test desirability helper function ---- //

  // Set the minimum value for the chargeNeeded
  double minimumChargeValue = 20;

  // Special Case: chargeNeeded = 5 watts (less than the minimum value)
  Rover testRover = {"Type", "test", 10, 5.0, false};

  // print info for the test Rover
  cout << endl;
  printRover(testRover,cout);
  cout << endl;

  // test case for desirability of test rover
  cout << "desirability of test rover: " ;
  cout << desirability(testRover, minimumChargeValue) << endl; // should print 0.5

  // General Case: chargeNeeded >= 20 watts
  cout << "desirability of eighth rover in fleet: " ;
  cout << desirability(fleet.at(7), minimumChargeValue) << endl; // should print 0.436242

  cout << "desirability of seventh rover in fleet: " ;
  cout << desirability(fleet.at(6), minimumChargeValue) << endl; // should print 3.25


  // More test cases!

  Rover testRover2 = {"Sample", "AAAA", 50, 25.3, false};

  printRover(testRover2, cout);
  cout << endl;
  cout << "desirability of testRover2 = " << desirability(testRover2, minimumChargeValue) << endl;

  for (size_t i = 0; i < fleet.size(); ++i) {
    if (fleet.at(i).id == "a110") {
      cout << "desirability of rover #a110 = " << desirability(fleet.at(i), minimumChargeValue) << endl;
    }
  }





}