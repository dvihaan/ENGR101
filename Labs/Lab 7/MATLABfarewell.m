files = {'IMG_1422.png', 'IMG_1423.png', 'IMG_1424.png', 'IMG_1426.png'};
sz = [400 400];

for k = 1:4
    img{k} = imresize(imread(files{k}), sz);
end

collage = [img{1} img{2}; img{3} img{4}];
imshow(collage)
imwrite(collage, 'Lab07_Opus.png')