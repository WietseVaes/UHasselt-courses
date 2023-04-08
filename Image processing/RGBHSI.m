function [H,S,I]=RGBHSI(file)
A = imread(file);
A = im2double(A);
theta = acos(1/2*(A(:,:,1)-A(:,:,2)+A(:,:,1)-A(:,:,3))/((A(:,:,1)-A(:,:,2))^2+(A(:,:,1)-A(:,:,3))*(A(:,:,2)-A(:,:,3))+0.00001)^(1/2));

for i = 1:size(theta,1)
    for j = 1:size(theta,2)
        if A(i,j,3) <= A(i,j,2)
            H(i,j,:) = theta(i,j,:);
        else
            H(i,j,:) = 2*pi - theta(i,j,:);
        end
    end
end

for i = 1:size(A,1)
    for j = 1:size(A,2)
        S(i,j) = 1-(3*min([A(i,j,1),A(i,j,2),A(i,j,3)])/(A(i,j,1)+A(i,j,2)+A(i,j,3)));
    end
end

I = (A(:,:,1)+A(:,:,2)+A(:,:,3))/3;
end
