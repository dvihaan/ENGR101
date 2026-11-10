#include <iostream>
#include <string>
#include <vector>
#include "rover.h"

using namespace std;

// Prints a Rover in the form:
// Speedy Rover #a238 has 45kg capacity and needs 35.2 Watts charge.
void printRover(const Rover &rover, ostream &output) {
  output << rover.type << " Rover #" << rover.id << " has " << rover.capacity
         << "kg capacity and needs " << rover.chargeNeeded << " Watts charge.";
}

// Prints every rover in the fleet, one per line.
void printFleet(const vector<Rover> &fleet, ostream &output) {
  for (size_t i = 0; i < fleet.size(); ++i) {
    printRover(fleet.at(i), output);
    output << endl;
  }
}

// Reads rovers (type id capacity chargeNeeded) from the input stream
// and adds them to the end of the fleet vector.
void loadRovers(vector<Rover> &fleet, istream &input) {
  Rover rover;
  while (input >> rover.type >> rover.id >> rover.capacity >> rover.chargeNeeded) {
    rover.isSelected = false;
    fleet.push_back(rover);
  }
}

// Returns capacity divided by the charge needed. If the charge needed
// is below minVal, minVal is used instead.
double desirability(const Rover &rover, double minVal) {
  double charge = rover.chargeNeeded;
  if (charge < minVal) {
    charge = minVal;
  }
  return rover.capacity / charge;
}

// Returns the index of the most desirable Rover in the
// given vector. If the vector is empty, returns -1.
int bestRover(const vector<Rover> &fleet, double availableCharge, double minVal) {
  // SPECIAL CASE: empty vector
  // a negative index indicates no "best rover" could be found
  if (fleet.empty()) {
    return -1;
  }

  // REGULAR CASE: we have some rovers to pick from
  // Start with no rover selected
  int bestInd = -1;

  // Traverse the vector
  for (size_t i = 0; i < fleet.size(); ++i) {
    // Calculate how much charge this rover needs
    double chargeNeeded = fleet.at(i).chargeNeeded;

    // if the rover has NOT been selected AND the charge
    // it needs is less than the available charge, consider
    // this rover to be a candidate for the "best rover"
    if (!fleet.at(i).isSelected && (chargeNeeded < availableCharge)) {
      // If we haven't found a candidate yet,
      // then this rover is now the "best rover"
      if (bestInd == -1) {
        bestInd = i;
      }
      // Otherwise, check whether this rover is better than the current best
      else if (desirability(fleet.at(i), minVal) > desirability(fleet.at(bestInd), minVal)) {
        bestInd = i;
      }
    }
  }
  return bestInd;
}

// Chooses the best rovers for the mission and marks them as selected.
void selectRovers(vector<Rover> &fleet, double availableCharge, double minVal) {
  while (availableCharge > 0) {
    int bestIndex = bestRover(fleet, availableCharge, minVal);
    if (bestIndex != -1) { // there was a rover found
      fleet.at(bestIndex).isSelected = true;
      availableCharge -= fleet.at(bestIndex).chargeNeeded;
    }
    else { // i.e. no rovers found
      return;
    }
  }
}

// Prints out a very minimal report about the rovers going on the mission.
void printSelections(const vector<Rover> &fleet) {
  // Count up the number of rovers selected and
  // calculate the total capacity.
  int numSelected = 0;
  int totalCapacity = 0;
  for (size_t i = 0; i < fleet.size(); ++i) {
    if (fleet[i].isSelected) {
      ++numSelected;
      totalCapacity += fleet[i].capacity;
    }
  }
  cout << numSelected << " rovers selected:" << endl;
  // Prints the information for the rovers that were selected
  for (size_t i = 0; i < fleet.size(); ++i) {
    if (fleet[i].isSelected) {
      printRover(fleet[i], cout); // print rover
      cout << endl;               // print newline
    }
  }
  cout << "Total capacity is " << totalCapacity << " kg." << endl;
}
