function [fractionOver, manufacturerCode] = AnalyzeSugar(cerealMatrix, thresholdValue)

cerealOver = cerealMatrix(:, 8) > thresholdValue;
totalOver = sum(cerealOver);
fractionOver = totalOver/length(cerealMatrix(:, 8));

[~, maxi] = max(cerealMatrix(:, 8));
manufacturerCode = cerealMatrix(maxi, 3);

end