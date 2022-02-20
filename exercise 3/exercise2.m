% syms z
a = coeffs((z + 14)* (z - 13)* (z + 13))
fliplr(a)
% a = [1 14 -159 -2366];
b = [1 -1/4 -1/4 1/16];
% [roots, polas , k ] = residue(a,b)
% 
a1 = [1 1/3 -1/12];
b1 = [1 -4/3 5/6 1/16];
[roots1, polas1 , k1 ] = residue(a1,b1)


% The partial fraction expansion found is: 
%               -1i         i          1
% H(z) = 0 + --------- + ------- +  -----------
%               0.5i     - 0.5