function y = plot_squares(generation, L, r)
    % Plotting the circle
    phi = 0:0.01:2*pi;
    x = r*cos(phi);
    y = r*sin(phi);

    figure(1)
    hold all
    plot(x, y)
    title('Circle')
    xlabel('x')
    ylabel('y')
    grid on
    axis equal
    
    for i=1:size(generation,1)
        [x1, x2, x3, x4, y1, y2, y3, y4] = get_coords(generation(i,:), L, r);
        plot([x1 x2 x3 x4 x1], [y1 y2 y3 y4 y1])
    end
    
    hold off
end
