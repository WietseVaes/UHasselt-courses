function F = compseq(sequ1,sequ2)
% compseq.m
%
% usage: F=compseq(seq1,seq2)
%
% Compute frequencies of various pairs of bases appearing at 
% same site in two DNA sequences. F is a 4x4 array, with
% bases in seq1 along top, seq2 along side, in order
% A,G,C,T
%
% 8/2/03


s1len = length(sequ1); s2len = length(sequ2);
if (s1len ~= s2len) 
   error('Sequences are not of same length');
end

F = zeros(4,4);
base = ['A' 'G' 'C' 'T'];

for j = 1:4
   s1sites = (sequ1 == base(j));
   for i = 1:4
      F(i,j) = sum( s1sites & (sequ2 == base(i) ) );
   end
end

numsites = sum(sum(F));
if numsites ~= s1len
   disp([num2str(s1len-numsites),' sites were ignored due to gaps or other characters.'])
end


