figure; 
u = femsolveld(100,1,1,@(x) 1, 0, 1); title('Opdracht 12');

lambdas = [10^-4 10^-8 10^-16, 0];
n = 100;
figure;
for i  =  1:4
    lambda = lambdas(i);
    subplot(2,2,i)
    u = femsolveld(n,1,lambda,@(x) 1, 0, 1); title(['lambda = ', num2str(lambda)]);
end
%{
figure;
hold on
for n = [10, 100, 1000, 10000, 11000]
    u = femsolveld(n,1,1,@(x) 1, 0, 1);
end
legend("10", "100", "1000", "10000", "11000")
hold off
%}
figure;
hold on
c = [-20*(exp(1)*cos(20)-1)/(401*(exp(2)-1)),20*exp(1)*(exp(1)-cos(20))/(401*(exp(2)-1))];
for n = [10, 20, 40, 80, 160]
    u = femsolveld(n,1,1,@(x) sin(20*x), 0, 1);
    x = linspace(0,1,n);
    sqrt(sum((exp(x)*c(1)+c(2)*exp(-x)+sin(20*x)/401-u').^2))
end
%B = [1 -1; exp(1) exp(-1)]; b = [-20/401; -20/401*cos(20)];c = B^(-1)*b; %fout??? handmatig uitgerekend
plot(x, exp(x)*c(1)+c(2)*exp(-x)+sin(20*x)/401,'-.o');
legend("n = 10", "n = 20", "n = 40", "n = 80", "n = 160", "exact")
hold off
