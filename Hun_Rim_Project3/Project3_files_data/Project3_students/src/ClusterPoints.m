% Cluster 2D pointclouds with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

% Specify the number of clusters
K = 2;

%% 1.1) Get coordinate list from pointclouds
% \----------------------------/
%     Your implementation
% \----------------------------/
% Coords used in this script
Pts_dummy = [rand(1,100)*5;rand(1,100)*5]';
figure;
scatter(Pts_dummy(:,1),Pts_dummy(:,2))
title('TODO: Get the coordinate list from the function getPoints.m')

n = size(Pts_dummy,1);
% dummy vars
dummy_map     = ones(n,1);
dummy_epsilon = 1;

% Create Gaussian similarity function
[S] = similarityfunc(Pts_dummy(:,1:2));

%% 1.2) Find the minimal spanning tree of the full graph. Use the information
%      to determine a valid value for epsilon        
% \----------------------------/
%     Your implementation
% \----------------------------/

%% 1.3) Create the epsilon similarity graph
[G] = epsilonSimGraph(dummy_epsilon,Pts_dummy);
% \----------------------------/
%     Your implementation
% \----------------------------/

%% 1.4) Create the adjacency matrix for the epsilon case 
% \----------------------------/
%     Your implementation
% \----------------------------/
W = rand(n,n);

figure;
gplotg(W,Pts_dummy(:,1:2))
title('TODO: Visualize the correct adjacency matrix')
%% 1.5) Create the Laplacian matrix and implement spectral clustering
[L,Diag] = CreateLapl(W);

% \----------------------------/
%     Your implementation
% \----------------------------/

% Cluster rows of eigenvector matrix of L corresponding to K smallest
% eigennalues. Use kmeans for that.
[D_spec,x_spec]     = kmeans_mod(Pts_dummy,K,n);

%% 1.6) Run K-means on input data
% \----------------------------/
%     Your implementation
% \----------------------------/
[D_kmeans,x_kmeans] = kmeans_mod(Pts_dummy,K,n);

%% 1.7) Visualize spectral and k-means clustering results
figure;
subplot(1,2,1)
gplotmap(W,Pts_dummy,dummy_map)
title('TODO: Plot the spectral clusters')
subplot(1,2,2)
gplotmap(W,Pts_dummy,dummy_map)
title('TODO: Plot the K-means clusters')