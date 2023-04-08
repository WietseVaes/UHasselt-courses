function [M1 , M2] = oef2

M1 = [1:50];
M1 = reshape(M1,[10,5]).';

for k = 1:50
    i = 1;
    j = k;
    while j>10
        j = j-10;
        i = i+1;
    end
    M2(i,j) = k;
end
end