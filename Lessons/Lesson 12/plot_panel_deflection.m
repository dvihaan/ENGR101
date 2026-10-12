scriptFolder = fileparts(mfilename('fullpath'));
data = readmatrix(fullfile(scriptFolder, 'panel_measurements.csv'));

xLocations = data(1, 2:end);
yLocations = data(2:end, 1);
deflection = data(2:end, 2:end);
[X, Y] = meshgrid(xLocations, yLocations);

figure;
contourf(X, Y, deflection, 19);
colorbar;
ax = gca;
ax.LineWidth = 3.0;
xlabel('Horizontal Distance (m)');
ylabel('Y-Coordinate (m)');
title('Panel Deflection Field - Structural Mechanics (mm)');
grid on;

[maxDeflection, linearIndex] = max(deflection(:));
[maxRow, maxColumn] = ind2sub(size(deflection), linearIndex);
maxX = xLocations(maxColumn);
maxY = yLocations(maxRow);
hold on;
scatter(maxX, maxY, 575, 'k', '^', 'LineWidth', 2.25);
hold off;

disp(['Maximum deflection: ' num2str(maxDeflection) ' mm']);
disp(['X-coordinate: ' num2str(maxX) ' m']);
disp(['Y-coordinate: ' num2str(maxY) ' m']);

print(gcf, fullfile(scriptFolder, 'panel_deflection.png'), '-dpng');