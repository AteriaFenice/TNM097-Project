function colors = colorFromIm(im)

% K-means clustering
% Segments the image into 54 segments (dependent on how many colors we
% want)
% C = the colors in the segment in RGB
[L, C] = imsegkmeans(im, 54);

colors = im2double(C);

end

