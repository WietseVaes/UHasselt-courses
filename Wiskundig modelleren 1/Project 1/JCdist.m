function Y = JCdist(sequ0, sequT)
%JCDIST berekent de Jukes-Cantor afstand van een beginsequence sequ0 tot
%een eindsequence sequT
n = length(sequ0);
counter = 0;
if n ~= length(sequT)
    error('De DNA sequences moeten dezelfde lengte hebben')
end

for i = 1:n
    if sequ0(i) ~= sequT(i)
        counter = counter + 1;
    end
end
p = counter/n ;         %de proportie locaties die verschillen tussen sequ0 en sequT
Y = -3/4 * log(1 - 3/4*p);
