function E = convolutie(file,filter)


A = imread(file);
A = im2double(A);

subplot(121)
imshow(A)
s = size(A);
c = ceil((size(filter))/2);
z1 = flip(A(:,s(2)-floor((size(filter,2))/2)+1:s(2),:),2);
z2 = flip(A(:,1:floor((size(filter,2))/2),:),2);
A = [z2 A z1];
clear z1 z2
s = size(A);
z1 = flip(A(s(1)-floor((size(filter,1))/2)+1:s(1),:,:));
z2 = flip(A(1:floor((size(filter,1))/2),:,:));
A = [z2;A;z1];
%{
z1 = zeros(c(2)-1,size(A,2)); %spiegelen gaat ook
B = [z1; A(:,:,1); z1];
C = [z1; A(:,:,2); z1];
D = [z1; A(:,:,3); z1];
A = cat(3,B,C,D);
z2 = zeros(size(A,1),c(1)-1);
B = [z2 A(:,:,1) z2];
C = [z2 A(:,:,2) z2];
D = [z2 A(:,:,3) z2];
A = cat(3,B,C,D);
clear B C D z1 z2
%}
x = size(A);
y = size(filter);
z = zeros(x(1),x(2));
E = cat(3,z,z,z); 
clear z


for i = c(1):x(1)-c(1)-1
    for j = c(2):x(2)-c(2)-1
        deel = A((i-(c(1)-1)):(i+(c(1)-1)),(j-(c(2)-1)):(j+(c(2)-1)),:);
        E(i,j,:) = sum(sum(deel.*filter));
    end
end



E = E(c(1):(x(1)-(c(1)-1)),c(2):(x(2)-(c(2)-1)),1:3);

subplot(122)
imshow(E/sum(sum(filter)))
end
