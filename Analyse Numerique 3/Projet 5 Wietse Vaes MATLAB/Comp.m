% Construction of linear problem

BuildMatricesandVectors;

S(IndicesN,:) = [];S(:,IndicesN) = [];
f(IndicesN) = [];

uu = S \ f;

u(Indices) = uu;
u(IndicesN) = 0;