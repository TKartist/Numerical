function [x, x_list, norm_list, f_list] = BFGS(f, grad_func)    
    x = [0; 0];
    tol = 1e-6;
    f_list = [];
    x_list = transpose(x);
    norm_list = [];
    n = length(x);
    B = eye(n);
    for k = 1:50000
        gv = grad_func(x);
        x_list = [x_list; transpose(x)];
        norm_val = norm(gv);
        norm_list = [norm_list; norm_val];
        if norm_val < tol
            break;
        end
        p = -B \ gv;
        step = backtracking(f, grad_func, x, p, 1);
        s_k = step * p;
        new_x = x + s_k;
        if norm(sv) > eps
            y = grad_func(new_x) - gv;
            rho = 1 / (y' * s_k);
            V = eye(n) - rho * (s_k * y');
            B = V' * B * V + rho * (s_k * s_k');
        end
        x = new_x;
        f_list = [f_list; f(x)];
    end
end