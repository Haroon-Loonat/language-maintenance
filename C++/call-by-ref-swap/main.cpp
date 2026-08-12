#include <iostream>

using namespace std;

void swap(int &, int &);

int main() {

    // Variables
    int value1;
    int value2;

    // Prompt
    cout << "Enter 2 numbers to test" << endl;
    cin >> value1 >> value2;

    // Function Call
    swap(value1, value2);

    return 0;
}

// Swap function
void swap(int &a, int &b) {
    int temp = a;
    cout << "Old First value " << a << endl << "Old First value " << b << endl;
    a = b;
    b = temp;
    cout << "New First value " << a << endl << "New Second value " << b << endl;
}