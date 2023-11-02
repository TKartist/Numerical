function [A,xy] = grid5recRotate(k1, k2, angle)
% GRID5lrec : Generate 5-point finite difference on a rectangular mesh.
%
% [A,xy] = GRID5REC(k) returns a k1*k2-by-k1*k2 symmetric positive definite 
%        matrix A with the structure of the k-by-k 5-point grid,
%        and an array xy of coordinates for the grid points.

a = blockdiags ([-1 4 -1], -1:1, k1, k1);
I = speye (k1, k1);
A = blockdiags ([-I a -I], -1:1, k2, k2);
A = diag(diag(A)) - A;


[x,y] = meshgrid(1:k2, 1:k1);

rad = angle*pi/180;

newX = x * cos(rad) - y * sin(rad);
newY = y * cos(rad) + x * sin(rad);

xy    = zeros(k1*k2,2);
xy(:,1) = newX(:);
xy(:,2) = newY(:);

end