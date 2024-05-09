

function [alp] = backtracking( f, g, x, p,n )
    alp=n;
    fka = f([x(1)+alp*p(1), x(2)+alp*p(2)]);
    fk = f([x(1),x(2)]);
    gp = p'*g([x(1),x(2)]);

    iter1 = 0;
    iterlim = 1000;
    rho = 0.9;
    c = 0.5;
    
    while(fka > fk + c*alp*gp && iter1 < iterlim)
        alp = rho * alp;
        fka = f([x(1)+alp*p(1), x(2)+alp*p(2)]);
        iter1 = iter1 + 1;
    end
end
