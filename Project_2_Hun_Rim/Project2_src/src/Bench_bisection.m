function Bench_bisection()
% Compare various graph bisection algorithms
%
% D.P & O.S for Numerical Computing at USI

% add the necessaty paths
addpaths_GP;

warning('off','all');
picture = 1;

format compact;

disp('          *********************************************')
disp('          ***      Graph bisection benchmark        ***');
disp('          *********************************************')
disp(' ');
disp(' The file "Toy_meshes.mat" contains sample meshes with coordinates.');
disp(' ');

% load meshes
load Toy_meshes;
whos;


for nmesh = 1:8
    close all; clf reset;
    
    if (nmesh==1)
        disp(' ');
        disp(' Function "grid5rec" produces a rectangular grid:');
        disp(' ');
        disp('[A,xy] = grid5rec(12, 100);');
        disp(' ');
        [W,coords] = grid5rec(12, 100);
    end
    if (nmesh==2)
        disp(' ');
        disp(' Function "grid5rec" produces a rectangular grid:');
        disp(' ');
        disp('[A,xy] = grid5rec(100, 12);');
        disp(' ');
        [W,coords] = grid5rec(100, 12);
    end
    if (nmesh==3)
        disp(' ');
        disp(' Function "grid5recRotate" produces a rotated rectangular grid:');
        disp(' ');
        disp('[A,xy] = grid5recRotate(100, 12, -45);');
        disp(' ');
        [W,coords] = grid5recRotate(100, 12, -45);
    end
    if (nmesh==4)
        disp(' ');
        disp(' Function "gridt" produces a triangular grid:');
        disp(' ');
        disp(' (See also grid5, grid7, grid9, grid3d, grid3dt.)');
        disp(' ');
        disp('[A,xy] = gridt(50);');
        disp(' ');
        [W,coords] = gridt(50);
    end
    if (nmesh==5)
        disp(' ');
        disp(' Function "gridt" produces a triangular grid:');
        disp(' ');
        disp(' (See also grid5, grid7, grid9, grid3d, grid3dt.)');
        disp(' ');
        disp('[A,xy] = grid9(40);');
        disp(' ');
        [W,coords] = grid9(40);
    end
    if (nmesh==6)
        W       = Smallmesh;
        coords = Smallmesh_coords;
    end
    if (nmesh==7)
        W       = Tapir;
        coords  = Tapir_coords;
    end
    if (nmesh==8)
        W       = Eppstein;
        coords  = Eppstein_coords;
    end
    
    
    disp(' ');
    disp('          *********************************************')
    disp('          ***        Various Bisection Methods      *** ');
    disp('          *********************************************')
    disp(' ');
    disp(' ');
    
    
    if (nmesh==1)
        disp('A rectangular  grid5rec(12, 100) mesh');
    end
    if (nmesh==2)
        disp('A rectangular  grid5rec(100,12) mesh');
    end
    if (nmesh==3)
        disp('A rectangular  grid5rec(100,12) mesh, rotated by 45 degree');
    end
    if (nmesh==4)
        disp('A triangular gridt(50) mesh');
    end
    if (nmesh==5)
        disp('A square gridt9(40) mesh');
    end
    if (nmesh==6)
        disp(' The Smallmesh');
    end
    if (nmesh==7)
        disp('The Tapir mesh');
    end
    if (nmesh==8)
        disp('The Eppstein mesh');
    end
    
    figure(1)
    disp('Plot the graph using gplotg(W,coords);');
    disp('  ');
    gplotg(W,coords);
    nvtx  = size(W,1);
    nedge = (nnz(W)-nvtx)/2;
    xlabel([int2str(nvtx) ' vertices, ' int2str(nedge) ' edges'],'visible','on');
    
    disp(' Hit space to continue ...');
    pause;
    
    disp(' 1. Coordinate bisection of a mesh.  ');
    figure(2)
    [p1,p2] = bisection_coordinate(W,coords,picture);
    [cut_coord] = cutsize(W,p1);
    disp('Space to continue ...');
    pause;
    
    figure(3)
    disp(' ');
    disp(' 2. A multilevel method from the "Metis 5.0.2" package.');
    disp(' This will only work if you have Metis and its Matlab interface.');
    disp('  ');
    [p1,p2] = bisection_metis(W,coords,picture);
    [cut_metis] = cutsize(W,p1);
    disp('  ');
    disp(' Hit space to continue ...');
    pause;
    
    
    disp(' ');
    disp(' 3. Spectral partitioning, which uses the second eigenvector of');
    disp(' the Laplacian matrix of the graph, also known as the "Fiedler vector".');
    disp('  ');
    figure(4)
    [p1,p2] = bisection_spectral(W,coords,picture);
    [cut_spectral] = cutsize(W,p1);
    disp('  ');
    disp(' Hit space to continue ...');
    pause;
    
    figure(5)
    disp(' ');
    disp(' 4. Inertial partitioning, which uses the coordinates to find');
    disp(' a separating line in the plane.');
    disp('  ');
    [p1,p2] = bisection_inertial(W,coords,picture);
    [cut_inertial] = cutsize(W,p1);
    disp('  ');
    disp(' Hit space to continue ...');
    pause;
    
    close all;
    format;
    
    disp(' ');
    disp('          *****************************************************************')
    disp('          ***                    Bisection Benchmark                    *** ');
    disp('          ***        D.P. & O.S. for Numerical Computing, USI Lugano    *** ');
    disp('          *****************************************************************')
    disp(' ');
    disp(' ');
    
    
end
