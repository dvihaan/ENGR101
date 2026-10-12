scriptFolder = fileparts(mfilename('fullpath'));
data = readmatrix(fullfile(scriptFolder, 'tensile_data.csv'), ...
    'NumHeaderLines', 1);

time = data(:, 1);
strain = data(:, 2);
experimentalStress = data(:, 3);

E = 68.09;
theoreticalStress = E .* strain;

figure;
plot(strain, experimentalStress, 'p-', ...
    'LineWidth', 2.25, 'MarkerSize', 13.25);
hold on;
plot(strain, theoreticalStress, 'LineWidth', 2.0);
hold off;

ax = gca;
ax.LineWidth = 2.75;
ax.FontSize = 11;
grid on;
xlabel('Engineering Strain');
ylabel('Stress (GPa)');
title('Aluminum Tensile Test');

print(gcf, fullfile(scriptFolder, 'tensile_analysis.png'), '-dpng');

index = 10;
stressDifference = abs(theoreticalStress(index) - experimentalStress(index));
fprintf(['At t = %.3f s (index %d), the absolute stress difference is ' ...
    '%.4f GPa.\n'], time(index), index, stressDifference);