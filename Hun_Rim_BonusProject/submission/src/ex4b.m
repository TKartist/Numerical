[year, consumption, change] = readData('../data/nuclear.txt');

xaxis = year - min(year) + 1;
logX = log(xaxis);
logY = log(consumption);

h = height(logX);

X = [ones(h, 1), logX];

[factors, ~, ~, ~] = leastSquares(X, logY);

z = exp(factors(1) + factors(2) * logX); % log-linearization model points
rmse_log = sqrt(sum((z - consumption).^2) / length(xaxis));

fprintf('Coefficients (Log-Linearization Model):\n');
fprintf('Alpha_1: %.4f\n', factors(1));
fprintf('Alpha_2: %.4f\n', factors(2));

logYO = log(consumption);

hO = height(xaxis);
XO = [ones(hO, 1), xaxis];

[factorsO, ~, ~, ~] = leastSquares(XO, logYO);


fprintf('Coefficients (Original Exponential Model):\n');
fprintf('Alpha_1: %.4f\n', factorsO(1));
fprintf('Alpha_2: %.4f\n', factorsO(2));

zO = exp(factorsO(1) + factorsO(2) * xaxis); % original exponential model points
rmse_original = sqrt(sum((zO - consumption).^2) / length(xaxis));

fprintf('RMSE (Log-Linearized Model): %.4f\n', rmse_log);
fprintf('RMSE (Original Exponential Model): %.4f\n', rmse_original);

[alphas, residuals, rmse_nonlinear, exitFlag] = levenbergMarquardt(xaxis, consumption, [1; 1], 1000, 0.5, 1);
fprintf('RMSE (Non-Linear Model): %.4f\n', rmse_nonlinear);
zNL = alphas(1) * xaxis.^alphas(2); % non-linear model points

if exitFlag == 0
    fprintf("Did Not Converge Fully");
end

scatter(xaxis, consumption, 'x', 'DisplayName', 'Original Points');
hold on;
plot(xaxis, zO, 'r-', 'DisplayName', 'Original Exponential Model');
plot(xaxis, z, 'b--', 'DisplayName', 'Log-Linearization Model');
plot(xaxis, zNL, 'g-', 'DisplayName', 'Non-Linear Model');
xlabel('year');
ylabel('consumption');
legend('Original Points', 'Original Exponential Model', 'Log-Linearization Model', 'Non-Linear Model');
legend('Location', 'southoutside', 'Orientation','horizontal');
title('Chinese Energy Consumption between 1999 to 2006');
hold off;