% werkzitting 4 bij 2 inverse filtering van onscherpe fotos
%oef 1
f = imread('blur.tif');
f = double(f)/255;
figure(7)
imshow(f)


G = fspecial('Gaussian', 33, 0.6);
M = f(:,:,1);
G = padarray(G, size(M)-size(G), 0, 'pre');
G = fftshift(fft2(G));

figure(5)
surf(log10(abs(G))); shading interp; colormap('gray');

for i = 1:3
    F(:,:,i) = fftshift(fft2(f(:,:,i)));
end


for i = 1:3
    F(:,:,i) = F(:,:,i) ./ (G+0.00000001);
end


for i = 1:3
    Fp(:,:,i) = real(ifft2(fftshift(F(:,:,i))));
end
figure(4)
imshow(Fp);

