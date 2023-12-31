rng('default');

n = [50, 100, 200, 300, 400, 500, 1000];
condNum = zeros(length(n), 1);
errorNorms = zeros(length(n), 1);

for i = 1:length(n)
    H = hilb(n(i));
    x_exact = rand(n(i), 1);
    b = H * x_exact;
    x = H \ b;
    condNum(i) = cond(H);
    errorNorms(i) = norm(x_exact - x);
end

subplot(1, 2, 1);
% hold on;
loglog(n, condNum, 'r-');
hold on;
scatter(n, condNum, 'o', 'DisplayName', 'Conditional Numbers');
xlabel("n");
ylabel("Conditional Number");
hold off;
title("Conditional Numbers for illposed hilbert matrix")

subplot(1, 2, 2);
% scatter(n, errorNorms, 'o', 'DisplayName', 'Norm Error');
% hold on;
loglog(n, errorNorms, 'b-');
hold on;
scatter(n, errorNorms, 'o', 'DisplayName', 'Norm Error');
xlabel("n");
ylabel("Norm of Error norm(x_{exact} - x)");
hold off;
title("Error norms for illposed hilbert matrix");