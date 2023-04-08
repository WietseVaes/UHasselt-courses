f=imread('lucraak.tif');
f=double(f);                    
f=f/255;                       
f=flipud(f);                    
figure(1); pcolor(f); shading interp; colormap('gray'); axis image

F=fftshift(fft2(f));                  
figure(2); pcolor(log10(abs(F))); shading interp; caxis([-2 4]);

D=zeros(128,128);
for i=1:128; for j=1:128; x=i-65; y=j-65; D(i,j)=(x*x+y*y); end; end;

G=exp(-0.5*D/(50));
%{
n = 1;
D0 = 50;
G = 1./(1+(D./D0).^n);
%}
O = [-25:25];
G2=G(65+O,65+O);
G2=1-G2;
figure(3); pcolor(G2); shading interp; axis image; colormap('gray');
figure(4); surf(G2); shading interp; colormap('default');

F2=F;
%verwijder enkel de 4 hoogtepunten
%{
F2(144+O,172+O) = F2(144+O,172+O) .* G2;
F2(144+O,409+O) = F2(144+O,409+O) .* G2;
F2(350+O,172+O) = F2(350+O,172+O) .* G2;
F2(350+O,409+O) = F2(350+O,409+O) .* G2;

F2b=ifftshift(F2);                 
R=ifft2(F2b);                       
R=real(R);                         
figure(7); pcolor(R); shading interp; colormap('gray'); axis image
%}
%verwijder verticale lijnen
F2 = F;
for i = 26:467
    for j = [172, 409]
        F2(i+O,j+O) = F2(i+O,j+O) .* G2;
    end
end
%verwijdert horizontale lijnen
for i = [350, 144]
    for j = 26:553
        F2(i+O,j+O) = F2(i+O,j+O) .* G2;
        F2(i+O,j+O) = F2(i+O,j+O) .* G2;
    end
end

figure(5); pcolor(log10(abs(F2))); shading interp; caxis([-2,4]);

F2b=ifftshift(F2);                 
R=ifft2(F2b);                       
R=real(R);                         
figure(6); pcolor(R); shading interp; colormap('gray'); axis image
