function S = AssembleMatrix(elmat, karakteristics, grid)
n = length(grid); S = zeros(n);
for i = 1:n-1
    S_elem = GenerateElementMatrix(karakteristics, grid(i), grid(i+1));
    for j = 1:2
        for k = 1:2
            S(elmat(i,j),elmat(i,k)) = S(elmat(i,j),elmat(i,k)) + S_elem(j,k);
        end
    end
end