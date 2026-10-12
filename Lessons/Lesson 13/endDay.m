function [kennel, homeList] = endDay_buggy(day, kennel)
% Passes in a kennel and the day that is ending.
% Decreases the remaining days of stay by one.
% Removes any cage from the kennel with a value of zero for remaining days
% Returns an updated kennel and the names of pets that are going home.

    % Get the number of days remaining for the pets' stay
    numDays = cell2mat(kennel(:,3));

    % Decrease the number of days by 1 since it's the end of a day
    numDays = numDays - 1;

    % Update the length of stay values in the kennel cell array
    kennel(:,3) = num2cell(numDays);

    % Store the index of any cage with a stay of 0
    homeIndex = numDays == 0;

    % Index into the kennel's name column to find pets that went home
    homeList = kennel(homeIndex,1);

    % print out a message
    disp(strcat('----', day, '----'));
    disp("Pets that went home today: ")
    if isempty(homeList)
        disp("None")
    else
        disp(homeList{:})
    end

    % Remove the empty cages from the kennel
    kennel(homeIndex,:) = [];

    % Show the pets still at the kennel
    disp("Pets remaining at the kennel: ")
    disp(kennel)

end