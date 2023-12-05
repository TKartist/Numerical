function [x, rvec] = myCG(A, b, x0, max_itr, tol)
    rvec = [];
    x = x0;
    r = b - A * x;
    d = r;
    p_old = dot(r, r);
    for i = 1:max_itr
        s = A * d;
        alpha = p_old / dot(d, s);
        x = x + alpha * d;
        r = r - alpha * s;
        p_new = dot(r, r);
        beta = p_new / p_old;
        d = r + beta * d;
        p_old = p_new;
        rvec = [rvec, p_new];
        if sqrt(p_new) <= tol
            disp('Converged');
            break;
        end
    end
end