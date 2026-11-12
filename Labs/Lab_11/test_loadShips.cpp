#include <iostream>
#include <vector>
#include <fstream>
#include "ships.h"

using namespace std;

int main() {

  vector <Boat> boats;
  string filename = "cargo_ships.txt";
  ifstream boat_data(filename);
  loadShips(boats, boat_data);
  boat_data.close();

  ofstream boats_out("test_ships.txt");
  printShips(boats,boats_out);
  boats_out.close();


  // additional test case with different number of ships

  vector <Boat> boats2;
  string filename2 = "cargo_ships_2.txt";
  ifstream boat_data2(filename2);
  loadShips(boats2, boat_data2);
  boat_data2.close();

  ofstream boats_out2("test_ships_2.txt");
  printShips(boats2,boats_out2);
  boats_out2.close();


}