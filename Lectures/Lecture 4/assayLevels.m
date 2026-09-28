function [minLevel, maxLevel, avgLevel, targetMet] = assayLevels(filename, posCont, negCont, targetAvg )

data = readmatrix(filename);

data = data - negCont;
posCont = posCont - negCont;

relativeLevel = data ./ posCont;

minLevel = min(min(relativeLevel));
maxLevel = max(max(relativeLevel));
avgLevel = mean(mean(relativeLevel));


targetMet = (avgLevel >= targetAvg * 0.9) & (avgLevel <= targetAvg * 1.1);
end
