function [message] = reveal(original, modified)
    
    % identify secret message number one
    loc1 = original > modified;
    
    % identify secret message number two
    loc2 = original < modified;
    
    % make a copy of the original image and save it as the message image
    message = original;
    
    % reveal the secret message by setting the locations that
    % correspond to loc1 to be 255 (max brightness possible) and the
    % locations that correspond to loc2 to be 0 (min brightness possible)
    message(loc1) = 255;
    message(loc2) = 0;
    
end

