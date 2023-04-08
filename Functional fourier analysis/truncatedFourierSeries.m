function [f_hat, sN] = truncatedFourierSeries( N)
    f_hat = zeros(1,2*N+1);
    
    for k = -N : N
        f_hat(k + N+1) = k/(1+abs(k));
    end
    
    sN = @(x) f_hat(N+1);
    for k = 1 : N
        a = f_hat(N+1+k)+f_hat(N+1-k);
        b = f_hat(N+1+k)-f_hat(N+1-k);
        sN = @(x) sN(x) + a*cos(k*x) + b*i*sin(k*x);
        fplot(sN)
    end
f = @(x) 1/sqrt(2*pi)*integral(@(xi) (xi)/(1+xi)*exp(i*xi*x),-99,99)
    %err = @(x) abs(f(x)-sN(x));
    %L2Err = sqrt(integral(@(x) err(x).^2, -pi, pi))/(2*pi);
    %x_values = linspace(-pi+1e-3,pi-1e-3,1000);
    %LInfErr = max(err(x_values));
end
