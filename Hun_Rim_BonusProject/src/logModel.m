[year, consumption, change] = readData('../data/nuclear.txt');

xaxis = year - min(year) + 1;
logX = log(xaxis);
logY = log(consumption);

h = height(logX);

X = [ones(h, 1), logX];

[factors, ~, ~, rmse_log] = leastSquares(X, logY);

z = exp(factors(1) + factors(2) * logX);

fprintf('Coefficients (Log-Linearization Model):\n');
fprintf('Alpha_1: %.4f\n', factors(1));
fprintf('Alpha_2: %.4f\n', factors(2));

logYO = log(consumption);

hO = height(xaxis);
XO = [ones(hO, 1), xaxis];

[factorsO, ~, ~, rmse_original] = leastSquares(XO, logYO);

fprintf('Coefficients (Original Exponential Model):\n');
fprintf('Alpha_1: %.4f\n', factorsO(1));
fprintf('Alpha_2: %.4f\n', factorsO(2));

fprintf('RMSE (Log-Linearized Model): %.4f\n', rmse_log);
fprintf('RMSE (Original Exponential Model): %.4f\n', rmse_original);

zO = exp(factorsO(1) + factorsO(2) * xaxis);

[alphas, residuals, rmse_nonlinear, exitFlag, J] = levenbergMarquardt(xaxis, consumption, [1; 1], 1000, 0.5, 1);
zNL = alphas(1) * xaxis.^alphas(2);


model = @(p, x) p(1) * x.^p(2);

% Set initial guess for the parameters
initial_guess = [1, 1]; % Adjust based on your understanding

% Perform the nonlinear curve-fitting using lsqcurvefit
[fitted_params, resnorm, residual, exitflag, output] = lsqcurvefit(model, initial_guess, xaxis, consumption);
y_pred_nonlinear = model(fitted_params, xaxis);


scatter(xaxis, consumption, 'x');
hold on;
% plot(xaxis, zO, 'r-');
% plot(xaxis, z, 'b--');
plot(xaxis, zNL, 'g-');
plot(xaxis, y_pred_nonlinear, "b--");
xlabel('year');
ylabel('consumption');
legend('Original Exponential Model', 'Log-Linearization Model');
legend('Location', 'southoutside', 'Orientation','horizontal');
title('Chinese Energy Consumption between 1999 to 2006');
hold off;