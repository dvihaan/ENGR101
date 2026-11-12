#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include "ships.h"

using namespace std;

int main(){

    vector<Boat> boats;

    ifstream originalShipData("cargo_ships.txt");
    loadShips(boats, originalShipData);
    originalShipData.close();

    removeShips(boats);

    ofstream savedShipData("referenceShips.txt");
    printShips(boats, savedShipData);
    savedShipData.close();

    int numberShips = boats.size();
    cout << "We found " << numberShips
         << " ships that match your criteria" << endl;
}
