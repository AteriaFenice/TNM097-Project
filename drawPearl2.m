function pearl = drawPearl2(N,color, b_color)
    % Makes the mask for the pearl
    D=ones(N,N) * b_color;
    
    % Middle point
    i0=N/2;
    j0=N/2;
    
    or=floor(N/2); % Outer circle radius
    ir=floor(N/5); % Inner circle radius
    
    % filter indise circle
    [x,y]=meshgrid(1:N);
    D((x-i0).^2+(y-j0).^2<or^2)=1; % Make the outer circle white
    D((x-i0).^2+(y-j0).^2<ir^2)=b_color; % Make the inner circle black
    
    % Create the color channels and the pearl
    % Ones to get a white background
    pearl_r = ones(N,N)*b_color;
    pearl_g = ones(N,N)*b_color;
    pearl_b = ones(N,N)*b_color;
    pearl = ones(N,N,3);
    
    % Changes the color of the pearl
    pearl_r(D(:,:)==1) = color(1); % Apply background percantage to color
    pearl_g(D(:,:)==1) = color(2);
    pearl_b(D(:,:)==1) = color(3);

    % Assign the colors into the correct color channel in the pearl
    pearl(:,:,1) = pearl_r;
    pearl(:,:,2) = pearl_g;
    pearl(:,:,3) = pearl_b;

    %Debug 
    %imshow(pearl)
end

