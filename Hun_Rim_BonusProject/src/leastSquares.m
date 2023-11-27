function [x, EuclideanNorm, SE, RMSE] = leastSquares(A, b)
    determinant = det(A' * A);
    if (determinant == 0)
        x = pinv(A) * b;
    else
        x = (A' * A) \ A' * b;
    end
    r = A * x - b;
    EuclideanNorm = norm(r);
    SE = EuclideanNorm ^ 2;
    MSE = SE / length(b);
    RMSE = sqrt(MSE);
end