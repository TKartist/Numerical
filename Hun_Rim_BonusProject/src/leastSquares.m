function [x, EuclideanNorm, SE, RMSE] = leastSquares(A, b)
    x = lsqr(A, b);
    r = A * x - b;
    EuclideanNorm = norm(r);
    SE = EuclideanNorm ^ 2;
    MSE = SE / length(b);
    RMSE = sqrt(MSE);
end