
% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2018
%
% Solution script 4_2.

% CG METHOD
clc 
clear 

global tol
tol = 1E-6;

%% a) 
A = [1 2;2 5];
b = [3;7];
x0 = [10;10];

F = @(x,y)(1/2)*x.^2 + 2*x.*y + (5/2)*y.^2 - 3*x - 7*y;
[X,Y] = meshgrid(-10:0.1:10,-10:0.1:10);
figure
contour(X,Y,F(X,Y),100)

%
[xsol] = GCmethod(A,b,x0)

hold on
scatter(xsol(1,end),xsol(2,end),'fill','r')
grid minor

%% b) 
% clc 
% close all
% 
% A = [2 1;1 3];
% b = [3;4];
% x0 = [-2;4];
% 
% F = @(x,y)x.^2 + x.*y+ 3/2*y.^2-3*x-4*y;
% [X,Y] = meshgrid(-2:0.1:4,-2:0.1:4);
% figure
% contour(X,Y,F(X,Y),200)
% 
% [xsol] = GCmethod(A,b,x0)
% 
% hold on
% scatter(xsol(1,:),xsol(2,:),'fill','r')
% grid minor

%% FUNCTION CG METHOD
function [x] = GCmethod(A,b,x)
global tol
r = b - A * x;
p = r;

It = 1;
while norm(r) > tol
    alpha = r'*r / (p'*A*p);
    x(:,It+1) = x(:,It) + alpha * p;
    r1 = b - A * x(:,It+1);
    beta = r1'*r1/(r'*r);
    r=r1;
    p = r + beta *p;
    It = It + 1;
end
end