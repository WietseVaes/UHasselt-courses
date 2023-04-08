figure(2);
trisurf(elmat,x,y,u); colormap jet; title(['Transfer coefficient K = ', num2str(trans_rate)]); shading interp; %colorbar; set(gcf,'renderer','zbuffer');
figure(3);
trisurf(elmat,x,y,u);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer'); title(['Transfer coefficient K = ', num2str(trans_rate)]);
figure(4);
quiver(x,y,vx',vy'); axis([-1 1 -1 1]); title(['Transfer coefficient K = ', num2str(trans_rate)]);
%{
figure(3);
subplot(121)
trisurf(elmat,x,y,u);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer'); title(['Transfer coefficient K = ', num2str(trans_rate)]);
subplot(122)
quiver(x,y,vx',vy'); axis([-1 1 -1 1]); title(['Transfer coefficient K = ', num2str(trans_rate)]);
%}
%min(u)