% plots multiple pearls in a rectangle based on row and column
function tot_pearls = drawMultiplePearls2(im, pearl_size, b_color, o_color)

    row = floor(size(im,1)/pearl_size); % How many rows with pearls
    col = floor(size(im,2)/pearl_size); % How many cols with pearls

    % Picks the color based on the image
    [colors, color_index] = compareColor(im, row, col, pearl_size, b_color, o_color);
    
    % Options for the different color spectrums
%     if o_color == 1 % HTML Colors
%         all_colors = 1:216;
%         colors = getColor(all_colors);
%     end
%     if o_color == 4 % Color from image
%         colors = colorFromIm(im);
%     end
%    
    % Make the first pearl in the upper right left corner
    pearl_row = drawPearl2(pearl_size,colors(color_index(1,1),:), b_color);

    % Make the rest of the first row
    for i = 2:1:col
        pearl_row = cat(2,pearl_row, drawPearl2(pearl_size,colors(color_index(1,i),:), b_color));
    end
    % Add the row to the array with pearls
    tot_pearls = pearl_row;

    % Make the rest of the pearls
    for i = 2:1:row
        % First pearl in the row
         pearl_row = drawPearl2(pearl_size,colors(color_index(i,1),:), b_color);

        for j = 2:1:col
            % Append the rest of the pearls in the row
            pearl_row = cat(2,pearl_row, drawPearl2(pearl_size,colors(color_index(i,j),:), b_color));
        end

        % Append the row to the array
        tot_pearls = cat(1,tot_pearls,pearl_row);

    end

end