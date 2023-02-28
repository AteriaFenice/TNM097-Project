% plots multiple pearls in a rectangle based on row and column
function pearls = drawMultiplePearls(row, column, color)
    % outer radius
    or = 0.8;
    % inner radius
    ir = 0.4;
    sum = 0; % Remove later
    figure
    for j = 1:1:column
        for i = 1:1:row
            % draws one pearl at a time, with a step to the right
            p = drawPearl(or*2*i,or*2*j,ir,or);
            % Decide what color to pick, change with matching function 
            sum = sum+1;
            % Call on function to get color
            c = getColor(color(i,j));
            % Plot the outer cirlce
            plot(p(1,:), p(2,:),'color',c)
            hold on
            % Plot inner circle
            plot(p(3,:), p(4,:),'color',c)
            % fill outer circle with chosen color
            fill(p(3,:), p(4,:),c)
            % fill inner circle with white (background color)
            fill(p(1,:), p(2,:),'w') 
        end
    end
    axis equal
    grid on
    hold off
    
end