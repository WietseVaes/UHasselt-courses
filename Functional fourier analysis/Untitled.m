f = @(x) exp(x);
[f_hat, sN, L2Err, LInfErr] = truncatedFourierSeries(f, 10);
figure(1)
fplot(sN, [-pi pi])
xlabel('x')
ylabel('s10(x)')

[f_hat, sN, L2Err, LInfErr] = truncatedFourierSeries(f, 20);
figure(2)
fplot(sN, [-pi pi])
xlabel('x')
ylabel('s20(x)')

[f_hat, sN, L2Err, LInfErr] = truncatedFourierSeries(f, 200);
figure(3)
fplot(sN, [-pi pi])
xlabel('x')
ylabel('s200(x)')
yline(0,'r--')
xline(0,'r--')

f = @(x) x/pi;
N = 200;
[f_hat, sN, L2Err, LInfErr] = truncatedFourierSeries(f, N);
sN = @(x) f_hat(N+1);
for k = 1 : N
        a = f_hat(N+1+k)+f_hat(N+1-k);
        b = f_hat(N+1+k)-f_hat(N+1-k);
        sN = @(x) sN(x) + a*cos(k*x) + b*i*sin(k*x);
        %fplot(sN, [-pi pi])
        %pause 
        err = @(x) abs(f(x)-sN(x));
        L2Err(k) = sqrt(integral(@(x) err(x).^2, -pi, pi))/(2*pi);
        
        x_values = linspace(-pi+1e-3,pi-1e-3,1000);
        LInfErr(k) = max(err(x_values));
end
figure(4)
hold on 
semilogy([1:N],L2Err)
xlabel('N')
semilogy([1:N],LInfErr)
ylim([0.01 1])
legend('L2 norm', 'Infinity norm')
yticks([0.01 0.1 1])
yticklabels({'10^{-2}','10^{-1}', '10^0'})
