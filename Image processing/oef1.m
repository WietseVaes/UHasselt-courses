function [M] = oef1(A)
[d1, d2] = size(A);
s1 = sum(A);
s2 = sum(s1);
M = s2/(d1*d2);