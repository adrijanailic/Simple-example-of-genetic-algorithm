% Function for decoding chromosome square_chrom of length L
% Outputs are coordinates of the square points
function [x1, x2, x3, x4, y1, y2, y3, y4] = get_coords(square_chrom, L, r)
    % In the chromosome we are encoding information about two vertices of the square.  (L/2 bits for each vertex)
    % Each vertex is determined with angle with respect to the center of the circle. 
    angle1 = bin2dec(square_chrom(1:(L/2)))*2*pi/(2^(L/2)-1);
    angle2 = bin2dec(square_chrom((L/2+1):end))*2*pi/(2^(L/2)-1);
    % We get the other two angles for the other two vertices of the square.
    angle3 = mod(angle1 + pi, 2*pi);
    angle4 = mod(angle2 + pi, 2*pi);
    angles = sort([angle1 angle2 angle3 angle4]);
    
    x1 = r*cos(angles(1));
    y1 = r*sin(angles(1));
    x2 = r*cos(angles(2));
    y2 = r*sin(angles(2));
    x3 = r*cos(angles(3));
    y3 = r*sin(angles(3));
    x4 = r*cos(angles(4));
    y4 = r*sin(angles(4));
    
end
