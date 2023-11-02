function [G] = kNNSimGraph(Pts)    
% Construct a k-nearest neighbors similarity graph
% Input
% k      : # of neighbors
% Pts    : coordinate list of the sample 
% 
% Output
% G      : the kNN similarity matrix


n = length(Pts(:,1));
kn = ceil(2*log(n));


fprintf('kNN similarity graph\n');
    for i = 1:n
        s = repmat(Pts(i,:),n,1);
        d = Pts - s;
%         e = diag(d*d');
        e = sum(d.^2,2);
        [val,ind] = sort(e);
        ind(1) = [];
        nbrs = ind(1:kn);
        G(i,nbrs) = 1;
        G(nbrs,i) = 1;
    end
    
end