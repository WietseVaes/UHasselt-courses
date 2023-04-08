function A = matrix_maker(n)
N = n^2;
A = zeros(N);
for i = 1:N
    if i == 1
        A(i,i) = 1; A(i,i+1) = -1/2; A(i,i+n) = -1/2;
    elseif i == n
        A(i,i-1) = -1/2; A(i,i) = 2; A(i,i+n) = -1;
    elseif i == (n-1)*n+1
        A(i,i-n) = -1; A(i,i) = 2; A(i,i+1) = -1/2;
    elseif i == n^2
        A(i,i-n) = -1; A(i,i-1) = -1; A(i,i) = 4;
    elseif i <= n-1
        A(i,i-1) = -1/2; A(i,i) = 2; A(i,i+1) = -1/2; A(i,i+n) = -1;
    elseif mod(i,n) == 1
        A(i,i-n) = -1/2; A(i,i) = 2; A(i,i+1) = -1; A(i,i+n) = -1/2;
    elseif mod(i,n) == 0
        A(i,i-n) = -1; A(i,i-1) = -1; A(i,i) = 4; A(i,i+n) = -1;
    elseif i>= (n-1)*n+2
        A(i,i-n) = -1; A(i,i-1) = -1; A(i,i) = 4; A(i,i+1) = -1;
    else
        A(i,i-n) = -1; A(i,i-1) = -1; A(i,i) = 4; A(i,i+1) = -1; A(i,i+n) = -1;
    end
end