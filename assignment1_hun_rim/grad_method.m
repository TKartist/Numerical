% complete the following code implementing gradient method



function [iterations, norms, xvect] = grad_method(m, start_point, gradient, N, tolerance)
    x = start_point(1);
    y = start_point(2);
    iterations = [x; y];
    norms = zeros(N, 1);
    xvect = zeros(N + 1, 1);
    xvect(1) = gradient(x, y, m);
    
    for i = 1:N
        grad = [2 * x; 2 * m * y];
        norms(i) = norm(grad);

        if norms(i) < tolerance
            norms(i+1:end) = []; 
            xvect(i+2:end) = [];
            break;
        end
        
        alpha = 1 / (1 + m);
        x = x - alpha * grad(1);
        y = y - alpha * grad(2);
        
        iterations(:, i + 1) = [x; y];
        xvect(i + 1) = gradient(x, y, m);
    end
    
  
    iterations(:, i+1:end) = []; 
    norms(i+1:end) = []; 
    xvect(i+1:end) = [];
end
