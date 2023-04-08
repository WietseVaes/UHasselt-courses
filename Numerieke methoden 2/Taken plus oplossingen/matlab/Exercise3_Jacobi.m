% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2018
%
% Solution script 2.

clear
close all
clc

n = 100;
A = rand(n);
A = 100*eye(n)+A;

x_real = ones(n,1);
b      = A*x_real;

tol = 1E-16;
[x_j,err_j, vel_j] = Jacobi_mat(A,b,tol)

figure
semilogy(1:length(err_j)-1,err_j(2:end),'*r-')
% legend('Jacobi')

%% Jacobi

function [x,err, vel] = Jacobi_mat(A,b,tol)
D = diag(diag(A));
U = -triu(A)+D;
L = -tril(A)+D;

Cj= inv(D)*(L+U);
bj= inv(D)*b;

sp_j = max(abs(eig(Cj)));
vel  = -log(sp_j);
if  sp_j >=1
    error('the method does not converge')
end

%% Jacobi's method
x  = zeros(size(A,1),1);
err(1) = norm(A*x-b);
i=1;
while err(i) > tol
    x = Cj*x + bj;
    i = i+1;
    err(i)= norm(Cj^i*err(1));
end
end
