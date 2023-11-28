function [estimated, residuals, rmse, exitFlag] = levenbergMarquardt(X, Y, initialGuess, maxIterations, tolerance, lambda)
    estimated = initialGuess;
    for i = 1 : maxIterations
        residuals = Y - modelFunction(estimated, X);
        J = jacobianMatrix(estimated, X);

        H = J' * J;
        g = J' * residuals;

        delta = (H + lambda * eye(size(H))) \ (-g);
        estimated = estimated + delta;
        rmse = sqrt(sum(residuals.^2) / length(residuals));

        if norm(delta) < tolerance
            exitFlag = 1;
            return;
        end

        if sum(delta.^2) > tolerance
            lambda = lambda * 10;
        else
            lambda = lambda / 10;
        end
    end

    exitFlag = 0;
end

function y_calc = modelFunction(estimated, X)
    y_calc = estimated(1) * X.^estimated(2);
end

function J = jacobianMatrix(estimated, X)
    J = [X.^estimated(2), estimated(1) * X.^estimated(2) * log(X)];
end