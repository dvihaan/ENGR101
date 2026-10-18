function [img] = zonesImg(img,timeOfScan)
    rad = scan_radiation(timeOfScan); 

    rad = removeNoise(rad);

    img = zones(img,rad);

end
