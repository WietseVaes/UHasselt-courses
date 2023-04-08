clear x y d elmat Theta Rho
alpha = 0.1;
n = 25;
t = linspace(0,alpha,n);
R = linspace(0,1,n);

x = [];
y = [];
for index1 = 1:length(R)
    x = [x,R(index1)*cos(t)];
    y = [y,R(index1)*sin(t)];
end
x = x';
y = y';

d=delaunayTriangulation(x(:),y(:));
x = d.Points(:,1);y = d.Points(:,2);
elmat = d.ConnectivityList;
[Theta,Rho] = cart2pol(x,y);
Theta(Theta<0) = Theta(Theta<0) + 2*pi;
Theta(Theta==2*pi) = 0;

for index1 =  size(elmat,1): -1: 1
    if (any(Theta(elmat(index1,:)) <= eps ) && any(Theta(elmat(index1,:)) >= alpha-eps))
        elmat(index1,:) = [];
    end
end


figure(); hold on;
plot([x(elmat(1,1)),x(elmat(1,2))],[y(elmat(1,1)),y(elmat(1,2))])
for i = 2:size(elmat,1)
    for j = 0:2
        plot([x(elmat(i,mod(j,3)+1)),x(elmat(i,mod(j+1,3)+1))],[y(elmat(i,mod(j,3)+1)),y(elmat(i,mod(j+1,3)+1))])
    end
end

n = length(x);
IndicesN = [];
Indices = [];
for index1 = 1:length(Theta)
    if Theta(index1) <= eps || Theta(index1) >= alpha - eps
        IndicesN = [IndicesN,index1];
    else
        Indices = [Indices, index1];
    end
end

topology = 3; topologybnd = 2;
