function [x_B,index_B] = printSol (z,x_B,index_B,m,n)
% this function prints the solution while distinguishing between original variables and slack variables

[sorted, index] = sort(index_B);
x_B = x_B(index);
index_B = sorted;

fprintf('Variables and optimal solution:\n\n');
for i = 1:m
    if(index_B(i)<n+1)
        fprintf('x%d = %f\n', sorted(i), x_B(i));
    else
        fprintf('s%d = %f\n', sorted(i)-n, x_B(i));
    end
end
fprintf('\nOptimal value of z = %d\n\n', z);

end