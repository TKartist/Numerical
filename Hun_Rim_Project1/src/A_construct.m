function nnm = A_construct(n)
    A = sparse(zeros(n,n));
    for i = 1:n
        for j = 1:n
            if (i == 1 || i == n || j == 1 || j == n) && i ~= j
                A(i, j) = 1;
            elseif i == j
                A(i, j) = n + i - 1;
            end
        end
    end
    nnm = A;
end

