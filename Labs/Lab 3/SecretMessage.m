
clear 
close all


% reveal a secret message

% read in the original image
img1 = imread('cat1.png');
figure(1)
imshow(img1);

% read in the modified image
img2 = imread('cat2.png');

% call the reveal function to show the secret message 
[newImg] = reveal(img1, img2);

% show the secret message version of the image
figure(2);
imshow(newImg);


% provide alt text for the message
% TODO: Change <NUMBER> to be the number that is revealed once you get
% the function debugged, and change <WORD> to be the word that is
% revealed.
alt_text = strcat("There are two pieces of information: " , ...
        "In white text (brightness = 255) is the number 101600. ", ...
        "In black text (brightness = 0) is the word 'daisy'.");

disp(alt_text);
