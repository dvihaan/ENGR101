#include <string>
#include <vector>
#include <iostream>
#include <fstream>

using namespace std;

// define a struct to hold a recipe
struct Recipe{
    string name;
    int prepTime;
    double servings;
    bool hasMeat;
};

// write a function to load in recipes from a file
void loadRecipes (vector <Recipe> &meals, ifstream &input) {
    Recipe recipeToAdd;
   
    while (input >> recipeToAdd.name >> recipeToAdd.prepTime >> recipeToAdd.servings >> recipeToAdd.hasMeat){

        meals.push_back(recipeToAdd);
        cout <<"Adding "<< recipeToAdd.name <<endl;

    }
}

int main(){
    // build the recipe book as a vector of vectors
    // create a chapter vector to hold the recipes for a specific pet type
    vector <Recipe> BirdFood;
    // open a filestream to read in the recipes 
    ifstream birdIn ("bird_recipes.txt");
    // use a function to load the recipes into the vector
    loadRecipes(BirdFood, birdIn);
    // close the filestream
    birdIn.close();

    // repeat for all chapters (pet types)
    vector <Recipe> CatFood;
    ifstream catIn ("cat_recipes.txt");
    loadRecipes(CatFood, catIn);
    catIn.close();


    vector <Recipe> ReptileFood;
    ifstream reptileIn ("reptile_recipes.txt");
    loadRecipes(ReptileFood, reptileIn);
    reptileIn.close();

    vector <Recipe> RodentFood;
    ifstream rodentIn ("rodent_recipes.txt");
    loadRecipes(RodentFood, rodentIn);
    rodentIn.close();

    // create a vector of vector of structs that will hold the chapters in the RecipeBook
    vector <vector <Recipe> > RecipeBook;
    // add each of the chapters to the RecipeBook using push_back()
    RecipeBook.push_back(BirdFood);
    RecipeBook.push_back(CatFood);
    RecipeBook.push_back(ReptileFood);
    RecipeBook.push_back(RodentFood);

    // print a message to the user telling them the names of the recipes are listed below
    cout << "The recipes contained in the recipe book are listed below." << endl;
    // print out the recipe names in grid formation followed by a blank line 
    for (int i = 0; i<RecipeBook.size(); ++i){
        for (int j = 0; j<RecipeBook.at(i).size(); ++j){
            cout <<RecipeBook.at(i).at(j).name << " ";// add in the correct code from lecture
        }
        cout << endl;
    }
    //print a message to the user telling them a grid representation of the recipes is shown next
    cout<<"Here is your tasklist for today. X means you don't need to prepare that recipe; numbers indicate how many batches of that recipe need to be prepped."<<endl;

    // print out the grid of Xs that represents the recipes in the recipe book
    for (int i = 0; i<RecipeBook.size(); ++i){
        for (int j = 0; j<RecipeBook.at(i).size(); ++j){
            cout << "X" << " ";
        }
    cout << endl;
    }




}
