#include <iostream>
#include <vector>
#include <fstream>
#include "ships.h"

using namespace std;


// DRIVER PROGRAM FOR TESTING THE removeShips FUNCTION

int main() {

  // First, create a ship that is "good" (and meets all the criteria)
  Boat boat1;
  boat1.name = "test";
  boat1.TEU = 4500;
  boat1.speed = 18;   // TODO: pick a speed that is in range
  boat1.flag = "USA";

  // Now, create a ship that is "bad" (at least one criteria is not met)
  Boat boat2;
  boat2.name = "test";
  boat2.TEU = 4500;
  boat2.speed = 10;   // TODO: pick a speed that is too low
  boat2.flag = "USA";

  // Create a vector of the two ships
  vector <Boat> boats;
  boats.push_back(boat1); // TODO: add the first ship to the vector
  boats.push_back(boat2); // TODO: add the second ship to the vector

  // Call the function to remove all the ships that don't meet all the criteria
  removeShips(boats);

  // Create an output stream connected to a file.
  // We will save the "good ships" to this file.
  ofstream boats_out("test_good_ships.txt");

  // Call the printShips helper function to print out the info for all the remaining "good ships"
  printShips(boats,boats_out);

  // Close the file
  boats_out.close();

  // After this program runs, check the test_good_ships.txt file. 
  // It should only have one ship in it: the first ship listed above.

}