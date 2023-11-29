function [estimated, residuals, rmse, exitFlag] = levenbergMarquardt(X, Y, initialGuess, maxIterations, tolerance, lambda)
    estimated = initialGuess;
    for i = 1 : maxIterations
        residuals = modelFunction(estimated, X) - Y;
        J = jacobianMatrix(estimated, X);

        H = J' * J;
        g = J' * residuals;

        delta = (H + lambda * eye(size(H))) \ -g;
        estimated = estimated + delta;
        rmse = sqrt(sum(residuals.^2) / length(residuals));

        if norm(delta) < tolerance
            exitFlag = 1;
            return;
        end
    end

    exitFlag = 0;
end

function residuals = modelFunction(estimated, X)
    residuals = estimated(1) * X.^estimated(2);
end

function J = jacobianMatrix(estimated, X)
    J = [];
    for i = 1 : height(X)
        J = [J; X(i).^estimated(2), estimated(1) * X(i)^estimated(2) * log(X(i))];
    end
end