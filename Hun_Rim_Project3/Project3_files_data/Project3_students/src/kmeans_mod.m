function [D,x] = kmeans_mod(Y,K,n)
% Function to perform k-means clustering
% --------------------------------------
% Input
% Y: data matrix
% K: # of clusters
% n: number of points
% Output
% D: centroids
% x: assignment(indicator) vector


cand = unique(round(10000*Y)/10000,'rows');
c = datasample(cand,K,'Replace',false); % pick K random input pts as initial centroids
D = c;
x = zeros(size(Y,1),1);
D_old = inf*ones(size(D));
count = 1;
while norm(D - D_old) > 0.00001 & count < 500
    D_old = D;
    % Assign points to clusters
    for i = 1:n
        min = inf;
        for k = 1:K
            dist = norm(Y(i,:) - D(k,:));
            if dist < min
                min = dist;
                x(i) = k;
            end
        end
    end
    
    % Update centroid locations
    for k = 1:K
        ind = find(x == k);
        if length(ind) == 1
            D(k,:) = Y(ind,:);
        else
            D(k,:) = mean(Y(ind,:));
        end
    end
    
    count = count + 1;
end

for i = 1:n
    min = inf;
    for k = 1:K
        dist = norm(Y(i,:) - D(k,:));
        if dist < min
            min = dist;
            x(i) = k;
        end
    end
end
end

