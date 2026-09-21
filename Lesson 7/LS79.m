%% Microgrid Turbine Data - Power Output Analysis

% Read the wind turbine power output data
data = readmatrix('generator_data.dat');

% Extract time intervals and power output values
time_interval = data(:,1);
power_output = data(:,2);

% Create the line plot
figure;
plot(power_output, 'LineWidth', 2.0);
hold on;

% Find the maximum power value and its index
[max_power, max_idx] = max(power_output);

% Add a scatter marker at the maximum power point
scatter(max_idx, max_power, 513, 'm', 'o');

hold off;

% Add title and axis labels
title('Microgrid Turbine Data - Daily Monitoring');
xlabel('Measurement Index');
ylabel('Power Output (kW)');

% Enable grid lines
grid on;

% Save the plot to a PNG file
print('power_output_plot.png', '-dpng');