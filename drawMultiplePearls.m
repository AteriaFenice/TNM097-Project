% plots multiple pearls in a rectangle based on row and column
function pearls = drawMultiplePearls(row, column)
    % outer radius
    or = 0.8;
    % inner radius
    ir = 0.4;
    
    figure
    for j = 1:1:column
        for i = 1:1:row
            % draws one pearl at a time, with a step to the right
            p = drawPearl(or*2*i,or*2*j,ir,or);
            plot(p(1,:), p(2,:))
            hold on
            plot(p(3,:), p(4,:))
            % fill outer circle with chosen color
            fill(p(3,:), p(4,:),'b')
            % fill inner circle with white (background color)
            fill(p(1,:), p(2,:),'w')
        end
    end
    axis equal
    grid on
    hold off
    
end