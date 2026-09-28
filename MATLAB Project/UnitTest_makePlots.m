% ENGR 101 - Project 2: Siting a Wind Farm
% Sample code to test the makePlots function for Project 2

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

% Set some figure properties so that the summary figure looks nice
Fig1 = figure(1);
Fig1.Units = 'inches';
Fig1.Position = [0, 0, 10, 12.5]; 
Fig1.PaperPositionMode = 'manual';
Fig1.PaperPosition = [0, 0, 10, 12.5];

% Make the summary figure
makePlots(filenameWind, filenameWave, filenameBuoy, windSpeedMin, ...
    windSpeedMax, waveHeightMax);
