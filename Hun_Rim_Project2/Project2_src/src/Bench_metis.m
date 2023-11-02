function [cut_recursive,cut_kway] = Bench_metis(picture)
% Compare recursive bisection and direct k-way partitioning,
% as implemented in the Metis 5.0.2 library.
%
% D.P & O.S for Numerical Computing at USI


%  Add necessary paths
addpaths_GP;

% Graphs in question
% load 'helicopter.mat' ;
% load 'skirt.mat';

 
% Steps
% 1. Initialize the cases

[h] = load('helicopter.mat');
[s] = load('skirt.mat');

 hW = h.Problem.A;
 hC = h.Problem.aux.coord;

 sW = s.Problem.A;
 sC = s.Problem.aux.coord;
% 2. Call metismex to
%     a) Recursively partition the graphs in 16 and 32 subsets.
 [~, edgecutRecH16] = metismex('PartGraphRecursive', hW, 16);
 [mapRecH32, edgecutRecH32] = metismex('PartGraphRecursive', hW, 32);
 [~, edgecutRecS16] = metismex('PartGraphRecursive', sW, 16);
 [mapRecS32, edgecutRecS32] = metismex('PartGraphRecursive', sW, 32);
%     b) Perform direct k-way partitioning of the graphs in 16 and 32 subsets.
 [~, edgecutKH16] = metismex('PartGraphKWay', hW, 16);
 [mapKH32, edgecutKH32] = metismex('PartGraphKWay', hW, 32);
 [~, edgecutKS16] = metismex('PartGraphKWay', sW, 16);
 [mapKS32, edgecutKS32] = metismex('PartGraphKWay', sW, 32);
% 3. Visualize the results for 32 partitions
figure(1)
gplotmap(hW, hC, mapRecH32);
title('32 - recursive bisection Helicopter');
rotate3d on;
pause;
figure(2)
gplotmap(hW, hC, mapKH32);
title('32 - way direct bisection Helicopter');
rotate3d on;
pause;

figure(3)
gplotmap(sW, sC, mapRecS32);
title('32 - recursive bisection Skirt');
rotate3d on;
pause;

figure(4)
gplotmap(sW, sC, mapKS32);
title('32 - way direct bisection Skirt');
rotate3d on;
pause;


fprintf('%6d %6d %10d %6d %10d %6d %10d %6d\n',edgecutRecH16,edgecutRecS16,...
    edgecutKH16,edgecutKS16,edgecutRecH32,edgecutRecS32,edgecutKH32,edgecutKS32);
end
