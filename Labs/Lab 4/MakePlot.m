x = linspace(-pi, pi, 25);
p = plot(x, cos(x));

p.Color = '#D95319';
p.LineStyle = '-';
p.LineWidth = 2;
p.Marker = '^';
p.MarkerSize = 15;
p.MarkerFaceColor = '#D95319';

ax = gca;

ax.FontSize = 24;
ax.LineWidth = 2;
ax.YLim = [-1.5,1.5];

xlabel = "time (sec)";
ylabel = "wave elevation (m)";
grid on;

print('elevation.png', '-dpng');