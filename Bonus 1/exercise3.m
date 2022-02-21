a = [1 1 1/4]; % coefficient of nominator 
b = [1 0 1/4 0]; % coefficient of denominator 
[roots, polas , k ] = residue(a,b)

% The partial fraction expansion found is: 
%               -1i         i          1
% H(z) = 0 + --------- + ------- +  -----------
%               0.5i     - 0.5i         1??