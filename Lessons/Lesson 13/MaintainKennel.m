clear
close all

% Create empty kennel vector
newKennel = [];

%% Add the initial set of cages

% pet 1
name = 'Jazz';
type = 'Mouse';
stay = 1;

newKennel = assignCage(newKennel,name,type,stay);


% pet 2
name = 'Mamie';
type = 'Dog';
stay = 6;

newKennel = assignCage(newKennel,name,type,stay);

% pet 3
name = 'Fritz';
type = 'Cat';
stay = 4;

newKennel = assignCage(newKennel,name,type,stay);

% pet 4
name4 = 'Travis';
type = 'Ferret';
stay = 2;

newKennel = assignCage(newKennel,name,type,stay);


%% Update information at the end of the day

newKennel = endDay('Monday',newKennel);


%% Add new pets that arrived today

name = 'Hobs';
type = 'Dog';
stay = 7;

newKennel = assignCage(newKennel,name,type,stay);

name = 'Sir Sings-a-Lot';
type = 'Parakeet';
stay = 15;

kennel = assignCage(newKennel,name,type,stay);

%% Another day has passed

newKennel = endDay('Tuesday',newKennel);





