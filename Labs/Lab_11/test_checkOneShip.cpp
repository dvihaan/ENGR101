#include <iostream>
#include <vector>
#include <string>
#include "ships.h"

using namespace std;

// DRIVER PROGRAM FOR TESTING THE checkOneShip FUNCTION

int main(){

    // Declare variables that will be used in each test case
    Boat boatTestcase;
    bool actualResult;


    // ----------------- TESTING SPEED CRITERIA ------------------------//

    // Test Case: speed is too low
    boatTestcase.name = "test";
    boatTestcase.TEU = 4500;
    boatTestcase.speed = 2; // this speed is too low!
    boatTestcase.flag = "USA";

    // Should return false for speed too low
    actualResult = checkOneShip(boatTestcase);
    cout << "Test speed too low: expected 0, actual "
         << actualResult << endl;


    // Test Case: speed is okay
    boatTestcase.name = "test";
    boatTestcase.TEU = 4500;
    boatTestcase.speed = 17.4; // this speed is okay!
    boatTestcase.flag = "USA";

    // Should return true for speed being greater than 15 kts
    actualResult = checkOneShip(boatTestcase);
    cout << "Test speed is >15: expected 1, actual "
         << actualResult << endl;



    // ----------------- TESTING FLAG CRITERIA ------------------------//


    // Test Case: flag is wrong
    boatTestcase.name = "test";
    boatTestcase.TEU = 4500;
    boatTestcase.speed = 18;
    boatTestcase.flag = "Canada"; // flag is NOT "USA"

    // Should return false because the flag is not USA
    actualResult = checkOneShip(boatTestcase);
    cout << "Test flag criteria not met: expected 0, actual "
         << actualResult << endl;


    // Test Case: flag is okay
    boatTestcase.name = "test";
    boatTestcase.TEU = 4500;
    boatTestcase.speed = 18;
    boatTestcase.flag = "USA"; // flag is what we're looking for

    // Should return true because the flag is USA
    actualResult = checkOneShip(boatTestcase);
    cout << "Test flag criteria is met: expected 1, actual "
         << actualResult << endl;



    // ----------------- TESTING TEU CRITERIA ------------------------//


    // Test Case: number of TEUs too low
    boatTestcase.name = "test";
    boatTestcase.TEU = 10;      // not enough TEUs!
    boatTestcase.speed = 18;
    boatTestcase.flag = "USA";

    // Should return false because the number of TEUs is too low
    actualResult = checkOneShip(boatTestcase);
    cout << "Test number of TEUs too low: expected 0, actual "
         << actualResult << endl;


    // Test Case: number of TEUs is okay
    boatTestcase.name = "test";
    boatTestcase.TEU = 3870;   // number of TEUs is in range
    boatTestcase.speed = 18;
    boatTestcase.flag = "USA";

    // Should return true because the number of TEUs is in range
    actualResult = checkOneShip(boatTestcase);
    cout << "Test number of TEUs in range: expected 1, actual "
         << actualResult << endl;


    // Test Case: number of TEUs too high
    boatTestcase.name = "test";
    boatTestcase.TEU = 6000;   // number of TEUs is too high
    boatTestcase.speed = 18;
    boatTestcase.flag = "USA";

    // Should return false because the number of TEUs is too high
    actualResult = checkOneShip(boatTestcase);
    cout << "Test number of TEUs too high: expected 0, actual "
         << actualResult << endl;


    return 0;
}
