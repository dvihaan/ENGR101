rovers = readtable('rover_data.csv');
rovers{:, 4} = '1';
rovers.location = 'home';
