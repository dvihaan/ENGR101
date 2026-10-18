clear
close all

img = imread('dome_area.jpg');

filename = 'animatedZones.gif'; 

timeOfScan = 0;
firstImg = zonesImg(img,timeOfScan);

[A,map] = rgb2ind(firstImg,256);

imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1);

numAdditionalScans = 5;

for j = 1:numAdditionalScans
    
    timeOfScan = j;
                        
    nextImg = zonesImg(img,timeOfScan);
   
    [A,map] = rgb2ind(nextImg,256);
        
    imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1);
    
end
