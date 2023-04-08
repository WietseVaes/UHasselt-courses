function [M1 , M2] = oef3(d1,d2)

d11 = mod([1:d2],2);
d12 = mod([1:d2]+1,2);
for i = 1:d1
    if mod(i,2) == 1
        M1(i,:) = d11;
    else
        M1(i,:) = d12;
    end
end

if mod(d1,2) == 1
    M2 = mod([1:d1*d2],2);
    M2 = reshape(M2, [d1,d2]);
else
    M2 = mod([1:(d1+1)*d2],2);
    M2 = reshape(M2, [d1+1,d2]);
    M2 = M2(1:d1,:);
end

    
        