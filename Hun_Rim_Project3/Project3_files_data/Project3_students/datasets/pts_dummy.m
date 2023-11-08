function[Pts_halfk] = pts_dummy()

figure;
hold on;
dotsize = 12;
 colormap([1 0 .5;   % magenta
           0 0 .8;   % blue
           0 .6 0;   % dark green
           .3 1 0]); % bright green

subplot(111);
Pts_halfk = halfkernel();
scatter(Pts_halfk(:,1), Pts_halfk(:,2), dotsize,'k'); axis equal;
% scatter(Pts_halfk(:,1),Pts_halfk(:,2), dotsize, Pts_halfk(:,3)); axis equal; % visualization 
% axis off;
title('Half-kernel');


end