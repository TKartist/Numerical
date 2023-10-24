function [part1,part2] = bisection_metis(A,xy,picture)
% bisection_metis : Partition a graph using Metis default method.
%
% [part1,part2] = bisection_metis(A,xy,picture) returns a list of the vertices on one side of
%     a partition obtained by Metis 4.0 applied to the graph of A.
%     
% Optional arguments:
%   bisection_metis(A,xy,1) draws a picture of the partitioned graph,
%                   using the rows of xy as vertex coordinates.
%
% See also external/metismex for all the Metis options. 


map = metismex('PartGraphRecursive',A,2);
[part1,part2] = other(map);

if picture
    gplotpart(A,xy,part1);
    title('Metis bisection')
end


end