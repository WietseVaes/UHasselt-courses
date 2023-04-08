clear all
KS = [1,2,4,6];
Alphas = [0.1, 3.5*pi/2,3.8*pi/2, 3.99*pi/2];
for index80 = 1:length(Alphas)
    alpha = Alphas(index80);
    for index90 = 1:length(KS)
        KK = KS(index90);
        All
        L2Errors(index90,index80) = L2err;
    end
end

figure();
semilogy(KS,L2Errors(:,1),'-*')
hold on
for index80 = 2:size(L2Errors,2)
    semilogy(KS,L2Errors(:,index80),'-*')
end
xlabel('k')
ylabel('L2 norm')
legend('0.1',  '3.5pi/2', '3.8pi/2', '3.99pi/2')
for index80 = 1:length(Alphas)
    for index90 = 2:length(KS)
        L2ordre(index90-1,index80) = log(L2Errors(1,index80)/L2Errors(index90,index80))/log(KS(index90));
    end
end

KS = [1,2,4,6];
figure();
semilogy(KS(2:length(KS)),L2ordre(:,1),'-*')
hold on
for index80 = 2:size(L2ordre,2)
    semilogy(KS(2:length(KS)),L2ordre(:,index80),'-*')
end
xlabel('k')
ylabel('Convergence order estimate')
legend('0.1',  '3.5pi/2', '3.8pi/2', '3.99pi/2')