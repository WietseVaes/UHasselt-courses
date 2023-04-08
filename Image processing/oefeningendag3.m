f = imread("testimage.gif");
f = double(f)/255; %(=) f = im2double(f)
f = 1-f; f = flipud(f);
figure(1); 
pcolor(f); 
shading interp; 
colormap("gray"); 
axis square;
figure(2); 
surf(f); 
shading interp;
%h = ones(5)/25;
%h = ones(7)/49;
h = ones(3)/9;
g = conv2(f,h);
figure(3)
pcolor(g); 
shading interp; 
colormap("gray"); 
axis square;
figure(4);
surf(g); 
shading interp;

F = fft2(f); % 2D snelle FT, zie boek sectie 4.11.3
F = fftshift(F); % verschuif centrum FT naar midden beeld
H = fftshift(fft2(h)); % idem voor H

figure(5)
subplot(121)
surf(log10(abs(F))); shading interp; % log-amplitude als 3D opp.
subplot(122)
surf(H); shading interp;

F = fftshift(fftn(f,size(f)+size(h)));
H = fftshift(fftn(h,size(f)+size(h)));

figure(6)
subplot(121)
surf(log10(abs(F))); shading interp; % log-amplitude als 3D opp.
subplot(122)
surf(log10(abs(H))); shading interp; % log-amplitude als 3D opp.

G = F .* H; % puntsgewijze vermenigvuldiging!
surf(log10(abs(G))); shading interp; % log-amplitude als 3D opp.

g = ifft2(ifftshift(G)); % de ’i’ staat voor ’invers’
g = real(g); % verwijder ’parasitaire’ imaginaire componenten

figure(7)
pcolor(g)
shading interp; 
colormap("gray"); 
axis square;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
f = gijzer("rose.jpg");
s = size(f);
mu = ceil(s(1)/2);
mv = ceil(s(2)/2);
for u = 1:size(f,1)
    for v = 1:size(f,2)
        Hu(u,v) = i*(u - mu);
        Hv(u,v) = i*(v - mv);
    end
end
subplot(121); surf(imag(Hu));subplot(122); surf(imag(Hv));

F = fftshift(fft2(f));
Gu = F .* Hu;
Gv = F .* Hv;
gx = real(ifft2(ifftshift(Gu)));
gy = real(ifft2(ifftshift(Gv)));
subplot(121)
pcolor(gx)
shading interp; 
colormap("gray"); 
axis square;
subplot(122)
pcolor(gy)
shading interp; 
colormap("gray"); 
axis square;

hx = fftshift(ifft2(ifftshift(Hu)));
hy = fftshift(ifft2(ifftshift(Hv)));

surf(real(hx(mu+[-10:10], mv+[-10:10])))
surf(real(hy(mu+[-10:10], mv+[-10:10])))

g = sqrt(gx .* gx + gy .* gy); % puntsgewijs product!!

subplot(121)
surf(g)
shading interp 
colormap default
subplot(122)
pcolor(g)
shading interp; 
colormap default ; 
axis square;


h = sqrt( Hu.* Hu + Hv .* Hv); % puntsgewijs product!!
pcolor(real(ifft2(ifftshift(F.*h))))
shading interp; 
colormap("gray"); 
axis square;
surf(real(ifft2(ifftshift(F.*h))))
colormap("gray"); 