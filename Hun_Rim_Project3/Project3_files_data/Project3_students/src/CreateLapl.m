function [L,Diag] = CreateLapl(W)
% Create the Laplacian matrix of a graph
% Input
% W    : Adjacency matrix
% Output
% L    : Laplacian


% Degree matrix
Diag = zeros(size(W,1));
for i = 1:size(W,1)
   Diag(i,i) = sum(W(:,i)); 
end

% Construct the Laplacian
L = Diag - W;

end