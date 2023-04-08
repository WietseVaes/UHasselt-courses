function A = saturatie(a,A)
subplot(121)
imshow(A)
s = max(max(max(A)));
for i = 1:size(A,1)
    for j = 1:size(A,2)
        A(i,j,:) = (A(i,j,:)./s).^(1/a);
    end
end
clear i j k
subplot(122)
imshow(A)