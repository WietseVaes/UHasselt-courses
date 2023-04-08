% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2018
%
% Solution script 2.

% clear
% close all
% clc

% n = 5;
% A = rand(n); 
% A = 100*eye(n)+A;
% 
% x_real = ones(n,1);
% b      = A*x_real;
% 
% tol = 1E-16;
[x_g,err_g,vel] = Gauss_mat(A,b,tol)

% figure
ejex = 1:length(err_g)-1;
hold on
semilogy(ejex,err_g(2:end),'*k-')
% legend('Gauss')

%% GAUSS SEIDEL
function [x,err,vel] = Gauss_mat(A,b,tol)
D = diag(diag(A));
U = -triu(A)+D; 
L = -tril(A)+D;

Cg= inv(D-L)*U;
bg= inv(D-L)*b;

sp_g = max(abs(eig(Cg)));
vel  = -log(sp_g);
if sp_g>=1
    error('the method does not converge')
end

%% Gauss Method
x = zeros(size(A,1),1);
err(1) = norm(A*x-b);
i=1;
while err(i) > tol
    x = Cg*x + bg;
    i = i+1;
    err(i)= norm(Cg^i*err(1));
end
end
