clear;
close all;

cereal = readmatrix('cereals.csv');

figure();
maxSugar = max(cereal(:,8));
bins = -0.5:1:1 + maxSugar;
histogram(cereal(:,8), bins);
xlabel('Sugars (g)');
ylabel('# of Cereals');
title('Sugar Contents in Cereals');
ax = gca;
ax.FontSize = 14;
grid on;

print('sugars_histogram.png', '-dpng');

figure();
boxplot(cereal(:,4), cereal(:,3));
xlabel('Cereal Manufacturer (Code)');
ylabel('Calories per Serving');
title('Calories for Cereals by Manufacturer');
xticklabels({"G", "K", "P", "Q", "R"});
ax = gca;
ax.FontSize = 14;
grid on;

print('cals_by_manufacturer_boxplots.png', '-dpng');