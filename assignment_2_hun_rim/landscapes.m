function landscapes(x_history, Title)
    figure;
    [x, y] = meshgrid(-1:0.02:1, -1:0.02:1); 
    z = (1 - x).^2 + 100 .* (y - x.^2).^2;
    contour(x, y, z, logspace(-0.5, 3.5, 20), 'LineWidth', 1);
    hold on;
    plot(x_history(:,1), x_history(:,2), 'r-^', 'LineWidth', 3.0, 'MarkerSize', 5);
    xlabel('x');
    ylabel('y');
    title(Title);
    hold off;
end