#ifndef ROVER_H
#define ROVER_H

#include <iostream>
#include <string>
#include <vector>

struct Rover {
  std::string type;    // e.g. "Light", "Big", "Speedy"
  std::string id;      // 4 alphanumeric characters
  int capacity;        // cargo capacity in kilograms
  double chargeNeeded; // in Watts (e.g. 35.2 or 297.1)
  bool isSelected;     // has it been selected for the mission?
};

// Prints a Rover to the given output stream (no trailing newline) in the form:
// Speedy Rover #a238 has 45kg capacity and needs 35.2 Watts charge.
void printRover(const Rover &rover, std::ostream &output);

// Prints every rover in the fleet, one per line.
void printFleet(const std::vector<Rover> &fleet, std::ostream &output);

// Reads rover data (type id capacity chargeNeeded) from the stream into fleet.
void loadRovers(std::vector<Rover> &fleet, std::istream &input);

// Score of "how good" a rover is: capacity per unit of charge needed.
double desirability(const Rover &rover, double minVal);

// Index of the most desirable unselected rover that can be charged, or -1.
int bestRover(const std::vector<Rover> &fleet, double availableCharge, double minVal);

// Marks the best set of rovers as selected.
void selectRovers(std::vector<Rover> &fleet, double availableCharge, double minVal);

// Prints a short report about the selected rovers.
void printSelections(const std::vector<Rover> &fleet);

#endif
