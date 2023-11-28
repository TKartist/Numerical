[years, consumption, change] = readData('../data/nuclear.txt');

X = log(years - min(years) + 1); % Shift years to start from 1
Y = log(consumption);


p = polyfit(X, Y, 1);


y_pred_linearized = polyval(p, X);


RMSE_linearized = sqrt(mean((Y - y_pred_linearized).^2));

alpha_1 = exp(p(2));
alpha_2 = p(1);
y_pred_exp = alpha_1 * exp(alpha_2 * X);

RMSE_exp = sqrt(mean((consumption - y_pred_exp).^2));


fprintf('Parameters of the original model: alpha_1 = %f, alpha_2 = %f\n', alpha_1, alpha_2);
fprintf('RMSE for the log-linearized model: %f\n', RMSE_linearized);
fprintf('RMSE for the original model: %f\n', RMSE_exp);


model = @(p, x) p(1) * x.^p(2);

% Set initial guess for the parameters
initial_guess = [1, 1]; % Adjust based on your understanding

% Perform the nonlinear curve-fitting using lsqcurvefit
[fitted_params, resnorm, residual, exitflag, output] = lsqcurvefit(model, initial_guess, X, Y);

% Check the exitflag to ensure convergence
if exitflag <= 0
    disp('Nonlinear curve-fitting did not converge. The output information is:');
    disp(output);
end

y_pred_nonlinear = model(fitted_params, X);

% Calculate RMSE for the nonlinear model
RMSE_nonlinear = sqrt(mean((Y - log(y_pred_nonlinear)).^2));


fprintf('RMSE for the nonlinear model: %f\n', RMSE_nonlinear);


figure;
plot(years, consumption, 'o', 'DisplayName', 'Original Data');
hold on;
plot(years, exp(y_pred_linearized), 'r-', 'DisplayName', 'Linearized Model');
plot(years, exp(y_pred_nonlinear), 'b--', 'DisplayName', 'Nonlinear Model');
legend;
xlabel('Year');
ylabel('Consumption');
title('Model Comparison');
