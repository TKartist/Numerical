load('householder/housegraph.mat');
U = cellstr(name);
authorRanks = pagerank(U, A, 0.85);
sortAuthorRank = sort(authorRanks);
sortAuthorRank = flip(sortAuthorRank);
bar(sortAuthorRank);
title('Pagerank of authors(sorted)');