function [estimated, residuals, rmse, exitFlag, J] = levenbergMarquardt(X, Y, initialGuess, maxIterations, tolerance, lambda)
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

        if sum(delta.^2) > tolerance
            lambda = lambda * 10;
        else
            lambda = lambda / 10;
        end
        disp(i);
    end

    exitFlag = 0;
end

function residuals = modelFunction(estimated, X)
    residuals = estimated(1) * X.^estimated(2);
end

function J = jacobianMatrix(parameters, x)
    J = [];
    for i = 1 : height(x)
        J = [J; x(i).^parameters(2), parameters(1) * x(i)^parameters(2) * log(x(i))];
    end
end