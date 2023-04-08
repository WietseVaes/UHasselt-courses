function G = aniGauss
for i = 1:33
    for j = 1:33
        x = i - 17;
        y = j - 17;
        G(i,j) = exp(-0.5 * (x^2/9 + y^2));
    end
end
