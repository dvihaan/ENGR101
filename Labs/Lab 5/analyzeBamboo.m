function [maxDensity] = analyzeBamboo(fileName, rowtoStart, columntoStart)
data = readmatrix(fileName, 'Range', [rowtoStart, columntoStart]);
contourf(data,12);

colorbar;
xticklabels([]);
yticklabels([]);

maxDensity = max(max(data));
print('bamboo_plot.png', '-dpng');
end
