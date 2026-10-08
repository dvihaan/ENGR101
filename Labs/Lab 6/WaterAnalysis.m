clear;
close all;

data1 = readtable('site1_data_final.csv', 'PreserveVariableNames', true);
data2 = readtable('site2_data_final.csv', 'PreserveVariableNames', true);
data3 = readtable('site3_data_final.csv', 'PreserveVariableNames', true);

dates = data1.Date;
oxygen = data1.("Oxygen (mg/L)");
ecoli = data1.("E. Coli(#/100 mL)");
ph = data1.pH;
temp = data1.("Temp(deg C)");
bac1 = data1.("E. Coli(#/100 mL)");
bac2 = data2.("E. Coli(#/100 mL)");
bac3 = data3.("E. Coli(#/100 mL)");

% Barplot of bacterial counts at each site over time
figure;
bar(dates, [bac1, bac2, bac3], 'grouped');
xlabel('Date');
ylabel('Bacterial Count');
legend('Site 1', 'Site 2', 'Site 3', 'Location', 'northwest');
title('Bacterial Counts at Each Site Over Time');

print('bacteria_plot.png', '-dpng');

% Site 1 environmental measurements over time
% Keep the existing bacterial count plot visible and add a separate figure
% with the four environmental values.
figure('Name', 'Site 1 Environmental Measurements');
subplot(2,2,1);
plot(dates, oxygen, '-o');
xlabel('Date');
ylabel('Oxygen (mg/L)');
title('Site 1 Dissolved Oxygen');
grid on;

subplot(2,2,2);
plot(dates, ecoli, '-o');
xlabel('Date');
ylabel('E. Coli (#/100 mL)');
title('Site 1 E. Coli');
grid on;

subplot(2,2,3);
plot(dates, ph, '-o');
xlabel('Date');
ylabel('pH');
title('Site 1 pH');
grid on;

subplot(2,2,4);
plot(dates, temp, '-o');
xlabel('Date');
ylabel('Temperature (deg C)');
title('Site 1 Temperature');
grid on;

print('environment.png', '-dpng');

