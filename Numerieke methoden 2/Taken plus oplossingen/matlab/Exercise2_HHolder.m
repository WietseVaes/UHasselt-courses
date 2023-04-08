% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2019
%
clc
clear
close all


A = [4 1 -2 2;
    1 2 0 1;
    -2 0 3 2;
    2 1 -2 -1];

[Q,U] = Householder_MB(A)

% Check 
[Q_ref, U_ref] = qr(A)
errorQ = norm(Q_ref-Q) %signs!!!
errorU = norm(U_ref-U)


%% -------------------------------
function [Q,U] = Householder_MB(A)
col = size(A,2);
Q   = eye(col);

for k = 1:col-1
    
    x  = A(k:end,k);
    x = x + sign(x(1))*norm(x)*eye(length(x),1);
    x = x./norm(x);
    
    H = eye(col);
    H(k:end,k:end) = eye(length(x)) - 2*x*x';
    
    A = H*A;
    Q = Q*H;
end
U = A;
end



