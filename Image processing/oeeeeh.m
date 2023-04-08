A = imread('city.jpg');
A = im2double(A);
A = rgb2gray(A);
[m,n] = size(A);
B = zeros(2*m,2*n);
B(m/2:3*m/2-1,n/2:3*n/2-1) = A;
[X,Y] = meshgrid(-m+1:m,-n+1:n);
D = (sqrt(X.^2+Y.^2)).';
H = 1-exp(-D.^2/(2*max(max(D))));
imshow(H)
Af = fftshift(fft2(B));
surf(real(log10(imag(Af)))); shading interp
Filt = Af.*H;
surf(real(log10(Filt))); shading interp
AFilt = real(ifft2(ifftshift(Filt)));
AFilt = AFilt(m/2:3*m/2-1,n/2:3*n/2-1);
AFilt(AFilt<0) = 0;
imshow(AFilt)
C = A+AFilt;
K = C(:,:,[1,1,1]);
imshow(K)