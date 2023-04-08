function [m] = oef4(file)
A = imread(file);
A = im2double(A);
k = size(A(:,:,1));
m = [oef1(A(:,:,1)),oef1(A(:,:,2)),oef1(A(:,:,3))];
B(:,:,1) = ones(k)*m(1);
B(:,:,2) = ones(k)*m(2);
B(:,:,3) = ones(k)*m(3);
subplot(211)
imshow(A)
subplot(212)
imshow(B)
end