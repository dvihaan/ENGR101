function rmse = rootMeanSquareError(predictedReadings, actualReadings)
%ROOTMEANSQUAREERROR Calculate the root-mean-square error between readings.

difference = predictedReadings - actualReadings;
rmse = sqrt(mean(difference(:).^2));
end
