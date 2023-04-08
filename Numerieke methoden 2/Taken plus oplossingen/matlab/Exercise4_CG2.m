% Numerieke technieken en optimalisatie
% Prof. Dr. Jochen Schütz
% MSc. Manuela Bastidas
%
% Hasselt University
% 2018
%
% Solution script 4_3.

% CG METHOD
clc 
clear 

global tol
tol = 1E-6;

n = 10;
A = gallery('tridiag',n,-1/2,1,-1/2);
B = zeros(n,1); 
B(1) = 1/2;

Prob_init = ones(n,1);

[Prob] = GCmethod(A,B,Prob_init);

figure 
plot(Prob(:,end))
ylabel('Probability')
xlabel('Position')
title('CG Solution')

%% Monte Carlo simulation
n_sim    = 1000;    % number of Monte Carlo samples

for i=1:n_sim
    disp('Simulation')
    disp(i)
    
    posit    = (1:n-1)';
    probab   = zeros(n,1);
    final    = 0;
    
    while final < n
        
    next                = -ones(n,1);
    next(rand(n,1)>0.5) = 1;
    
    change          = find(posit<n&posit>0);
    posit(change)   = min(posit(change)+next(change),n);
    probab(posit==n)= -1;
    probab(posit==0)=  1;
    
    final = n-length(change);
    end
    
    Monte(:,i) = probab;
    Monte(probab<0,i) = 0;
end

Prob_monte = sum(Monte,2)./n_sim;

figure 
plot(Prob_monte)
ylabel('Probability')
xlabel('Position')
title('Monte Carlo Solution')
  
% monte

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