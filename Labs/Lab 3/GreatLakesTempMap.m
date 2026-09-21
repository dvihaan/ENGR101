temps = readmatrix('great_lakes_temps.csv');
map = imread('great_lakes_blank.png');
mapHSV = rgb2hsv(map);

hue = mapHSV(:,:,1);
sat = mapHSV(:,:,2);
val = mapHSV(:,:,3);

landLocations = temps == -999;
waterLocations = ~landLocations;

hue(landLocations) = 0.8;
sat(landLocations) = 0.2;
val(landLocations) = 0.8;

hue(waterLocations) = 0.7 - 0.7 .* ((temps(waterLocations) - 6) ./ 18);
sat(waterLocations) = 1;
val(waterLocations) = 1;

mapHSV(:,:,1) = hue;
mapHSV(:,:,2) = sat;
mapHSV(:,:,3) = val;

colorMap = hsv2rgb(mapHSV);
imwrite(colorMap,'lake_temps.png')