% Construction of linear problem

BuildMatricesandVectors;

% Solution of linear problem

u = S \ f;
%u(u<0) = 0;
vx = M \ (Cx*u);
vy = M \ (Cy*u);