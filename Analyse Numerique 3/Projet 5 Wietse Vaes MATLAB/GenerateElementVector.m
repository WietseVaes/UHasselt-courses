clear felem
felem = [0,0,0];
for index1 = 1:3
    r = Rho(elmat(i,index1));
    theta = Theta(elmat(i,index1));
    if r >= 0.5
        felem(index1) = (r^(pi/alpha-1)*(1+2*pi/alpha)*pi*sin(2*pi*(r-0.5))+2*pi^2*r^(pi/alpha)*cos(2*pi*(r-0.5)))*sin(pi/alpha*theta)/3*Delta;
    end
end

