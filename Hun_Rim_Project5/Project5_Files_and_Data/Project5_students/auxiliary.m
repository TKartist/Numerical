function [B,D,c_B,c_D,x_B,x_D,index_B,index_D] = auxiliary (A_aug,c_aug,h,m,n)
% The auxiliary problem is always a minimization problem
 
% The output will be: B and D (basic and nonbasic matrices), c_B and c_D (subdivision of the coefficient vector in basic and nonbasic parts), x_B
% and x_D (basic and nonbasic variables) and index_B and index_D (to keep track of the variables indices)

% Redefine the problem by introducing the artificial variables required by
% the auxiliary problem (the objective function has to reach value 0)
A_aug = [A_aug, eye(m)];
c_aug = [c_aug, zeros(1,m)];  % original objective function coefficients
c_aux = [zeros(1,n+m), ones(1,m)];  % auxiliary c of minimization problem
index = 1:n+2*m;    % index to keep track of the different variables

% Defining the basic elements and the nonbasic elements
B   = A_aug(:,(n+m+1):(n+2*m));   % basic variables
D   = A_aug(:,1:(n+m));           % nonbasic variables
c_Baux = c_aux(1,(n+m+1):(n+2*m));
c_Daux = c_aux(1,1:(n+m));
c_B = c_aug(1,(n+m+1):(n+2*m));
c_D = c_aug(1,1:(n+m));
x_B = h;
x_D = zeros((n+m),1);
index_B = index(1,(n+m+1):(n+2*m));
index_D = index(1,1:(n+m));

nIter = 0;
z = c_Baux*x_B;
itMax = factorial(2*m+n)/(factorial(n+m)*factorial(m));

% Compute B^{-1}*D and B^{-1}*h
BiD = B\D;
Bih = B\h;

% Compute reduced cost coefficients
r_D = c_Daux - c_Baux*BiD;

while(z~=0)
    
    % Find nonnegative index
    idxIN = find(r_D==min(r_D));
    % Using Bland's rule to avoid cycling
    if(size(idxIN,2)>1)
        idxIN = min(idxIN);
    end
    in = D(:,idxIN);
    c_inaux = c_Daux(1,idxIN);
    c_in = c_D(1,idxIN);
    index_in = index_D(1,idxIN);
    
    % Evaluating the coefficients ratio
    inRatio = BiD(:,idxIN);
    ratio = Bih./inRatio;
    
    % Find the smallest ratio
    for i = 1:size(ratio,1) % Eliminating negative ratios
        if(ratio(i,1)<0)
            ratio(i,1) = Inf;
        end
    end
    idxOUT = find(ratio==min(ratio));
    % Using Bland's rule to avoid cycling
    if(size(idxOUT,1)>1)
        idxOUT = min(idxOUT);
    end
    out = B(:,idxOUT);
    c_outaux = c_Baux(1,idxOUT);
    c_out = c_B(1,idxOUT);
    index_out = index_B(1,idxOUT);
    
    % Update the matrices by exchanging the columns
    B(:,idxOUT) = in;
    D(:,idxIN) = out;
    c_Baux(1,idxOUT) = c_inaux;
    c_Daux(1,idxIN) = c_outaux;
    c_B(1,idxOUT) = c_in;
    c_D(1,idxIN) = c_out;
    index_B(1,idxOUT) = index_in;
    index_D(1,idxIN) = index_out;

    % Compute B^{-1}*D and B^{-1}*h
    BiD = B\D;
    Bih = B\h;
    
    % Compute reduced cost coefficients
    r_D = c_Daux - c_Baux*BiD;
    
    % Detect inefficient loop if nIter > total number of basic solutions
    nIter = nIter + 1;
    if(nIter>itMax)
       error('The original LP problem does not admit a feasible solution.');
    end

    x_B = Bih - BiD*x_D;
    z = c_Baux*x_B;
    
end

check = index_D<(n+m+1);
D = D(:,check);
index_D = index_D(1,check);
c_D = c_D(1,check);
x_D = x_D(check,1);

end