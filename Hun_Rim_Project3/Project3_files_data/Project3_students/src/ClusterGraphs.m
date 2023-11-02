% Cluster 2D real-world graphs with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

load airfoil1.mat
% load barth.mat
% load grid2.mat
% load 3elt.mat

% Specify the number of clusters
K = 4;
% Read graph
W   = Problem.A;
Pts = Problem.aux.coord;
n   = size(Pts,1);
% dummy var
dummy_map = ones(n,1);

figure;
spy(W)
title('Adjacency matrix')
%% 2.1) Create the Laplacian matrix and plot the graphs using the 2nd and 3rd eigenvectors
% \----------------------------/
%     Your implementation
% \----------------------------/

% Eigen-decomposition
% \----------------------------/
%     Your implementation
% \----------------------------/

% Plot and compare
figure;
subplot(1,2,1);
gplot(W,Pts)
xlabel('Nodal coordinates')
subplot(1,2,2);
gplot(W,Pts)
xlabel('TODO: Plot using Eigenvector coordinates')

%% 2.2) Cluster each graph in K = 4 clusters with the spectral and the 
%      k-means method, and compare yourresults visually for each case.

% \----------------------------/
%     Your implementation
% \----------------------------/


% Compare and visualize
figure;
subplot(1,2,1);
gplotmap(W,Pts,dummy_map)
title('TODO: Plot the spectral clusters')
subplot(1,2,2);
gplotmap(W,Pts,dummy_map)
title('TODO: Plot the K-means clusters')

%% 2.3) Calculate the number of nodes per cluster
[Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,dummy_map,dummy_map);