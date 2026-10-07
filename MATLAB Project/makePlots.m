% Vihaan Das  
% 126
% 10/06/2026

%------------------------------------------------------
% AUTOGRADER INFO -- IGNORE BUT DO NOT REMOVE 
% test_cases: true
% feedback('all')
% 4d56ac82-3232-4493-bb2f-f76ce9e60751
%------------------------------------------------------


function [ ] = makePlots( filenameWind, filenameWave, filenameBuoy, ...
    windSpeedMin, windSpeedMax, waveHeightMax )

%   Function to complete Task 2. Creates a figure with multiple plots that 
%   summarizes the environmental conditions for a wind farm.  Saves figure as 
%   a .png file.
%
%   parameters: 
%          filenameWind: a string that names the file containing the 
%                        global-model-based average wind speed 
%                        (i.e. 'windSpeedTestCase.csv')
%          filenameWave: a string that names the file containing the 
%                        global-model-based average global wave heights 
%                        (i.e. 'waveHeightTestCase.csv')
%          filenameBuoy: a string that names the file containing the time 
%                        series of wave heights measured by the buoy          
%                        (i.e. 'buoyTestCase.csv')
%          windSpeedMin: for constraint 1 -- minimum wind speed (m/s)
%          windSpeedMax: for constraint 1 -- maximum wind speed (m/s)
%         waveHeightMax: for constraint 2 -- maximum wave height (m)
%
%   return values: none
%
%   notes:
%       Feel free to use different variable names than these if it makes 
%       your code more readable to you.  These are internal to your 
%       function, so it doesn't matter what you call them.

%% load data
lat = csvread('lat.csv');
lon = csvread('lon.csv');
windData = csvread(filenameWind);
waveData = csvread(filenameWave);
buoyLoc = csvread(filenameBuoy, 1, 0, [1, 0, 1, 3]);
buoyData = csvread(filenameBuoy, 5, 0);

%% Make Plots

figure(1);
set(gcf, 'Units', 'inches');
set(gcf, 'Position', [0, 0, 10, 12.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0, 0, 10, 12.5]);

% Plot 1: global wind map
subplot(3,2,1);
contourf(lon, lat, windData, 'LineStyle', 'none');
colormap(gca, parula);
colorbar;
xlabel('longitude (deg)');
ylabel('latitude (deg)');
title('Average Wind Speed (m/s) Across Planet');

% Plot 2: global wave map
subplot(3,2,2);
contourf(lon, lat, waveData, 'LineStyle', 'none');
colormap(gca, parula);
colorbar;
xlabel('longitude (deg)');
ylabel('latitude (deg)');
title('Average Wave Height (m) Across Planet');

% Plot 3: possible wind farm locations based on constraints 1 & 2
subplot(3,2,3);
validLocations = (windData >= windSpeedMin) & (windData <= windSpeedMax) & ...
    (waveData < waveHeightMax);
contourf(lon, lat, validLocations, 'LineStyle', 'none');
colormap(gca, flipud(gray));
hold on;
scatter(lon(buoyLoc(3)), lat(buoyLoc(2)), 'Parent', gca, 'Marker', 's', ...
    'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'none', 'LineWidth', 3, 'SizeData', 200);
hold off;
xlabel('longitude (deg)');
ylabel('latitude (deg)');
title('Potential Wind Farm Locations');

% Plot 4: histogram of buoy wave heights
subplot(3,2,4);
histogram(buoyData(:,2));
grid on;
xlabel('wave height (m)');
ylabel('number of occurrences');
title('Wave Heights at Buoy Location');

% Plot 5: buoy vs global average wave height vs time
subplot(3,2,[5 6]);
localWaveHeight = waveData(buoyLoc(2), buoyLoc(3));
plot(buoyData(:,1), buoyData(:,2));
hold on;
plot(buoyData(:,1), ones(size(buoyData(:,1))) * localWaveHeight);
hold off;
legend('Buoy-measured', 'Global average', 'Location', 'northeast');
xlabel('time (hours)');
ylabel('wave height (m)');
title('Wave Height Comparison: Global to Local');
grid on;

print(gcf, '-dpng', 'environmentalSummary.png');

end

