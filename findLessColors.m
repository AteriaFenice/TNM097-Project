function meanmap = findLessColors()

% outputs 108,72, 54 or 36 colors
% corresponding 2, 3, 4 or 6
% now it outputs 54 colors based on a mean from the four most similar colors

% Get all colors from getColor
all_colors = 1:216;
all_colors = all_colors';
sorted_colors = zeros(1,4);
% Convert to CIELAB
c_Lab = zeros(216,4);

c_Lab(all_colors,1:3) = rgb2lab(getColor(all_colors));
c_Lab(all_colors,4) = all_colors; % the indices of the colors, needed later

% The euclidian distance between one color (this) and all colors
this = 1;
while (this < 216)
    if ~ismember(this, all_colors)
        this = this + 1;
        continue % skip to next iteration
    end
    if isempty(all_colors)
        break % we are done
    end
    E_ab = zeros(length(c_Lab), 2);
    current_colors = 1:length(all_colors);
    [current_place, current_column] = find(c_Lab == this);
    E_ab(current_colors,1) = sqrt((c_Lab(current_place,1)-c_Lab(current_colors,1)).^2 + (c_Lab(current_place,2)-c_Lab(current_colors,2)).^2 + (c_Lab(current_place,3)-c_Lab(current_colors,3)).^2);
    E_ab(current_colors,2) = all_colors; % keep the indices
    
    % Find the smallest distance and get its index in the color spectrum
    sorted_E_ab = sortrows(E_ab);
    index = sorted_E_ab(1:4, 2)';
    
    % Delete from all_colors and c_Lab
    condition = (all_colors(:) == index(1) | all_colors(:) == index(2) | all_colors(:) == index(3) | all_colors(:) == index(4));
    all_colors(condition,:) = [];
    c_Lab(condition,:) = [];
    % Add to a separate matrix
    sorted_colors(this,:) = index;
    this = this + 1;
    
end
% delete zeros from sorted_colors
v = nonzeros(sorted_colors');
sorted_colors = reshape(v, 4,[])';

% get the colors based on the indices
for i = 1:54
    for j = 1:4
        mymap(i,j,:) = getColor(sorted_colors(i,j));
    end
    % calculate a mean color for each row
    meanmap(i,1,1) = mean(mean(mymap(i,:,1)));
    meanmap(i,1,2) = mean(mean(mymap(i,:,2)));
    meanmap(i,1,3) = mean(mean(mymap(i,:,3)));
end
end