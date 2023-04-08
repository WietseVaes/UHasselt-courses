function u = femsolveld(n,D,lambda,func, a, b)
grid = GenerateMesh(a,b,n);
elmat = GenerateTopology(n);

S = AssembleMatrix(elmat, [D, lambda], grid);
f = AssembleVector(elmat,func, grid);

u = S\f;
plot(grid,u)