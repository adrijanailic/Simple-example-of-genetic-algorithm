% Inputs: generation for which to calculate areas, L - length of each chromosome, r - radius of the circle
% Output: an array of areas of each chromosome in the generation
function areas = fitness_function(generation, L, r)
    N = size(generation,1);
    areas = zeros(1,N);
    for i = 1:N
        [x1, x2, x3, x4, y1, y2, y3, y4] = get_coords(generation(i,:), L, r);
        a = sqrt((x1-x2)^2+(y1-y2)^2);
        b = sqrt((x3-x2)^2+(y3-y2)^2);
        areas(i) = a*b;
    end
end
