
clear xc
clear yc
clear Selem

xc = x(elmat(i,:));
yc = y(elmat(i,:));

Delta = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)])/2;

B_mat = [1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)] \  eye(3);

beta  = B_mat(2,1:3);
gamma = B_mat(3,1:3);

Selem = abs(Delta)*(beta'*beta+gamma'*gamma);
