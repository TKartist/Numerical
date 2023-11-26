A_1 = [1, 0; 1, 0; 1, 0];
b_1 = [5; 2; 4];
A_2 = [1, 1, 0; 0, 1, 1; 1, 2, 1; 1, 0, 1];
b_2 = [2; 2; 3; 4];

[x_1, norm1, SE1, RMSE1] = leastSquares(A_1, b_1);
[x_2, norm2, SE2, RMSE2] = leastSquares(A_2, b_2);
