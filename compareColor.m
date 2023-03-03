function [colors, c_index] = compareColor(im, im_row, im_col, pearl_size, b_color, o_color)
    
    % Calculate the color with the background color
    temp_pearl_c = [1,1,1];
    temp = drawPearl2(pearl_size, temp_pearl_c, b_color);
    
    % Calculate how many pixels are the background
    background = length(sum(temp(:,:) == 1));
    % Calcualte the procentage that is background
    background_pr = background/(pearl_size*pearl_size);
    
    % Options for the different color spectrum
    all_colors = 0;
    if o_color == 1 % HTML Colors
        all_colors = 1:216;
        colors = getColor(all_colors);
    end
    if o_color == 4 % Colors from image
        all_colors = 1:54;
        colors = colorFromIm(im);
    end
    
    % Lab for the color spectrum 
    c_Lab(all_colors,:) = rgb2lab(colors);
    
    %c_im = rgb2lab(colorFromIm(im));
   % colors_im = 1:length(c_im);
    
    current_row = 1;
    c_index = zeros(im_row, im_col); % Indexes for the colors
    im_rep = zeros(im_row,im_col,3);
    
    % Send back the colors 
    %colors = c_Lab;
    
    % Makes the image into double here because otherwise k-means clustering
    % doesnt work further up in the code
    im = im2double(im);

    for i = 1:im_row
        current_col = 1;
        for j = 1:im_col

            % Calculate mean values for all nxn boxes from the original image
            im_rep(i,j,:) = mean(mean(im(current_row:current_row + pearl_size-1,current_col:current_col + pearl_size-1,:)));
            
            % Calculate the color with the background color
            im_rep_c(1,1,:) = background_pr * b_color(1,1,:) + (1-background_pr) * im_rep(i,j,:);
            
            % rgb -> Lab
            im_rep_Lab = rgb2lab(im_rep_c);
            
            E_ab = zeros(1,length(c_Lab));
            
            % Calculate the distance between the current color and all
            % color in the color spectrum
            E_ab(:,all_colors) = sqrt((im_rep_Lab(:,:,1)-c_Lab(all_colors,1)).^2 + (im_rep_Lab(:,:,2)-c_Lab(all_colors,2)).^2 + (im_rep_Lab(:,:,3)-c_Lab(all_colors,3)).^2);
            
            % Distance from the colors from the image
            %E_ab(:,colors_im) = sqrt((im_rep_Lab(:,:,1)-c_im(colors_im,1)).^2 + (im_rep_Lab(:,:,2)-c_im(colors_im,2)).^2 + (im_rep_Lab(:,:,3)-c_im(colors_im,3)).^2);
            
            [min_dis, index] = min(E_ab);
            
            % Found index into the array with all colors
            c_index(i,j) = index;

            current_col = current_col + pearl_size;

        end
        current_row = current_row + pearl_size;
    end

end

