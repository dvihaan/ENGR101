#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

// Create a struct, Course, with information from Atlas scheduling tool
struct Course{
    string id; // The course code, with department and course number
    int credits; // The number of credits the course is worth
    string median_grade; // The median letter grade received in the course
    double workload; // The percentage of students (in decimal form) rating the course as more workload than typical
    double understanding; // The percentage of students (in decimal form) rating the course as increasing their understanding
    bool selected; // A boolean representing whether the course has been selected already
};

// Load the courses from the course catalog file into a vector of possible courses we could add to the schedule
void loadCourses(vector<Course> &catalog, istream &courseStream){

    // Create a new course variable
    Course course;

    // Mark the course as not selected yet
    course.selected = false;

    // Fill the course variable with information from the istream
    while(courseStream >> course.id >> course.credits >> course.median_grade >> course.workload >> course.understanding){
        // Add the course to the catalog vector
        catalog.push_back(course);
    }

}

// print the course catalog; may be helpful in debugging
void printCourses(vector<Course> &catalog){
    cout << "Index    ID   Credits   Selected" << endl;
    for (int i = 0; i < catalog.size(); ++i) {
        cout << i << "  ";
        cout << catalog.at(i).id << "  " ;
        cout << catalog.at(i).credits << "  " ;
        cout << catalog.at(i).selected << "  " ;
        cout << endl;
    }
    cout << endl;
}



int main(){

    // set seed for debugging: this will generate the same schedule each time
    // comment this out when you have finished debugging the program
    // srand(1);

    // set seed for random schedule generation each time the program is run
    // uncomment this line when you have finished debugging
    srand (time(NULL));

    // Establish an ifstream
    ifstream courseData("courseCatalog.txt");
    vector<Course> catalog;

    // Load the courses into a vector
    loadCourses(catalog, courseData);

    //printCourses(catalog);

    // Initialize variables that we'll want to use throughout the program
    int numClasses = 0;
    int total_credits = 0;
    double total_workload = 0;
    double average_workload = 0;

    bool scheduleOkay = false;

    // Continue to add classes until the generated schedule meets the criteria
    while(!scheduleOkay){

        // Generate a random index to select from the course catalog
        int rand_index = rand() % catalog.size();

        // If the course has not been selected, then add it to the schedule
        if (!catalog.at(rand_index).selected) {
            catalog.at(rand_index).selected = true;
        }

        // and update running totals and average workload
        numClasses = 0;
        total_credits = 0;
        total_workload = 0.0;
        for (int i = 0; i < catalog.size(); ++i) {
            if (catalog.at(i).selected){
                numClasses++; 
                total_credits += catalog.at(i).credits;
                total_workload += catalog.at(i).workload;
                
            }
        }
        average_workload = total_workload / numClasses;


        // Check the schedule criteria

        // First criteria: must have at least 12 credits
        if (total_credits < 12) {
            continue; // need to add another class
        } 
        // Second criteria: must have no more than 16 credits
        else if (total_credits > 16) {
            // oops, can't have this class because it puts us over the limit of credits
            catalog.at(rand_index).selected = false; 
        }
        // Third criteria: must have average workload of no more than 40%
        else if (average_workload > 0.40) {
            // oops, can't have this class because it puts us over the limit of average workload
            catalog.at(rand_index).selected = false;  
        }
        // If we made it this far, the schedule is good!
        else {
            scheduleOkay = true;
        }
    }


    // Once the schedule is complete, print the courses and their credits
    cout << "Number of Classes: " << numClasses << endl;
    cout << "Total credits: " << total_credits << endl;
    cout << "Average Workload: " << average_workload << endl;
    cout << "Schedule: " << endl;
    for (int i = 0; i < catalog.size(); ++i) {
        if (catalog.at(i).selected){
            cout << "  " << catalog.at(i).id << " ";
            cout << "  " << catalog.at(i).credits << endl;
        }
    }

}