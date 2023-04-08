function buhjoh(file)

B = imread(file);
B = im2double(B);
A = rgb2ycbcr(B);
Y = A(:,:,1);
Cb = A(:,:,2);
Cr = A(:,:,3);

coords = zeros(size(Y));

for i = 2 :0.5 :7.5
    coords(:,:,2*i-3) = (abs(Cb)+abs(Cr))./Y<i;
end
montage(coords(:,:,:),'size',[2,6])
