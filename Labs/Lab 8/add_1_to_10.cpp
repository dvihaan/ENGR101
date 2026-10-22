#include <iostream>
using namespace std;

int main() {
    int n = 10; // number of times the for loop should be repeated
    int sum = 0; // initializing sum variable
    
    cout << "Calculating the sum of numbers from 1 to " << n << endl;
    
    for (int i = 1; i <= n; i++) { 
        sum += i; // adding the existing sum to the current i
        cout << "The value of i is: " << i << endl; 
    }

    cout << "The sum is: " << sum << endl; // correct sum should be 55

    return 0; // no other return variable
}