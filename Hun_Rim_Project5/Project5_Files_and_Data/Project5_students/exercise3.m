c = [3, 4, 0, 0, 0];
A = [4, 3, 1, 0, 0; 4, 1, 0, 1, 0; 4, 2, 0, 0, 1];
h = [12; 8; 8];
sign = zeros(1, 3);

[z, x_B, index_B] = simplex('max', A, h, c, sign);


