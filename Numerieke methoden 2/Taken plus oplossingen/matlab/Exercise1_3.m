% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2019

clc
clear all
close all

%% Exercise 2.3.2)
A = [ 1 1/2; 1/2 1/3]

% normA  = sqrt(max(eig(A'*A)))
% normA1 = norm(A,2)
condA  = cond(A)

b1 = [3/2 1]'
b2 = [3/2 5/6]'

sol1 = A\b1
sol2 = A\b2

%%
err1 = A*sol1-b2
err2 = A*sol2-b1

cota1 = condA*norm(inv(A)*b1)*norm(b1-b2)/norm(b1)
cota2 = condA*norm(inv(A)*b2)*norm(b1-b2)/norm(b2)

delta_X = norm(sol1-sol2)