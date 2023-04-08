function f = AssembleVector(elmat,func, grid)
n = length(grid); f = zeros(n,1);
for i = 1:(n-1)
    f_elem = GenerateElementVector(func , grid(i), grid(i+1));
    for j = 1:2
        f(elmat(i,j))=f(elmat(i,j))+f_elem(j);
    end
end