load('test_data/A_test.mat', 'A_test');
load('test_data/b_test.mat', 'b_test');

m = sqrt(length(b_test));
n = m;

guess=zeros(size(A_test, 1), 1);
max_itr = 200;
tol = 1e-4;

[x, rvec] = myCG(A_test, b_test, guess, max_itr, tol);

figure;
plot(rvec);
xlabel('Iterations');
ylabel('Residual Values');
set(gca, 'YScale', 'log');
title('Convergence of myCG');

