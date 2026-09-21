%{
Create a new script file named CropMap.m
Clear any old data (clear) and close any open figures (close all)
Read in the lake_temps.png file
Call the crop_img function to crop the original 3D array to an array that just represents Lake Superior (Rows 15-300, Columns 5-510)
Write the cropped 3D array to a file called superior_temps.png
Call the crop_img function again, but with new arguments, to crop the original 3D array to an array that just represents Lake Michigan (Rows 300-700, Columns 250-490)
Write this cropped 3D array to a file called michigan_temps.png
%}
img = imread('lake_temps.png');

croppedSuperior = crop_img(img, [15, 300], [5, 510]);
croppedMichigan = crop_img(img, [300, 700], [250, 490]);

imwrite(croppedSuperior, 'superior_temps.png');
imwrite(croppedMichigan, 'michigan_temps.png');
