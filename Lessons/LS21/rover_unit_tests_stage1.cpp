#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include "rover.h"

using namespace std;

// Driver program to test loadRovers / printFleet / printRover
int main() {
  vector<Rover> fleet;

  ifstream roversInput("rover_data.txt");
  if (!roversInput.is_open()) {
    cout << "ERROR READING ROVERS DATA FILE" << endl;
    return 1;
  }
  loadRovers(fleet, roversInput);
  roversInput.close();

  ofstream roversOutput("test_rovers.txt");
  printFleet(fleet, roversOutput);
  roversOutput.close();
  return 0;
}
