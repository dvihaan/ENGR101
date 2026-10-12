function [kennel] = assignCage_buggy(kennel, name, type, stay)

% This function takes in a kennel, pet name, pet type, and length
% of stay in days. These values are entered into a cell 
% array and returned as a cage. Cages are added to the kennel 
% sequentially to create a column vector.
    
    % Create a cell array to represent a cage
    petCage = {name, type, stay};
    
    % Add the cage cell array to the kennel
    kennel = [kennel; petCage];

end
