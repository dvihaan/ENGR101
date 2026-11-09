#include <iostream>
#include <string>
#include <vector>


void loadDictionary(std::vector<std::string> &dictionary_words, std::istream &dictionary_stream);

bool containsWord(const std::vector<std::string> &dictionary_words, const std::string &word);
