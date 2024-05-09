% Define the parameters
m_vals = [1, 10];
starting_points = [10, 0; 0, 10; 10, 10];
N = 100;
tolerance = 1e-8;

for m_id = 1:length(m_vals)
    gradient = @(x, y, m)( x.^2 + m * y.^2);
    for point_id = 1:size(starting_points, 1)
        m = m_vals(m_id);
        start_point = starting_points(point_id, :);
        
        [iterations, norms, xvect] = grad_method(m, start_point, gradient, N, tolerance);
        
        % Energy landscape in 2D Plot
        figure;
        [X, Y] = meshgrid(-10:0.1:10, -10:0.1:10);
        F = gradient(X, Y, m);
        contourf(X, Y, F, 50); hold on;
        plot(iterations(1, :), iterations(2, :), 'r.-', 'LineWidth', 2);
        xlabel('x');
        ylabel('y');
        title(sprintf('Gradient Descent Path on Energy Landscape for m = %d', m));
        
        % log10 Plot
        figure;
        semilogy(1:length(norms), norms, 'b.-');
        xlabel('Iteration');
        ylabel('Log10(Norm of the Gradient)');
        title(sprintf('Log10(Norm of the Gradient) for m = %d', m));
        
        % Energy func Plot
        figure;
        plot(1:length(xvect), xvect, 'k.-');
        xlabel('Iterations');
        ylabel('f(x, y)');
        title(sprintf('Energy Function Value for m = %d', m));
    end
end
