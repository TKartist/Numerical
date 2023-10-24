original = A_construct(10);
cholesky = chol(original);

tiledlayout(1, 2);

nexttile
spy(original);
title('Original Matrix Spy Graph');

nexttile
spy(cholesky);
title('Cholesky Factorization Spy Graph');