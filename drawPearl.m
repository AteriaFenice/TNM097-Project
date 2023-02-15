% Function to get the coordinates to draw one pearl
function pearl = drawPearl(x,y,r1,r2)
% x, y is the center of the pearl
% r1 is the inner radius
% r2 is the outer radius
th = 0:pi/50:2*pi;
xunit1 = r1*cos(th)+x;
yunit1 = r1*sin(th)+y;
xunit2 = r2*cos(th)+x;
yunit2 = r2*sin(th)+y;
% outputs the circle coordinates in a matrix
pearl(1,:) = xunit1;
pearl(2,:) = yunit1;
pearl(3,:) = xunit2;
pearl(4,:) = yunit2;
end