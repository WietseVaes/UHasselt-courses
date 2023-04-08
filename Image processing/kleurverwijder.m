function kleurverwijder(file)
A = imread(file);
subplot(221)
imshow(A)
for i = 1:3
    B = A;
    B(:,:,i) = zeros(size(A,1),size(A,2));
    subplot(2,2,i+1)
    imshow(B)
end
end
