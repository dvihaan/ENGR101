#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "word.h"

using namespace std;


int main() {


  // ----------- test loadDictionary function --------------//

  // create vector to hold dictionary words
  vector<string> dictionary;

  // open filestream to words file
  ifstream dictionaryFile("words.txt");

  // call function to "fill up" the dictionary vector
  loadDictionary(dictionary, dictionaryFile);

  // check the size of the vector; if there are 58,112 elements,  
  // then the function is very likely working correctly
  if( dictionary.size() == 58112 ) {
    cout << "loadDictionary function is working properly!" << endl;
  } else {
    cout << "loadDictionary function is NOT working properly, try debugging it further" << endl;
  }


  // ----------- test containsWord -------------------------//

  // We don't want this test to be contingent on loadDictionary working correctly,
  // so make a short vector of words to use to test containsWord
  vector<string> random_words;
  random_words.push_back("flimflam");
  random_words.push_back("humdrum");
  random_words.push_back("snickerdoodle");
  // the random_words vector now has three elements

  // We need to check for two different types of correct behavior: 
  //   1. The function returns "true" if a word is in the vector
  //   2. The function returns "false" if a word is NOT in the vector
  
  // Check for Condition 1 first
  if ( containsWord(random_words, "snickerdoodle") ) {

    // Now check for Condition 2  
    if (!containsWord(random_words, "hullabaloo") ) {
      cout << "containsWord function is working properly!" << endl;
    } else {
      cout << "error: containsWord found a word that it should not have" << endl;
    }
  
  } else {
      cout << "error: containsWord did not find a word that it should have" << endl;
  }

}