function [part1,part2] = bisection_inertial(A,xy,picture)
% bisection_inertial: Inertial partition of a graph.

    % disp('Numerical Computing @ USI Lugano:');
    % disp('Implement inertial bisection');
    % disp(' ');

    % 1. Calculate the center of mass (lets call it 'com').
    com = mean(xy);

    % 2. Construct the matrix M.
    Mxx = 0;
    Myy = 0;
    Mxy = 0;
    
    for i = 1:length(xy)
        Mxy = Mxy + (xy(i,1)-com(1))*(xy(i,2)- com(2));
        Myy = Myy + (xy(i,2)-com(2))^2;
        Mxx = Mxx + (xy(i,1)-com(1))^2;
    end
    
    M = [Mxx, Mxy; Mxy, Myy];
    
    % 3. Calculate the smallest eigenvector associated with M.
    [Eigenvector, Eigenvalue] = eigs(M);
    [~, minIndex] = min(diag(Eigenvalue));
    smallest = Eigenvector(:, minIndex);
    
    % 4. Find the line L on which the center of mass lies.
    L = smallest(1) * (xy(:,2) - com(2)) - smallest(2) * (xy(:,1) - com(1));
    
    % 5. Partition the points around the line L.
    medianL = median(L);
    part1 = find(L < medianL);
    part2 = find(L >= medianL);

    if picture == 1
        gplotpart(A,xy,part1);
        title('Inertial bisection using Fiedler Eigenvector');
    end
end
