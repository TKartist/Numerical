function [S] = similarityfunc(Pts, sigma)
% Create the similarity matrix S from the coordinate list of the input
% points
% dimosthenis.pasadakis@usi.ch
% ICS, USI.

if nargin < 2
    n = length(Pts(:,1));
    sigma = log(n);
end

fprintf('----------------------------\n');
fprintf('Gaussian similarity function\n');
fprintf('----------------------------\n');
S = squareform(pdist(Pts));
S = exp(-S.^2 ./ (2*sigma^2));

end