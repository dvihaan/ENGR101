#include <iostream>
#include <string>
using namespace std;

int main() {
    string professor;
    int wait_time_at_panda;

    int time_StampsToPanda = 2;
    int time_PandaToBusStop = 3;
    int time_StampsToBusStop = 5;
    int totalTime;

    cout << "What is the last name of your professor? ";
    cin >> professor;

    cout << "How long did your friend say the wait was at Panda Express? ";
    cin >> wait_time_at_panda;

    totalTime = time_StampsToPanda + wait_time_at_panda + time_PandaToBusStop;

    cout << endl;
    cout << "Lecture with Professor " << professor << " in Stamps Auditorium is done!" << endl;
    cout << "It will take " << totalTime << " minutes to get to the bus if you stop at Panda Express." << endl;
    cout << "It will take " << time_StampsToBusStop << " minutes if you do not stop at Panda Express." << endl;

    return 0;
}