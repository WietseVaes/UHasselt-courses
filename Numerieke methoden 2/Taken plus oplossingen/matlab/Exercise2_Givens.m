% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2019

clear 
clc
%% GIVENS ROTATIONS

% A = [4 1 -2 2; 1 2 0 1; -2 0 3 2; 2 1 -2 -1];
% A = [1 2 0; 1 1 1; 2 1 0];

A = [ 1 2 ; 0 3; 0 4];
n  = size(A,1);

U = A;
Q = eye(n);

for i=1:n-1 %Columns
    for j= i+1:n % rows (to be zero) 
        
        if U(j,i) ~= 0 % Only for non-zero
            r = sqrt(U(i,i)^2+U(j,i)^2);
            c = U(i,i)/r;
            s = U(j,i)/r;
            
            % Rotation matrix
            G = eye(n);
            G([i,j],[i,j]) = [c s; -s c];   
            
            % Matrices QU (see definition)
            U = G*U;
            Q = Q*G';
        end       
    end
end

%% Checking it

A1 = Q*U;
difer = norm(A1-A);
disp(difer)

[Q1,U1] = qr(A);


