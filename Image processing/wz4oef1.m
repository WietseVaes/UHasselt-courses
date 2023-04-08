% Werkzitting 4 opgaves bij 1 digitalisatie van drukwerk
%lucraak is de krantenfoto

%oef 1
f = imread('lucraak.tif');
f = double(f)/255; f = flipud(f); 

figure(1)
pcolor(f); shading interp; colormap('gray');

%oef 2
F = real(fftshift(fft2(f)));

figure(2)
surf(log10(abs(F))); shading interp;

%oef 3 

[m,n] = size(f);
mi = floor(m/2);
mj = floor(n/2);
N = 1;
D0 = 10;
%laplaciaan parabool
for i = 1:m
    for j = 1:n
        L(i,j) = 1/(1+(sqrt((i-mi)^2+(j-mj)^2)/D0)^(2*N));
    end
end
%}

L2=L(mi+[-65:65],mj+[-65:65]); L2 = 1-L2;

F2=F;
F2(350+[-65:65],170+[-65:65]) = F2(350+[-65:65],170+[-65:65]) .* L2;
F2(150+[-65:65],170+[-65:65]) = F2(150+[-65:65],170+[-65:65]) .* L2;
F2(350+[-65:65],410+[-65:65]) = F2(350+[-65:65],410+[-65:65]) .* L2;
F2(150+[-65:65],410+[-65:65]) = F2(150+[-65:65],410+[-65:65]) .* L2;

figure(3)
surf(log10(abs(F2))); shading interp;

G = F .* L;

G = G - sum(sum(G))/(size(G,1)*size(G,2));

figure(3)
surf(log10(abs(G))); shading interp;

Gp = real(ifft2(ifftshift(G))); 
figure(4)
pcolor(Gp); colormap('gray'); shading interp;

Fp = f - (mean(mean(f))/mean(mean(Gp)))*Gp;
%fp = real(ifft2(ifftshift(Fp)));
figure(5)
pcolor(Fp); colormap('gray'); shading interp;

