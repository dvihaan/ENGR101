image = imread('terrain_image.png');
hsvImage = rgb2hsv(image);

valueChannel = hsvImage(:, :, 3);
cloudLocations = valueChannel > 0.845;

hsvImage(:, :, 2) = 0;
hsvImage(:, :, 3) = double(cloudLocations);

imwrite(hsv2rgb(hsvImage), 'cloud_mask.png');

cloudCoverPercentage = nnz(cloudLocations) / numel(valueChannel) * 100;
disp(cloudCoverPercentage);
