% RUNME : Demonstrate the graph of coauthors from Householder 1993.

load housegraph;

% A    is the adjacency matrix.
% prcm is a permutation; any permutation could be substituted.
% name is the vector of people's names.
% xy   is just xy coords of points on the unit circle (and the origin).

  
clc;
more off;
format compact;
disp('  ');
disp('                       On a Matrix and Its Graph');
disp('  ');
disp('At the 1993 Householder Symposium on Numerical Algebra in Lake Arrowhead,');
disp('Nick Trefethen posted a flip chart and invited everyone present to write');
disp('their name on it, and to draw lines connecting their name with the names');
disp('of all their coauthors.  The diagram grew denser throughout the week; at');
disp('the end it was a graph with 104 vertices (or people) and 211 edges. ');
disp(' ');
disp('Just for fun we typed the graph into Matlab.  Here''s the result....');
disp('  ');
disp('               [Hit space to continue] ');
pause;

figure(1);
clf reset;
spy(A);
title('Coauthor Matrix');
drawnow;

figure(2);
clf reset;
drawit;

disp('  ');
disp('The adjacency matrix is symmetric with 104 rows and columns, and');
disp('211 nonzeros above the diagonal; all the nonzeros have value 1.  ');

disp('  ');
disp('               [Hit space to continue] ');
pause;

disp('  ');
disp('Which column has the highest nonzero count?');
disp('  ');

echo on
[count,column] = max(sum(A))

name(column,:)

echo off

disp('  ');
disp('               [Hit space to continue] ');
pause;

clc;
disp('Here''s a bandwidth-reducing order of the matrix. ');

p = symrcm(A);
figure(1);
spy(A(p,p));
title('Reverse Cuthill-McKee Order');
drawnow;

disp('  ');
disp('I don''t know what to conclude from this!');

disp('  ');
disp('               [Hit space to continue] ');
pause;

clc;
disp('Powers of the matrix give information about paths in the graph.');
disp('Squaring the matrix gives paths of length 1 and 2.');

figure(1);
AA = A^2;
spy(AA);
title('A^2');

disp('  ');
disp('               [Hit space to continue] ');
pause;
disp('  ');

disp('Have Gene Golub and Cleve Moler ever been coauthors?');

disp('  ');
disp('               [Hit space to continue] ');
pause;
disp('  ');

echo on;
A(Golub,Moler)

echo off;

disp('  ');
disp('No.');
disp('But how many coauthors do they have in common?');

disp('  ');
disp('               [Hit space to continue] ');
pause;
disp('  ');

echo on;
AA = A^2;
AA(Golub,Moler)

echo off;

disp('  ');
disp('And who are those common coauthors?  (Matlab hackers raise your hands.)');

disp('  ');
disp('               [Hit space to continue] ');
pause;
disp('  ');

echo on;
name( find ( A(:,Golub) .* A(:,Moler) ), :)

echo off;

disp('  ');
disp('               [Hit space to continue] ');
pause;

clc;

disp('If we keep taking powers of the matrix, ...');

p = 2;
while ~all(AA(1,:))
    AA = AA*A;
    spy(AA);
    p = p+1;
    title(['A^' int2str(p)]);
    pause(1);
end;

disp('  ');
disp('... we can find the length of the longest path ');
disp('from Gene Golub to anybody, which is the power that');
disp('first has row 1 full, ...');

disp('  ');
disp('               [Hit space to continue] ');
pause;
disp('  ');

while ~all(all(AA))
    AA = AA*A;
    spy(AA);
    p = p+1;
    title(['A^' int2str(p)]);
    pause(1);
end;

disp('... and also the diameter of the graph, which is ');
disp('the power that first has the whole matrix full.');

disp('  ');
disp('               [Hit space to continue] ');
pause;

clc;

disp('  ');
disp('Finally, we try a minimum degree reordering of the matrix');
disp('and discover its true nature as, of course, ....');
disp('  ');

p = symamd(A);
spy(A(p,p));
title('The (Lake) Arrowhead Matrix');
pause(8);

disp('  ');
disp('Thanks to Tony Chan and Gene Golub for the meeting,');
disp('          Rob Schreiber and Barry Smith for helping count edges,');
disp('          and all concerned for a wonderful week.');
disp('        - John Gilbert, Cleve Moler, and Nick Trefethen ');
disp('  ');
