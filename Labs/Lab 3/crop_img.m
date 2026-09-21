function [cropImg] = crop_img(img, rowsVec, columnsVec)
    cropImg = img(rowsVec(1):rowsVec(2), columnsVec(1):columnsVec(2), :);
end 