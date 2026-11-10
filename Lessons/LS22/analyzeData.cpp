#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <string>

#include "analyzeData.h"

using namespace std;

// read data from an input stream into a vector of vectors
void loadData(vector<vector<int> > &vec2, istream &input)
{
	// Note: vec2 represents a rectangular matrix of empty elements

	// The number of "rows" is the size of the outer vector, vec2
	int numRows = vec2.size();

	// The number of "columns" is the size of one of the inner vectors; 
	// all of the inner vectors have the same size (since vec2 is modeling
	// a rectangular matrix), so we can use any inner vector we want to
	// get the number of the columns. Let's use the first inner vector.  
	int numCols = vec2.at(0).size();

	// TODO: implement the rest of the function to read in the data 
	// using the >> operator and store each data point in an element of the 
	// vector of vectors.
	// Hint: use nested "for" loops to access each empty element

	// temporary variable to hold each value read from the stream
	int temp;

	// loop on outer vector (rows)
	for (int i = 0; i < numRows; ++i)
	{
		// loop on inner vector (columns)
		for (int k = 0; k < numCols; ++k)
		{
			input >> temp;
			vec2.at(i).at(k) = temp;
		}
	}
}

// calculates the sum of each row
void sumOfRows(const vector<vector<int> > &data, vector<int> &row_sums)
{
	// loop on outer vector: one row at a time
	for (int i = 0; i < data.size(); ++i)
	{
		int total = 0; // accumulator for this row

		// loop on inner vector: every column in this row
		for (int k = 0; k < data.at(i).size(); ++k)
		{
			total += data.at(i).at(k);
		}

		row_sums.at(i) = total;
	}
}

// calculates the sum of each column
void sumOfCols(const vector<vector<int> > &data, vector<int> &col_sums)
{
	// nothing to add up if there are no rows
	if (data.size() == 0)
	{
		return;
	}

	// loop on inner vector: one column at a time
	for (int k = 0; k < data.at(0).size(); ++k)
	{
		int total = 0; // accumulator for this column

		// loop on outer vector: every row in this column
		for (int i = 0; i < data.size(); ++i)
		{
			total += data.at(i).at(k);
		}

		col_sums.at(k) = total;
	}
}

// calculates the sum of a vector of vectors of ints
int sum(const vector<vector<int> > &vec2)
{
	int total = 0; // accumulator for all elements

	// loop on outer vector: one row at a time
	for (int i = 0; i < vec2.size(); ++i)
	{
		// loop on inner vector: every column in this row
		for (int k = 0; k < vec2.at(i).size(); ++k)
		{
			total += vec2.at(i).at(k);
		}
	}

	return total;
}

// prints a vector of vectors of ints
void printVecOfVecs(const vector<vector<int> > &vecs)
{
	for (int i = 0; i < vecs.size(); ++i)
	{
		cout << "{ ";
		for (int k = 0; k < vecs.at(i).size(); ++k)
		{
			cout << vecs.at(i).at(k) << " ";
		}
		cout << "}" << endl;
	}
}

// print a vector of ints
void printVecOfInts(const vector<int> &vec)
{
	cout << "{ ";
	for (int k = 0; k < vec.size(); ++k)
	{
		cout << vec.at(k) << " ";
	}
	cout << "}" << endl;
}
