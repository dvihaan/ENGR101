%This script will read in the Info Cards and cut them as needed

clear;
close all;
%% First Patient card: Ember

%TODO: Write code to generate an image and info card for Ember
%First step: Create variables that hold the values to be passed to the 
%cutCard function 

%Second step: Capture the pet image and pet info as separate products
%of the cutCard function call by calling cutCard with the variables 
%created above

%Third step: Save the pet image and pet info as .jpg files using imwrite

%% Second Patient card: Sammy

%TODO: Write code to generate an image and info card for Sammy

petCard = 'Sammy.jpg';
border = 530;
[petPic, petInfo] = cutCard(petCard,border);

imwrite(petPic,'SammyPhoto.jpg');
imwrite(petInfo, 'SammyInfo.jpg');

%% Third Patient card: Meeka

%TODO: Write code to generate an image and info card for Meeka

petCard = 'Meeka.jpg';
border = 565;
[petPic, petInfo] = cutCard(petCard,border);

imwrite(petPic,'MeekaPhoto.jpg');
imwrite(petInfo, 'MeekaInfo.jpg');


%% Fourth Patient card: Harvey

%TODO: Add in code to create the image and info card for Harvey the snake 

petCard = 'Harvey.jpg';
border = 565;
[petPic, petInfo] = cutCard(petCard,border);

imwrite(petPic,'HarveyPhoto.jpg');
imwrite(petInfo, 'HarveyInfo.jpg');
