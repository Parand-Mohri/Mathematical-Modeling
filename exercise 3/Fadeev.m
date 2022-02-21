function [b,a,S] = Fadeev(A,B,C,D)
%% Algorithm for computing transfer function from state-space representation
%    Inputs: state-space representation by specifying A, B, C, D
%    outputs: coefficients of the numerator polynomial b of transfer function,
%    the coefficients of the denominator polynomial a of transfer function
%    and a cell array S containing S1 through Sn
a1 = - trace(A) = - trace(A * S1) / 1;% trace = sum of entries in the main diagnal 
a2 = - trace(A *S2) /2
% ak = -trace(A* Sk) / k 
S1 = eye(lenght(A));
S2 = A * S1 + a1*eye(length(A));
S3 = A * S2 + a2*eye (length(A));
% Sk = A * Sk-1 + ak-1 * eye(length(A));
end


