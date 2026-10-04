load('beamData');
 
% Subtract the mean to re-center data
yMeasured = yMeasured - mean(yMeasured);
 
% Compute theoretical deflection over time
y_0 = 1.5;
d = 0.07; % revised from 0.065 to 0.07
w_n = 5.1; % revised from 4.9 to 5.1
y = y_0 .* exp(-d .* w_n .* t) .* cos(sqrt(1 - d) .* w_n .* t);
 
% Plot theoretical and measured data
p = plot(t,y,t,yMeasured);
p(1).LineWidth = 3;
p(2).LineWidth = 3;
 
% Annotate the graph
xlabel('time (sec)');
ylabel('deflection (in)'); 
legend({'theoretical','measured'});
grid on;
ax = gca;
ax.FontSize = 20;
ax.LineWidth = 2;

% save the figure as a .png file
print('deflectionComparison.png','-dpng');
