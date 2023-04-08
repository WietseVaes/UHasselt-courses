function A=gijzer(file)
A = imread(file);
A = im2double(A);
%subplot(211)
%imshow(A)
A = A(:,:,1)*0.55 + A(:,:,2)*0.39+A(:,:,3)*0.06;
%subplot(212)
%imshow(A)
end