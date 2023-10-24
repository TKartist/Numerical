% 
%                      On a Matrix and Its Graph
% 
% At the 1993 Householder Symposium on Numerical Algebra in Lake Arrowhead,
% Nick Trefethen posted a flip chart and invited everyone present to write
% their name on it, and to draw lines connecting their name with the names
% of all their coauthors.  The diagram grew denser throughout the week; at
% the end it was a graph with 104 vertices (or people) and 211 edges. 
% 
% A graph is a sparse matrix, so just for fun we typed the graph into Matlab 
% and looked at it in a few different ways.  You can say "runme" to Matlab 
% to see the results.
% 
% The original flip chart is now framed on the wall of Nick's office at
% Cornell.  He promises to bring it along to Householder 2023.
% 
% - John Gilbert, Cleve Moler, Nick Trefethen
%   with thanks to Rob Schreiber, Barry Smith, and 99 others.
% 
% ----------------------------------------------------------------------
% List of files in matlab/householder:
% 
% README.m           This file.
% 
% runme.m            Matlab script to show off the matrix and the graph. 
% 
% drawit.m           Matlab script just to draw the graph.
% 
% graph.ps           Black-and-white postscript picture of the graph.
%
% housegraph.mat     The raw data, as follows:
% 
%      A     is the 104x104 adjacency matrix of the graph.
%      xy    is the array of vertex coordinates for the picture.
%      name  is a character matrix with 104 rows, each row giving the
%            name of the person associated with a vertex.
%      Every person's name is also a scalar variable whose value is 
%            that person's vertex number; for example, 
%            Stewart = 77 and name(77,:) = 'Stewart'.
%      prcm  is a permutation (based on reverse Cuthill-McKee) 
%            to reorder the graph for the picture.

help README
