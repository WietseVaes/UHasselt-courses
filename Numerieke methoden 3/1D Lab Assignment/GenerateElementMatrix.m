function S_elem = GenerateElementMatrix(karak, x_k, x_kk)
Dx = x_kk-x_k; D = karak(1); lambda = karak(2);
Rij = D*[1, -1]/Dx + lambda*Dx*[2, 1]/6;
S_elem(1,:) = Rij; S_elem(2,:) = fliplr(Rij);