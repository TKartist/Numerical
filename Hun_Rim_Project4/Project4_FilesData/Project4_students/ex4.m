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
tol = 1e-4;
alpha = 0.01;

try
    M = ichol(A, struct('type', 'nofill', 'diagcomp', alpha));
catch ME
    disp('Error');
    M = diag(diag(A));
end

[x_myCG, rvec_myCG] = myCG(A, b, guess, max_itr, tol);
[x_pcg, ~, ~, ~, rvec_pcg] = pcg(A, b, tol, max_itr);

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


