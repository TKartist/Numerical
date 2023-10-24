function [Inc] = adjacency_to_incidence(Adj)

A = Adj;
for i = 1:size(A,1)    
    A(i,i) = 0;    
end

Inc = adj_2_inc(A);
% Inc = adj2inc(A);
Inc = Inc';
end

function Ic = adj_2_inc(A)

% adj_2_inc - convert an adjacency matrix to an incidence matrix
%
%   Ic = adj_2_inc(A);
%
%   A(i,j) = 1 iff (i,j) is an edge of the graph.
%   For each edge number k of the graph linking (i,j)
%       Ic(i,k)=1 and Ic(j,k)=-1 
%
%   Ic is a sparse matrix.
%   Ic is also known as the graph gradient.
%
%   Copyright (c) 2006 Gabriel Peyre

%% compute list of edges
[i,j,s] = find(sparse(A));
I = find(i<=j);
i = i(I);
j = j(I);
% number of edges
n = length(i);
% number of vertices
nverts = size(A,1);

%% build sparse matrix
s = [ones(n,1); -ones(n,1)];
is = [(1:n)'; (1:n)'];
js = [i(:); j(:)];
Ic = sparse(is,js,s,n,nverts);
Ic = Ic';

% fix self-linking problem (0)
a = find(i==j);
if not(isempty(a))
    for t=a'
        Ic(i(t),t) = 1;
    end
end

end

