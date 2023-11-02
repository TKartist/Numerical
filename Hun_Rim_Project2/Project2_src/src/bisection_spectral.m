function [part1,part2] = bisection_spectral(A,xy,picture)
    % 
    % disp('Numerical Computing @ USI Lugano:');
    % disp('Implement spectral bisection');
    % disp(' ');
    
    % 1. Construct the Laplacian.
    G = graph(A,'omitselfloops');
    L = laplacian(G);
    
    % 2. the correspoding vector of second smallest eigen value
    [V, ~] = eigs(L, 2, 'SM'); 
    
    % 3. Label the vertices with the components of the Fiedler vector.
    w = V(:,2);
    % 4. Partition them around their median value, or 0.
    threshold = median(w);
    
    part1 = find(w < threshold);
    part2 = find(w >= threshold);
    
    if picture == 1
        gplotpart(A,xy,part1);
        title('Spectral bisection using the Fiedler Eigenvector');
    end

end


