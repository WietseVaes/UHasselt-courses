%
% This routine constructs the large matrices and vector.
%
% The element matrices and vectors are also dealt with.
%
%
% First the internal element contributions
%
% First Initialisation of large discretisation matrix, right-hand side vector

S 		= sparse(n,n); % stiffness matrix

M 		= sparse(n,n); 

Cx 		= sparse(n,n); 

Cy		= sparse(n,n); 

f 		= zeros(n,1); % right-hand side vector

%
% Treatment of the internal (triangular) elements
%

for i = 1:length(elmat(:,1)) % for all internal elements
	GenerateElementMatrix; % Selem, Melem, Cxelem & Cyelem 
    for ind1 = 1:topology
        for ind2 = 1:topology
            S(elmat(i,ind1),elmat(i,ind2))	= S(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
        end
    end
	GenerateElementVector; % felem
    for ind1 = 1:topology
        f(elmat(i,ind1)) = f(elmat(i,ind1)) + felem(ind1);
    end
end

