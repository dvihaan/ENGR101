#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include "word.h"

using namespace std;


int main() {

  vector<string> dictionary_words;

  ifstream dictionary_stream("words.txt");

  if (!dictionary_stream.is_open()) {
    cout << "The words.txt file could not be found. Program ending." << endl;
    return 1;
  }

  loadDictionary(dictionary_words, dictionary_stream);

  dictionary_stream.close();

  ifstream essay_stream("essay.txt");

  if (!essay_stream.is_open()) {
    cout << "The essay.txt file could not be found. Program ending." << endl;
    return 1;
  }

  ofstream checked_stream("essay_checked.txt");

  string word;

  while (essay_stream >> word) {
    if (containsWord(dictionary_words, word)) {
      checked_stream << word << " ";
    }
    else {
      checked_stream << "*" << word << "* ";
    }
  }

  essay_stream.close();

  checked_stream.close();

  cout << "Spellchecking finished!" << endl;
  cout << "Check essay_checked.txt for results." << endl;

  return 0;

}
