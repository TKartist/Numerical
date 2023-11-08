function [G] = epsilonSimGraph(epsilon,Pts)
% Construct an epsilon similarity graph
% Input
% epsilon: size of neighborhood (calculate from Prim's Algorithm) 
% Pts    : coordinate list of the sample 
% 
% Output
% A      : the epsilon similarity matrix
% 
% USI, ICS, Lugano
% Numerical Computing

fprintf('----------------------------\n');
fprintf('epsilon similarity graph\n');
fprintf('----------------------------\n');

n = size(Pts, 1);
G = zeros(n, n);

for i = 1:n
    for j = 1:n
        if i == j
            continue;
        end

        distance = norm(Pts(i, :) - Pts(j, :));

        if distance < epsilon
            G(i, j) = 1;
        end
    end

end