function Y = basenverdeling(sequ)
%BASENVERDELING berekent de basenverdeling van een gegeven sequence DNA (bv
%'ACGTTCAGC')
%de volgorde van de output is A, G, C, T

n = length(sequ); 
for i = 1:n
    aantalA = sum(sequ == 'A');
    aantalG = sum(sequ == 'G');
    aantalC = sum(sequ == 'C');
    aantalT = sum(sequ == 'T');
end

Y = [aantalA/n aantalG/n aantalC/n aantalT/n];
end
