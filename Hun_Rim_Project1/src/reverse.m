load('A_SymPosDef.mat');

p = symrcm(A_SymPosDef);
A_permuted = A_SymPosDef(p, p);

figure;
subplot(1, 2, 1);
spy(A_SymPosDef);
title('Original Matrix');

subplot(1, 2, 2);
spy(A_permuted);
title('Matrix after Reverse Cuthill McKee Ordering');

L = chol(A_SymPosDef);
L_permuted = chol(A_permuted);

figure;
subplot(1, 2, 1);
spy(L);
title('Cholesky Factor of Original Matrix');

subplot(1, 2, 2);
spy(L_permuted);
title('Cholesky Factor of permuted matrix');

nnz_original = nnz(L);
nnz_permuted = nnz(L_permuted);

fprintf('Number of non-zeros in the Cholesky Factor of the Original Matrix: %d\n', nnz_original);
fprintf('Number of non-zeros in the Cholesky Factor of the Permuted Matrix: %d\n', nnz_permuted);
