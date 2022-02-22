 a = [1 1 1/4]; % coefficient of nominator 
 b = [1 0 1/4 0 0]; % coefficient of denominator 
% [roots, polas , k ] = residue(a,b)
% [roots, polas , k ] = residue(a,b)
[ h , t ] = impz( a , b )
% sys = ss(residue(a,b))
% isstable(sys) % ????//??
%% what tp dp wit hcomplex 

% The partial fraction expansion found is: 
%                   -2      -2           4         1
% H(z) =   0 +  --------- + ------- +  ------ + -----
%               z - 0.5i    z + 0.5i     z        z

%                   -2z      -2z                
% H(z) =   0 +  --------- + ------- +  4 + 1
%               z - 0.5i    z + 0.5i            

