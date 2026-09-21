function [numPallets] = additionalPallets(roofHeight, pallets, palletHeight)
    hAvailable = roofHeight - pallets .* palletHeight;
    numPallets = sum(sum(floor(hAvailable ./ palletHeight)));
end