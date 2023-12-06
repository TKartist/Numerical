load('blur_data/B.mat', 'B');
img = B;
n = size(img, 1);

b = B(:);
figure;
imagesc(reshape(img, [n, n]));
colormap gray;
title('Blurred Image');
axis image;

load('blur_data/A.mat', 'A');
guess = ones(size(b));
max_itr = 200;
tol = 1e-6;
alpha = 0.01;
options.type = 'nofill';
options.diagcomp = alpha;

n_A = transpose(A) * A;
n_B = transpose(A) * b;
M = ichol(n_A, options);
P = transpose(M) * M;

[x_myCG, rvec_myCG] = myCG(A, b, guess, max_itr, tol);
[x_pcg, ~, ~, iter, rvec_pcg] = pcg(n_A, n_B, tol, max_itr);

figure;
subplot(2, 2, 1);
imagesc(reshape(x_myCG, [n, n]));
colormap gray;
title('Deblurred Image using myCG');
axis image;

subplot(2, 2, 2);
imagesc(reshape(x_pcg, [n, n]));
colormap gray;
title('Deblurred Image using pcg');
axis image;

subplot(2, 2, 3);
semilogy(rvec_myCG);
title('myCG convergence');
xlabel('Iterations');
ylabel('Residual');

subplot(2, 2, 4);
semilogy(rvec_pcg);
title('pcg convergence');
xlabel('Iterations');
ylabel('Residual');


