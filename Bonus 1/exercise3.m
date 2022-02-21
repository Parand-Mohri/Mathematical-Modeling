% 2z-z
% H(z)      1 +  + -------
% ----- = ----------         
%   z       z + 0.3333 z - 0.5

H ( z ) = z ^2 + z + 14 / z^ 3 + 14 z

a = [1 1 1/4]; % coefficient of nominator 
b = [1 0 1/4 0 0]; % coefficient of denominator 
[roots, polas , k ] = residue(a,b)

% The partial fraction expansion found is: 
%               -1i         i            1
% H(z) = 0 + --------- + ------- +  -----------
%             z- 0.5i    z+ 0.5i       z - 0