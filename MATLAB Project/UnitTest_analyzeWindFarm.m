% ENGR 101 - Project 2: Siting a Wind Farm
% Sample code to test the analyzeWindFarm function for Project 2

% Clear old data
clear
close all

% Filenames for data that changes
filenameWind = 'windSpeedTestCase.csv';
filenameWave = 'waveHeightTestCase.csv';
filenameBuoy = 'buoyTestCase.csv';
 
% Constraint limits
windSpeedMin = 2.5;             % Minimum wind speed (m/s)
windSpeedMax = 7.5;             % Maximum wind speed (m/s)
waveHeightMax = 5.5;            % Max sig wave height (m)
waveHeightRisk = 80;            % Max sig wave height risk (%)
deckHeight = 17.2;              % Height of deck above water (m)
 
% Analyze this location
[c1, c2, c3, c4, c5] = analyzeWindFarm(filenameWind, filenameWave, ...
    filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax, ...
    waveHeightRisk, deckHeight);
