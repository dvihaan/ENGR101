#include <iostream>

using namespace std;

int main() {
    
    cout << "Type your name and then press ENTER: ";
    string name;
    cin >> name;
    cout << "Hello, and welcome to C++ in ENGR 101, " << name << "!" << endl;

}

// Compile this program by typing this at the terminal:
//    g++ hello_and_welcome.cpp -o hello
// Then, run the program by typing this at the terminal: 
//    ./hello

