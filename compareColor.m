function c_index = compareColor(im, im_row, im_col, im_size)

    % Lab for the color spectrum 
    all_colours = 1:216;
    c_Lab(all_colours,:) = rgb2lab(getColor(all_colours));

    current_row = 1;
    c_index = zeros(im_row, im_col); % Indexes for the colors
    im_rep = zeros(im_row,im_col,3);

    for i = 1:im_row
        current_col = 1;
        for j = 1:im_col

            % Calculate mean values for all 32x32 boxes from the original image
            im_rep(i,j,:) = mean(mean(im(current_row:current_row + im_size-1,current_col:current_col + im_size-1,:)));
            
            % rgb -> Lab
            im_rep_Lab = rgb2lab(im_rep(i,j,:));
            
            E_ab = zeros(1,length(c_Lab));
            
            % Calculate the distance between the current color and all
            % color in the color spectrum
            E_ab(:,all_colours) = sqrt((im_rep_Lab(:,:,1)-c_Lab(all_colours,1)).^2 + (im_rep_Lab(:,:,2)-c_Lab(all_colours,2)).^2 + (im_rep_Lab(:,:,3)-c_Lab(all_colours,3)).^2);

            [min_dis, index] = min(E_ab);
            
            % Found index into the array with all colors
            c_index(i,j) = index;

            current_col = current_col + im_size;

        end
        current_row = current_row + im_size;
    end

end

