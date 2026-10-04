% Optimize damping ratio and natural frequency
clear
close all

% Damping ratio range: 
% Use a start value of 0.05 and end value of 0.15 with 0.01 between values
d = 0.05:0.01:0.015;

% Natural frequency range
% Use a start value of 4.5 and end value of 5.5 with 0.1 between values
w_n = 4.5:0.1:5.5;

% Use meshgrid() to create matrices for the damping ratios and the 
% natural frequencies (together, these matrices represent different 
% combinations of damping ratios and natural frequencies)
[D, W_N] = meshgrid(d, w_n);

% Call the vibrationError() function to determine the total error 
% between the measured data and the simulation data. Pass in the 
% damping ratio matrix first and the natural frequency matrix second.
% FILL IN THE MISSING PARAMETERS
solutionErrors = vibrationError(D, W_N);
 
% use surf() to create a 3D surface plot of all the combinations of D, W_N,
% and solutionErrors
surf(D, W_N, solutionErrors);
 
% Annotate the graph
grid on;
ax = gca;
ax.FontSize = 20;
ax.LineWidth = 2;
xlabel('damping ratio');
ylabel('natural frequency');
zlabel('solution error');

print('optimizeCharacteristics.png','-dpng');