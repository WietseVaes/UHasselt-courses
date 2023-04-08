function [x,y] = GEMeenvoudig(A,b) 

%A is een matrix en b is een vector

n = max(size(A));

for i=1:n-1
    
    for r=i+1:n
        m(r,i) = - A(r,i)/A(i,i);
        b(r) = b(r) + m(r,i)*b(i);
        
        for j=i:n
            A(r,j) = A(r,j) + m(r,i)*A(i,j);
        end
        
    end
    
end
[x]= [A];
[y] = [b]; 

