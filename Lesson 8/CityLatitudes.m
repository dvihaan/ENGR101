clear
close all

%% Obtain cities data

% read in from file
[num, txt, raw] = xlsread('cities.xlsx');

% extract parallel vectors
names = txt(2:end,1);
pop = num(:,1);
lat = num(:,2);
lon = num(:,3);


%% Calculate some basic stastics of the latitude data

[maxLat, iMaxLat] = max(lat);        % find the max latitude
[minLat, iMinLat] = min(lat);        % find the min latitude
meanLat = mean(lat);                 % find the mean latitude
medianLat = median(lat);             % find the median latitude
modeLat = mode(lat);                 % find the mode of the latitudes
freqModeLat = sum(lat == modeLat);   % find how many times the mode occurs
varLat = var(lat);                   % find the variance of the latitudes
stdLat = std(lat);                   % find the standard deviation of the latitudes

disp(['The most northern city is ' names{iMaxLat} ' (' num2str(maxLat) ' deg)']);
disp(['The most southern city is ' names{iMinLat} ' (' num2str(minLat) ' deg)']);
disp(['The mean latitude is ' num2str(meanLat) ' deg']);
disp(['The median latitude is ' num2str(medianLat) ' deg']);
disp(['The mode latitude is ' num2str(modeLat) ' deg']);
disp(['The variance of the latitude is ' num2str(varLat) ' deg^2']);
disp(['The standard deviation of the latitude is ' num2str(stdLat) ' deg']);