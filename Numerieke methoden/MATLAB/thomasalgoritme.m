%Thomasalgoritme

%eerst gaan we de matrixen A en B vormen uit oefening 52 waarmee we moeten
%werken.
n=11
e=ones(n,1); %we vormen de matrix A met drie niet nul diagonalen waarbij op de eerste diagonaal -e (=-1) staat,
A=spdiags([-e 2*e -e],-1:1,n,n); %op de tweede diagonaal 2*e (=2) staat en op de derde diagonaal -e (=-1)staat)
A

f=@(x)x.*(1-x); %dit is onze functie f(x)
x=1/(n+1)*[1:n]'; %we maken onze vector x met x_k=k/(n+1)
B=-(n+1)^2*f(x); %dit is vector b
B

%nu gaan we mbv het thomasalgoritme de oplossing X berekenen
alpha(1)=2;
for i=2:n
   beta(i)=-1/alpha(i-1);       %al de b(i) zijn -1 in matrix A
   alpha(i)=2-beta(i)*(-1);     %al de a(i) zijn 2 in matrix A en al de c(i) zijn -1 in matirx A
end
r=beta';
s=alpha';
t=[-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1]; %al de c(i) zijn -1

L=spdiags([r e],-1:0,n,n);
U=spdiags([s t],0:1,n,n);
%nu hebben we de L en U matrix berekent.

Y(1)=B(1);
for i=2:n
    Y(i)=B(i)-beta(i)*Y(i-1);
end

X(n)=Y(n)/alpha(n);
for i=n-1:-1:1
    X(i)=(Y(i)-2*X(i+1))/alpha(i);
end
X

    