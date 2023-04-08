function [A] = HSIRGB(H,S,I)
for i = 1:size(H,1)
    for j = 1:size(H,2)
        if 0<=H(i,j)<2*pi/3
            B(i,j) = I(i,j).*(1-S(i,j));
            R(i,j) = I(i,j).*(1+(S(i,j).*cos(H(i,j)))/(cos(pi/3-H(i,j))));
            G(i,j) = 3*I(i,j)-R(i,j)-B(i,j);
        elseif 2*pi/3<=H(i,j)< 4*pi/3
            H(i,j)=H(i,j)-2*pi/3;
            R(i,j) = I(i,j).*(1-S(i,j));
            G(i,j) = I(i,j).*(1+(S(i,j).*cos(H(i,j)))/(cos(pi/3-H(i,j))));
            B(i,j) = 3*I(i,j)-R(i,j)-B(i,j);
        else
            H(i,j)=H(i,j)-4*pi/3;
            G(i,j) = I(i,j).*(1-S(i,j));
            B(i,j) = I(i,j).*(1+(S(i,j).*cos(H(i,j)))/(cos(pi/3-H(i,j))));
            R(i,j) = 3*I(i,j)-R(i,j)-B(i,j);
        end
    end
end
A = cat(3,R,G,B);