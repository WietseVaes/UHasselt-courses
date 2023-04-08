%simulatie 
Nsim = input('hoeveel simulaties: '); 
F  = simulation_study_DNA(Nsim);
%bias berekenen
preal = 3/4-3/4*(1-4/3*0.001)^300;
dreal = -3/4*log(1-3/4*preal);
for j = 1:Nsim
    for i = 1:size(F,2)
        means(j,i) = mean(F(1:j,i));
        vars(j,i) = var(F(1:j,i));
    end
end

for j = 1:size(means,2)
    for i = 1:size(means,1)
        bias(i,j) = abs(dreal - means(i,j));
    end
end

MASE = bias.^2 + vars;
sims = 1:Nsim;
subplot(211)
semilogy(sims,bias(:,1),sims,bias(:,2),sims,bias(:,3),sims,bias(:,4),sims,bias(:,5))
title('Fout')
xlabel('#Simulation')
legend('p1', 'p2', 'p3', 'p4', 'p5')
subplot(212)
semilogy(sims(50:end),vars(50:end,1),sims(50:end),vars(50:end,2),sims(50:end),vars(50:end,3),sims(50:end),vars(50:end,4),sims(50:end),vars(50:end,5))
title('Variantie')
xlabel('#Simulation')
legend('p1', 'p2', 'p3', 'p4', 'p5')
