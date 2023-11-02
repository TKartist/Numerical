function [Pts_spirals,Pts_clusterin,Pts_corn,Pts_halfk,Pts_fullmoon,Pts_out] = getPoints()
% Function to get the coordinate list of various pointclouds 
% ----------------------------------------------------------
% Copyright (c) 2013, Jeroen Kools
% 
% Modified for academic purposes by D. Pasadakis
% dimosthenis.pasadakis@usi.ch
% ICS, USI.

clear all;
close all;

figure;
hold on;
dotsize = 12;
 colormap([1 0 .5;   % magenta
           0 0 .8;   % blue
           0 .6 0;   % dark green
           .3 1 0]); % bright green

subplot(231);
Pts_spirals = twospirals();
scatter(Pts_spirals(:,1), Pts_spirals(:,2), dotsize,'k'); axis equal;
% scatter(Pts_spirals(:,1), Pts_spirals(:,2), dotsize, Pts_spirals(:,3)); axis equal; % visualization 
% axis off;
title('Two spirals');

subplot(232);
Pts_clusterin = clusterincluster();
scatter(Pts_clusterin(:,1), Pts_clusterin(:,2), dotsize,'k'); axis equal;
% scatter(Pts_clusterin(:,1),Pts_clusterin(:,2), dotsize, Pts_clusterin(:,3)); axis equal; % visualization 
% axis off;
title('Cluster in cluster');

subplot(233);
Pts_corn = corners();
scatter(Pts_corn(:,1), Pts_corn(:,2), dotsize,'k'); axis equal;
% scatter(Pts_corn(:,1),Pts_corn(:,2), dotsize, Pts_corn(:,3)); axis equal; % visualization 
% axis off;
title('Corners');

subplot(234);
Pts_halfk = halfkernel();
scatter(Pts_halfk(:,1), Pts_halfk(:,2), dotsize,'k'); axis equal;
% scatter(Pts_halfk(:,1),Pts_halfk(:,2), dotsize, Pts_halfk(:,3)); axis equal; % visualization 
% axis off;
title('Half-kernel');

subplot(235);
Pts_fullmoon = crescentfullmoon();
scatter(Pts_fullmoon(:,1), Pts_fullmoon(:,2), dotsize,'k'); axis equal;
% scatter(Pts_fullmoon(:,1),Pts_fullmoon(:,2), dotsize,Pts_fullmoon(:,3)); axis equal; % visualization 
% axis off;
title('Crescent & Full Moon');

subplot(236);
Pts_out = outlier();
scatter(Pts_out(:,1), Pts_out(:,2), dotsize,'k'); axis equal;
% scatter(Pts_out(:,1),Pts_out(:,2),dotsize,Pts_out(:,3)); axis equal; % visualization 
% axis off;
title('Outlier');

end