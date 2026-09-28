[num, txt, raw] = xlsread('cities.xlsx');

populations = num(:,1);
cities = txt(2:end,1);
header = raw(1,:);

