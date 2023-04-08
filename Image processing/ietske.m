file = 'cathedral.jpg';
B = imread(file);
B = im2double(B);
A = rgb2ycbcr(B);
Y = A(:,:,1);
Cb = A(:,:,2);
Cr = A(:,:,3);
T = 3; %hall: 5.5, city: 2, dog: 5, prores: 3, sky: 4, cath;3

coords = (abs(Cb)+abs(Cr))./Y<T;

Cb = double(Cb) + (0.5 - mean(mean(Cb(coords))));
Cr = double(Cr) + (0.5 - mean(mean(Cr(coords))));

figure(1)
imshow(B)
figure(2)
imshow(ycbcr2rgb(cat(3,Y,Cb,Cr)))