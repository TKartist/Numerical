% DRAWIT  Script to plot the graph of coauthors from Householder 93.

if ~exist('prcm') 
    load housegraph;
end;

% A    is the adjacency matrix.
% name is the vector of people's names.
% xy   is just xy coords of points on the unit circle (and the origin).

nfolks = max(size(A));

clf 
gplot(A,xy);
axis off;
x = xy(:,1) * 1.05;
y = xy(:,2) * 1.05;
x(1) = .08;         % Put names(1) in the center of the circle.
y(1) = .06;
h = text(x,y,name);

for k = 2:nfolks    % Shrink the font for the other names, and rotate them.
    set(h(k),'fontsize',10);
    set(h(k),'rotation',180/pi*atan2(y(k),x(k)));
end
