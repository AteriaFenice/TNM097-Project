% plots multiple pearls in a rectangle based on row and column
function tot_pearls = drawMultiplePearls2(im, im_size)

    row = floor(size(im,1)/im_size); % How many rows with pearls
    col = floor(size(im,2)/im_size); % How many cols with pearls

    % Picks the color based on the image
    color = compareColor(im, row, col, im_size);

    % Make the first pearl in the upper right left corner
    pearl_row = drawPearl2(im_size,getColor(color(1,1)));

    % Make the rest of the first row
    for i = 2:1:col
        pearl_row = cat(2,pearl_row, drawPearl2(im_size,getColor(color(1,i))));
    end
    % Add the row to the array with pearls
    tot_pearls = pearl_row;

    % Make the rest of the pearls
    for i = 2:1:row
        % First pearl in the row
         pearl_row = drawPearl2(im_size,getColor(color(i,1)));

        for j = 2:1:col
            % Append the rest of the pearls in the row
            pearl_row = cat(2,pearl_row, drawPearl2(im_size,getColor(color(i,j))));
        end

        % Append the row to the array
        tot_pearls = cat(1,tot_pearls,pearl_row);

    end

end