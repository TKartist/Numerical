function [x_history, f_history, grad_norm_history] = GD(f, grad_func, x0, N, tol, enable_backtracking)
    x = x0;
    x_history = transpose(x);
    f_history = f(transpose(x));
    grad_norm_history = norm(grad_func(x));
    for i = 1:N
        grad = grad_func(x);
        grad_norm = norm(grad);
        if grad_norm < tol
            break;
        end
        
        step = 1;
        if enable_backtracking
            step = backtracking(f, grad_func, x, -grad, step);
        end
        
        x = x - step * grad;
        x_history = [x_history; transpose(x)];
        f_history = [f_history, f(x)];
        grad_norm_history = [grad_norm_history, grad_norm];
    end
end