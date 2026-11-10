#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include "rover.h"

using namespace std;

int main() {
  // 1. Load the rover data
  string filename;
  cout << "Enter the name of the file with the rover data: ";
  cin >> filename;

  ifstream roversInput(filename);
  if (!roversInput.is_open()) {
    cout << "ERROR READING ROVERS DATA FILE" << endl;
    return 1;
  }
  vector<Rover> fleet;
  loadRovers(fleet, roversInput);
  roversInput.close();

  // 2. Select the rovers for the mission
  double availableCharge;
  cout << "Enter the amount of charge at the base: ";
  cin >> availableCharge;
  double minimumChargeValue = 20;
  selectRovers(fleet, availableCharge, minimumChargeValue);

  // 3. Print the mission summary
  printSelections(fleet);
  return 0;
}
