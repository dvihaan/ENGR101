#include <iostream> 
#include <cmath>     //allows you to use functions such as sin, cos, tan, pow, etc. 
using namespace std; 

// global constants to be used in this program
const double PI = 3.14159; 
const double GRAVITY = 9.81; // gravitational acceleration in m/s^2


// function to determine the distance the snowball was catapulted
// TODO: write your launch_distance function here
double launch_distance(double launch_speed, double launch_angle, double wind_speed) {
  double angle = launch_angle * PI / 180.0;
  double d1 = pow(launch_speed, 2) * sin(2*angle)/GRAVITY;
  double d2 = 2*wind_speed*launch_speed*sin(angle)/GRAVITY;
  double totalDist = d1 + d2;
  return totalDist;
}


// function to print a summary of the tests
void printResults(double launch_speed, double launch_angle, double wind_speed, double distance){
  cout << "For these launch settings: " << endl;
  cout << "   speed = "  << launch_speed << endl;
  cout << "   angle = "  << launch_angle << endl;
  cout << "   wind speed = "  << wind_speed << endl;
  cout << "The distance traveled was " << distance << endl;
  cout << endl;
}


// Main program
// Tests the launch_distance function
int main() 
{ 
  // Declare variables (we don't need to initialize them because we're going to 
  // assign them values in the test cases that follow)
  double speed; 
  double angle ;
  double windForwardCatapult;
  double dist = launch_distance(speed, angle, windForwardCatapult);


  // Test 1
  speed = 150.0; 
  angle = 45.0;
  windForwardCatapult = 17.5;
  dist = launch_distance(speed, angle, windForwardCatapult);
  printResults(speed, angle, windForwardCatapult,dist);

  // Test 2
  speed = 265.4; 
  angle = 32.9;
  windForwardCatapult = 8.1;
  dist = launch_distance(speed, angle, windForwardCatapult);
  printResults(speed, angle, windForwardCatapult,dist);

  // Test 3
  speed = 74.2; 
  angle = 56.8;
  windForwardCatapult = 8.1;
  dist = launch_distance(speed, angle, windForwardCatapult);
  printResults(speed, angle, windForwardCatapult,dist);

  return 0; 
} 
