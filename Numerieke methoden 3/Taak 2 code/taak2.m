function taak2(n)
h = 1/n;
b = h^2*ones(n^2,1);
A = matrix_maker(n);
points = A^(-1)*b;
pointsreal = reshape(points,n,n);
pointsreal = [pointsreal;zeros(1,n)];
pointsreal = [pointsreal,zeros(n+1,1)];
[X,Y] = meshgrid(0:h:1,0:h:1);
f1 = 1/4*(1-(X.^2+Y.^2));
f2 = 1/2*(1-(X.^2+Y.^2));
Omgeving = X.^2+Y.^2<=1;
X(~Omgeving) = NaN;Y(~Omgeving)= NaN; pointsreal(~Omgeving)= NaN;f1(~Omgeving)= NaN; f2(~Omgeving)= NaN;
randen = min([min(min(pointsreal)),min(min(f1)),min(min(f2))]):0.06:max([max(max(pointsreal)),max(max(f1)),max(max(f2))]);
surf(X,Y,pointsreal); shading interp;
hold on
surf(X,Y,f1); shading interp;
surf(X,Y,f2); shading interp;
zlim([min([min(min(pointsreal)),min(min(f1)),min(min(f2))]) max([max(max(pointsreal)),max(max(f1)),max(max(f2))])])

figure(2); hold on;
contour(X,Y,pointsreal,randen,'ShowText','on')
contour(X,Y,f1,randen,'blue','ShowText','on');
contour(X,Y,f2,randen,'red','ShowText','on');

