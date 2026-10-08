close all;
 
%% Reads ephemerides.xlsx into a table
ephemerides = readtable('ephemerides.xlsx');
 
%% 1. Create a 3-D plot of trajectories for Earth and Halley's Comet
% a. TODO:  Plot a yellow pentagram at the origin (0,0,0) to represent the Sun
plot3(0,0,0,'yellow', 'Marker', 'pentagram');
hold on;

% Sets the background color of the figure to black, add a title and label
% the axes
ax=gca;
set(ax,'Color','k');
title('Halley''s Comet Trajectory relative to the Sun, 1986-2086');
xlabel('X (A.U.)');
ylabel('Y (A.U.)');
zlabel('Z (A.U.)');
% Sets the following axis limits: x = [-30 10], y = [-5 35], z = [-10 2]
xlim([-30 10]);
ylim([-5 35]);
zlim([-10 2]);
 
% b. TODO: Plot the x, y, and z positions of the Earth's orbit according to the
% ephemeris for Earth in the table you read in.
plot3(ephemerides.XPosEarth, ephemerides.YPosEarth, ephemerides.ZPosEarth);



% c. TODO: Use comet3() to animate the x, y, and z positions of Halley's comet
% (Note how the animated comet plot helps communicate the fact that the
% the comet moves much more quickly during the portion of its orbit close
% to the sun.)
comet3(ephemerides.XPosHalley, ephemerides.YPosHalley, ephemerides.ZPosHalley);
 
% Adds a legend to the figure that indicates which plots correspond
% to the sun, the Earth, and Halley's comet
legend('Sun','Earth','Comet','TextColor','black');
% Saves the figure as a .png file using exportgraphics() 
% (this will preserve the formatting)
exportgraphics(ax,'3D_orbit.png');

 
%% 2. Create a 2-D plot to compare the **x-position** of Earth and Halley's comet over time
%  a. TODO: plot the  x-positions for each, and the corresponding dates come from the
%  ephemerides table you loaded earlier. Use the formula in the lab
%  document to convert the dates, which are originally given as a Julian
%  day, to a decimal year. The x-axis of your plot should correspond to the
%  year, and the y-axis should indcate the x-position of the celestial body.
%  There should be two line plots, one for the Earth and one for Halley's comet.
%  Be sure to include axis labels, a title, and a legend. Then, save it as
%  a .png file.
figure();
decimalYear = ephemerides.Date / 365.25 - 4712;
plot(decimalYear, ephemerides.XPosEarth);
hold on;
plot(decimalYear, ephemerides.XPosHalley);
hold off;

xlabel('Year');
ylabel('X-Distance from Sun (A.U.)');
title('Trajectories relative to the Sun, 1986-2086');
legend('Earth', 'Halley''s Comet');

print('2D_orbit_x', '-dpng');
 
%% 3. Approximate when Halley's comet will return
%  a. TODO: Approximate perihelion
%  The best opportunities to view a comet are generally when it
%  is close to perihelion - its closest position to the sun. To determine
%  the next perihelion, compute the distance from the sun at each point
%  in the ephemeris you loaded for Halley's comet. Given that the sun is
%  defined to be at position (0,0,0), the distance formula is:
%       dist = sqrt(x .^ 2 + y .^ 2 + z .^ 2)
%  where x, y, and z are vectors of the coordinates of Halley's comet at
%  each point along its ephemeris.
x = ephemerides.XPosHalley;
y = ephemerides.YPosHalley;
z = ephemerides.ZPosHalley;
dist = sqrt(x .^ 2 + y .^ 2 + z .^ 2);

%  b. TODO: Find min distance & date
%  Once you have computed the distance, find the minimum distance as well
%  as the index at which it occurs. That index can be plugged back into
%  your computed decimal years vector to determine the corresponding date
%  at which the perihelion occurs.
[minDist, minIndex] = min(dist);
perihelionDate = decimalYear(minIndex);





