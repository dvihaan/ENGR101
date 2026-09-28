function [picture, info] = cutCard(card,rowToCut)
    % This function takes in a pet info page as image and a row to cut 
    % the page to generate the two return objects as images.
    % The function returns are a picture of the pet and the textual
    % information about the pet.

    % Read in the card that is going to be cut to a variable called img
    img = imread(card);

    % Use the parameters to generate the picture output
    picture = img(1:rowToCut, :, :);

    % Use the parameters to generate the info output
    info = img(rowToCut:end, :, :);

end
