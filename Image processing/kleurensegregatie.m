function kleurensegregatie(file)
A = imread(file);
B = A;
B(:,:,1) = ones(size(B,1),size(B,2));
B(:,:,2) = ones(size(B,1),size(B,2));
C = A;
C(:,:,2) = ones(size(B,1),size(B,2));
C(:,:,3) = ones(size(B,1),size(B,2));
D = A;
D(:,:,1) = ones(size(B,1),size(B,2));
D(:,:,3) = ones(size(B,1),size(B,2));
subplot(221)
imshow(A)
subplot(222)
imshow(B)
subplot(223)
imshow(C)
subplot(224)
imshow(D)
end