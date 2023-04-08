function B = pixelart(file,dime)
n1 = dime(1);
m1 = dime(2);
A = imread(file);
A = im2double(A);
n2 = size(A,1);
m2 = size(A,2);
n12 = floor(n2/n1);
m12 = floor(m2/m1);
B = zeros(n1,m1);
B = cat(3,B,B,B);
for i = 1 : n1
    for j = 1:m1
        B(i,j,:) = sum(sum(A([i*(2*ceil(n12/2)-1)-floor(m12/2):i*(2*ceil(n12/2)-1)+floor(m12/2)],[j*(2*ceil(m12/2)-1)-floor(m12/2):j*(2*ceil(m12/2)-1)+floor(m12/2)],:)))/(n12*m12);
    end
end
subplot(211)
imshow(A)
subplot(212)
imshow(B)