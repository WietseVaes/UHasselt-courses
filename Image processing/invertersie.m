function invertersie(file)

A=imread(file);
A=im2double(A);
A = 1-A;
imshow(A)
end