#ifndef __SHIPS_H__
#define __SHIPS_H__

#include <string>

struct Boat{
    // TODO: fill in the types for each member in the Boat struct.
    // Make sure the names correspond to those used in the printShips function!
    std::string name;
    std::string flag;
    double TEU;
    double speed;
};

// ============================================================================
// DO NOT MODIFY THE REST OF THIS FILE ========================================
// ============================================================================

void loadShips(std::vector<Boat> &boats, std::ifstream& boat_data);

bool checkOneShip(const Boat& boat);

void removeShips(std::vector<Boat> &boats);

void printShips(std::vector<Boat> &boats, std::ofstream& os);

#endif