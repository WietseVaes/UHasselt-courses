function elmat = GenerateTopology(n)
i = 1:(n-1);
elmat(i,1) = i; elmat(i, 2) = i+1;