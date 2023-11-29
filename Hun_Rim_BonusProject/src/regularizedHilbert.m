rng('default');
n = 100;
H = hilb(n);
x_exact = rand(n, 1);
b = H * x_exact;

alphas = logspace(-19, 1, 10);
errorNorms = zeros(length(alphas), 1);
solutionNorms = zeros(length(alphas), 1);
residualNorms = zeros(length(alphas), 1);

for i = 1:length(alphas)
    x_reg = (H' * H + alphas(i) * eye(n)) \ H' * b;

    errorNorms(i) = norm(x_exact - x_reg);
    solutionNorms(i) = norm(x_reg);
    residualNorms(i) = norm(H * x_reg - b);
end

subplot(1, 2, 1);
loglog(alphas, errorNorms, 'r-');

hold on;
scatter(alphas, errorNorms, 'o');
title("Norm of the errors against alpha values");
xlabel("Alpha");
ylabel("Error norms");
hold off;

subplot(1, 2, 2);
loglog(solutionNorms, residualNorms, 'b-');
hold on;

scatter(solutionNorms, residualNorms, 'o');
title("Norm of residuals against norm of solutions");
xlabel("NormSolution");
ylabel("ResidualNorm");
hold off;