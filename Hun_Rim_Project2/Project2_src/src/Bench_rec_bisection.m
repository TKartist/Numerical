% Benchmark for recursively partitioning meshes, based on various
% bisection approaches
%
% D.P & O.S for Numerical Computing at USI

% add necessary paths
addpaths_GP;
nlevels_a = 3;
nlevels_b = 4;

fprintf('       *********************************************\n')
fprintf('       ***  Recursive graph bisection benchmark  ***\n');
fprintf('       *********************************************\n')

% load cases
cases = {
     'mesh1e1.mat',
     'bodyy4.mat',
     'de2010.mat',
     'biplane-9.mat',
     'L-9.mat',
    };

nc = length(cases);
maxlen = 0;
for c = 1:nc
    if length(cases{c}) > maxlen
        maxlen = length(cases{c});
    end
end

for c = 1:nc
    fprintf('.');
    sparse_matrices(c) = load(cases{c});
end


fprintf('\n\n Report Cases         Nodes     Edges\n');
fprintf(repmat('-', 1, 40));
fprintf('\n');
for c = 1:nc
    spacers  = repmat('.', 1, maxlen+3-length(cases{c}));
    [params] = Initialize_case(sparse_matrices(c));
    fprintf('%s %s %10d %10d\n', cases{c}, spacers,params.numberOfVertices,params.numberOfEdges);
end

%% Create results table
fprintf('\n%7s %16s %20s %16s %16s\n','Bisection','Spectral','Metis 5.0.2','Coordinate','Inertial');
fprintf('%10s %10d %6d %10d %6d %10d %6d %10d %6d\n','Partitions',8,16,8,16,8,16,8,16);
fprintf(repmat('-', 1, 100));
fprintf('\n');


for c = 1:nc
    spacers = repmat('.', 1, maxlen+3-length(cases{c}));
    fprintf('%s %s', cases{c}, spacers);
    sparse_matrix = load(cases{c});
    

    % Recursively bisect the loaded graphs in 8 and 16 subgraphs.
    % Steps
    % 1. Initialize the problem
    [params] = Initialize_case(sparse_matrices(c));
    W      = params.Adj;
    coords = params.coords;    
    % 2. Recursive routines
    % i. Spectral
    % p = 8
    SR8 = rec_bisection(@bisection_spectral, 3, W, coords, 0);
    % p = 16
    SR16 = rec_bisection(@bisection_spectral, 4, W, coords, 0);
    % ii. Metis
    % p = 8
    Metis8 = rec_bisection(@bisection_metis, 3, W, coords, 0);
    % p = 16
    Metis16 = rec_bisection(@bisection_metis, 4, W, coords, 0);
    % iii. Coordinate    
    % p = 8
    Coord8 = rec_bisection(@bisection_coordinate, 3, W, coords, 0);
    % p = 16
    Coord16 = rec_bisection(@bisection_coordinate, 4, W, coords, 0);
    % iv. Inertial
    % p = 8
    Inertial8 = rec_bisection(@bisection_inertial, 3, W, coords, 0);
    % p = 16
    Inertial16 = rec_bisection(@bisection_inertial, 4, W, coords, 0);
    % 3. Calculate number of cut edges
    spectral8cutsize = cutsize(W, SR8);
    spectral16cutsize = cutsize(W, SR16);

    metis8cutsize = cutsize(W, Metis8);
    metis16cutsize = cutsize(W, Metis16);

    coords8cutsize = cutsize(W, Coord8);
    coords16cutsize = cutsize(W, Coord16);

    inertial8cutsize = cutsize(W, Inertial8);
    inertial16cutsize = cutsize(W, Inertial16);
    % 4. Visualize the partitioning result
    if c == 3
        figure(1)
        gplotmap(W, coords, SR8);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(2)
        gplotmap(W, coords, SR16);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(3)
        gplotmap(W, coords, Metis8);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(4)
        gplotmap(W, coords, Metis16);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(5)
        gplotmap(W, coords, Coord8);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(6)
        gplotmap(W, coords, Coord16);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(7)
        gplotmap(W, coords, Inertial8);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        figure(8)
        gplotmap(W, coords, Inertial16);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
    end
    
    fprintf('%6d %6d %10d %6d %10d %6d %10d %6d\n',spectral8cutsize,spectral16cutsize,...
    metis8cutsize,metis16cutsize,coords8cutsize,coords16cutsize,inertial8cutsize,inertial16cutsize);
    
end