%oef 7
%b)
n = 8
%i = 1:n
%rij = sin(1./i).*i
X = []
for k = 1:n
    rij = sin(1/k).*k
    X = [X, rij]
end
%plot(1:n,rij)
plot(1:n,X)