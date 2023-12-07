function [A_aug,h,c_aug] = standardize(type,A,h,c,m,sign)
% return arguments are:
% (1) A_aug = augmented matrix A, containing also the surplus and slack variables
% (2) c_aug = augmented coefficients vector c (check compatibility of dimensions with A)
% (3) h, right hand side vector (remember to flip the signs when changing the inequalities)

aug_matrix = eye(m); % matrix corresponding to the slack/surplus variables

if(strcmp(type,'max'))
    for i = 1:m
        if(sign(i)==1)
            % Using a surplus instead of a slack variable
            aug_matrix(i,:) = -aug_matrix(i,:);
        end
    end
elseif(strcmp(type,'min'))
    for i = 1:m
        if(sign(i)==-1)
            % Using a slack instead of a surplus variable
            aug_matrix(i,:) = -aug_matrix(i,:);
        end
    end
else
    error('Incorrect type specified. Choose either a maximisation (max) or minimisation (min) problem.')
end

% TODO: Correction on the sign of h for auxiliary problem (we want to ensure that h>=0, but we need to flip all the signs)
for i = 1:m 
    if(h(i)<0)
        %A(i,:) = 
        %h(i,:) = 
        %aug_matrix(i,:) = 
    end
end

c_aug = [c, zeros(1,m)];
if(strcmp(type,'max'))
    % TODO: Extend matrix A by adding the slack variables    
    %A_aug = 
elseif(strcmp(type,'min'))
	% TODO: Extend matrix A by adding the surplus variables
    %A_aug = 
else
    error('Incorrect type specified. Choose either a maximisation (max) or minimisation (min) problem.')
end

end