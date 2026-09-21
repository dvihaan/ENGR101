
clear
close all

% read in a sample image
wat_duck = imread('wat_duck.png');

% crop to just the duck
rowsToKeep = [50,400];
columnsToKeep = [300,600];
duck = crop_img(wat_duck,rowsToKeep,columnsToKeep);

% show the cropped image to see if the function worked correctly
imshow(duck);
