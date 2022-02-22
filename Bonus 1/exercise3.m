 a = [1 1 1/4]; % coefficient of nominator 
 b = [1 0 1/4 0 0]; % coefficient of denominator
 [roots, polas , k ] = residue(a ,b);
% sys = ss(residue(a,b))
% isstable(sys) % ????//??
% what tp dp wit hcomplex 

% The partial fraction expansion found is: 
%  H(z)             -2      -2           4       1
% ----- =  0 +  --------- + ------- +  ------ + -----
%   z            z - 0.5i    z + 0.5i     z      z^2

%                   -2z       -2z       1          
% H(z) =   0 +  --------- + ------- +  --- + 4 
%                z - 0.5i    z + 0.5i   z

%                 -4z^2        1  
% H(z) =   0 +  --------- + ------ + 4
%                z^2 + 0.25      z

% so from here we need to transform h[k] to H(z) but, because there is a
% factor of z^2 is in the nominator i dont know how 
