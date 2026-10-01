% clear workspace and command window
clear; clc; close all;

% ------------------------------------------------------------------------
% Load wavefieldData.mat. This file contains all the data
load('wavefieldData.mat');

% Create the figure window
figure('Position', [10 10 900 500])

% ------------------------------------------------------------------------
% Graph 1: The Wave Field
% TODO: make the wave field

[X,Y] = meshgrid(x, y);
Z = 0.2.*cos(X).*cos(Y);
subplot(2, 2,[1;3]);
surf(X, Y, Z);

% Label the x, y, and z axes
xlabel('X Distance from origin (m)');
ylabel('Y Distance from origin (m)');
zlabel('topography (in 100ft)');

% Make the title
title('North Campus Wavefield');

% TODO: Set axes limits
xlim([0 20]);
ylim([0 20]);
zlim([-1 1]);

% ------------------------------------------------------------------------
% Graph 2: The Flight Trajectory
% TODO: run a simulation of a rocket's flight trajectory

x = 0:0.1:10;
y = 4*sin(x)+1;
z = -5*x.^2 + 50*x;
subplot(2, 2, [2]);
plot3(x, y, z);

% Label the x, y, and z axes, and make the title
xlabel('X Distance from origin (m)');
ylabel('Y Distance from origin (m)');
zlabel('topography (in 100ft)');
title('Rocket Trajectory');

% ------------------------------------------------------------------------
% Graph 3: The Landing Sites
% TODO: plot the landing positions of the rocket
zr = 0.2*cos(xr).*sin(yr);
subplot(2, 2, [4]);
scatter3(xr, yr, zr);

% Label the x, y, and z axes, and make the title
xlabel('X Distance from origin (m)');
ylabel('Y Distance from origin (m)');
zlabel('topography (in 100ft)');
title('Crash Sites');

% TODO: Set axes limits
xlim([0 20]);
ylim([0 20]);
zlim([0 0.5]);

% Save the figure as a .png file
print('wavefield_plots.png','-dpng');
