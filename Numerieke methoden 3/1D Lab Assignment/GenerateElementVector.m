function f_elem = GenerateElementVector(f , x_k, x_kk)
Dx = x_kk - x_k;
f_elem = [Dx/2*f(x_k) Dx/2*f(x_kk)];