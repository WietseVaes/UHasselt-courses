function oef6(file)
A = imread(file);
A = im2double(A);
figure(1)
imshow(A)
A = round(A*5)/5;
figure(2)
imshow(A)
end

