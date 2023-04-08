function f = trunccardser(n)
xvalue = linspace(-20,20,1000);
f = zeros(2,length(xvalue));
Omega = [1, 0.8];
for i = 1:2
    X = pi/Omega(i);
    for k = -n:n
        if k == 0
            f(i,:) = f(i,:) + 4/3*(sinc(Omega(i)*xvalue/pi));
        else
            f(i,:) = f(i,:) + 4*(sin(k*X)-k*X*cos(k*X))/(k*X)^3*(sinc(Omega(i)*xvalue/pi-k));
        end
    end
end
figure(3)
set(gcf,'color','w');
plot(xvalue,4.*(sin(xvalue)-xvalue.*cos(xvalue))./xvalue.^3,xvalue, f(2,:))
legend('4*(sin(x)-x*cos(x))/x^3','Omega=0.8','Omega=0.8')
end