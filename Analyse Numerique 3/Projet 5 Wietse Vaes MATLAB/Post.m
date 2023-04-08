%{
figure(1);
subplot(121);
trisurf(elmat,x,y,u);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer'); title('Approximation');
%}
sol = zeros(size(x));
for index1 = 1 : length(x)
    if Theta(index1) == 2*pi
      sol(index1) = 0;
    elseif Rho(index1) < 0.5
        sol(index1) = Rho(index1)^(pi/alpha)*sin(pi/alpha*Theta(index1));
    else
        sol(index1) = (1+cos(2*pi*(Rho(index1)-0.5)))/2*Rho(index1)^(pi/alpha)*sin(pi/alpha*Theta(index1));
    end
end
%{
subplot(122);
trisurf(elmat,x,y,sol);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer'); title('Solution');
sgtitle(['alpha = ', num2str(alpha)]) 
figure(3);
trisurf(elmat,x,y,abs(sol'-u));  
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer');title(['Abs of error: alpha = ', num2str(alpha)]);
%}
Er = sol'-u;

clear sol u uu
L2err = 0;
for index1 = 1:size(elmat,1)
    xc = x(elmat(index1,:));
    yc = y(elmat(index1,:));
    Delta = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)])/2;

    L2err = L2err + sum(Er(elmat(index1,:)).^2)*Delta/3;
end
L2err = sqrt(L2err);

